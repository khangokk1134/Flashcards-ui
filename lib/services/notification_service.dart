import 'dart:async';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart'; // Hỗ trợ đa ngôn ngữ

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Map<String, List<Map<String, String>>> _favoriteTopics = {};
  static Timer? _loopTimer; // ⏳ Lặp lại mỗi 10s

  static Future<void> init() async {
    tz.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> addFavoriteTopic(
      String topicName, List<Map<String, String>> words) async {
    _favoriteTopics[topicName] = words;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('fav_topics', _favoriteTopics.keys.toList());

    await _scheduleAllNotifications();
  }

  static Future<void> removeFavoriteTopic(String topicName) async {
    _favoriteTopics.remove(topicName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('fav_topics', _favoriteTopics.keys.toList());

    await _notificationsPlugin.cancelAll();
  }

  /// 🔁 Cứ 10s gửi 1 thông báo từ 1 topic ngẫu nhiên
  static Future<void> _scheduleAllNotifications() async {
    await _notificationsPlugin.cancelAll();
    _loopTimer?.cancel();

    _loopTimer = Timer.periodic(const Duration(seconds: 10), (_) async {
      if (_favoriteTopics.isEmpty) return;

      // 🔹 Chọn ngẫu nhiên 1 topic
      final topics = _favoriteTopics.entries.toList();
      final randomTopic = topics[Random().nextInt(topics.length)];
      final topicName = randomTopic.key;
      final words = randomTopic.value;

      if (words.isEmpty) return;

      // 🔹 Chọn ngẫu nhiên 1 từ trong topic
      final randomWord = words[Random().nextInt(words.length)];

      await _showInstantNotification(
        title: topicName, // 👉 Chỉ hiển thị tên chủ đề
        body:
        '${randomWord['name']} - ${randomWord['vi']}\n${randomWord['desc'] ?? ''}',
      );

      print('🔔 Gửi: $topicName → ${randomWord['name']}');
    });
  }

  /// 🧠 Hiển thị thông báo ngay lập tức
  static Future<void> _showInstantNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'flashcards_channel',
      'Flashcards Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      Random().nextInt(100000),
      title,
      body,
      details,
    );
  }

  static Future<void> cancelAll() async {
    _loopTimer?.cancel();
    await _notificationsPlugin.cancelAll();
  }
}
