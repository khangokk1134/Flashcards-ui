// lib/services/feedback_service.dart
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

/// Lấy thông tin app + thiết bị (Android / iOS)
Future<Map<String, dynamic>> _gatherDeviceAndAppInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final deviceInfoPlugin = DeviceInfoPlugin();

  Map<String, dynamic> deviceDetails = {};

  try {
    if (Platform.isAndroid) {
      final a = await deviceInfoPlugin.androidInfo;
      deviceDetails = {
        'platform': 'android',
        'manufacturer': a.manufacturer,
        'model': a.model,
        'product': a.product,
        'release': a.version.release,
        'sdkInt': a.version.sdkInt,
        'isPhysicalDevice': a.isPhysicalDevice,
      };
    } else if (Platform.isIOS) {
      final i = await deviceInfoPlugin.iosInfo;
      deviceDetails = {
        'platform': 'ios',
        'name': i.name,
        'model': i.utsname.machine,
        'systemVersion': i.systemVersion,
        'isPhysicalDevice': i.isPhysicalDevice,
      };
    } else {
      deviceDetails = {'platform': 'unknown'};
    }
  } catch (e) {
    deviceDetails = {'error': e.toString()};
  }

  return {
    'appName': packageInfo.appName,
    'packageName': packageInfo.packageName,
    'version': packageInfo.version,
    'buildNumber': packageInfo.buildNumber,
    'deviceDetails': deviceDetails,
  };
}

/// Gửi feedback lên collection 'feedback'
Future<void> sendFeedbackToFirestore({
  required String message,
  String? email, // optional
}) async {
  try {
    final info = await _gatherDeviceAndAppInfo();

    await FirebaseFirestore.instance.collection('feedback').add({
      'message': message,
      'email': email,
      'timestamp': FieldValue.serverTimestamp(),
      'appName': info['appName'],
      'packageName': info['packageName'],
      'appVersion': info['version'],
      'buildNumber': info['buildNumber'],
      'deviceDetails': info['deviceDetails'],
    });
  } catch (e) {
    // truyền lỗi lên bên gọi để hiển thị nếu cần
    rethrow;
  }
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  String _formatTimestamp(Timestamp? t) {
    if (t == null) return '';
    final d = t.toDate();
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')} ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final stream = FirebaseFirestore.instance
        .collection('feedback')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text('User Feedback')),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return const Center(child: Text('Chưa có feedback nào'));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final d = docs[index];
              final data = d.data() as Map<String, dynamic>;
              final message = data['message'] ?? '';
              final email = data['email'] ?? '';
              final timestamp = data['timestamp'] as Timestamp?;
              final device = data['deviceDetails'] ?? {};
              final appVersion = data['appVersion'] ?? '';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(message),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (email != '') Text('Email: $email'),
                      Text('Time: ${_formatTimestamp(timestamp)}'),
                      if (appVersion != '') Text('App: $appVersion'),
                      if (device is Map && device.isNotEmpty)
                        Text('Device: ${device['model'] ?? device['manufacturer'] ?? device.toString()}'),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Feedback detail'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Message: $message'),
                              const SizedBox(height: 8),
                              if (email != '') Text('Email: $email'),
                              const SizedBox(height: 8),
                              Text('Time: ${_formatTimestamp(timestamp)}'),
                              const SizedBox(height: 8),
                              Text('App version: $appVersion'),
                              const SizedBox(height: 8),
                              Text('Device info:'),
                              Text(device.toString()),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

