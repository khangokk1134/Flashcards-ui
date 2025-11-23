import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/feedback_service.dart';
import 'webview_page.dart';
import 'information_page.dart';


class SettingsPage extends StatelessWidget {
  final bool isDark;
  final void Function(bool) onThemeChanged;
  final void Function(String) onLanguageChanged;
  final String langCode;

  const SettingsPage({
    Key? key,
    required this.isDark,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.langCode,
  }) : super(key: key);

  /// 📧 Mở ứng dụng email
  Future<void> _openEmailApp(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'trantheo197@gmail.com',
      queryParameters: {
        'subject': 'FlashcardsApp Support',
        'body': 'Xin chào,\n\nMình muốn góp ý về ứng dụng:\n\n',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      final bool launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('cannot_open_email'.tr())),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('device_no_email_support'.tr())),
      );
    }
  }

  /// 💬 Hộp thoại hỗ trợ
  void _showSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('support'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.email),
              title: Text('${'email'.tr()}: trantheo197@gmail.com'),
              onTap: () async {
                Navigator.of(context).pop();
                await _openEmailApp(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: Text('website'.tr()),
              onTap: () async {
                Navigator.of(context).pop();

                final Uri url = Uri.parse('https://flashcardsapp-56acc.web.app');
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication, // Mở bằng trình duyệt ngoài
                )) {
                  throw Exception('Không mở được liên kết');
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: Text('send_feedback'.tr()),
              onTap: () {
                Navigator.of(context).pop();
                _showSendFeedbackDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: Text('see_feedback'.tr()),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FeedbackPage()),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('close'.tr()),
          ),
        ],
      ),
    );
  }

  /// 📨 Hộp thoại gửi phản hồi
  void _showSendFeedbackDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('send_feedback'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'your_email'.tr(),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'feedback_hint'.tr(),
                prefixIcon: const Icon(Icons.feedback_outlined),
              ),
              maxLines: 4,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancel'.tr()),
          ),
          ElevatedButton(
            onPressed: () async {
              final msg = messageController.text.trim();
              final email = emailController.text.trim().isEmpty
                  ? null
                  : emailController.text.trim();

              if (msg.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('feedback_empty'.tr())),
                );
                return;
              }

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );

              try {
                await sendFeedbackToFirestore(message: msg, email: email);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('feedback_sent'.tr())),
                );
              } catch (e) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('feedback_error'.tr(namedArgs: {'error': e.toString()}))),
                );
              }
            },
            child: Text('send'.tr()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(title: Text('rate_app'.tr())),
          ListTile(
            title: Text('info'.tr()),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const InformationPage()),
              );
            },
          ),
          ListTile(
            title: Text('support'.tr()),
            onTap: () => _showSupportDialog(context),
          ),
          SwitchListTile(
            title: Text('dark_mode'.tr()),
            value: isDark,
            onChanged: onThemeChanged,
          ),
          ListTile(
            title: Text('language'.tr()),
            trailing: DropdownButton<String>(
              value: langCode,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
              ],
              onChanged: (val) {
                if (val != null) onLanguageChanged(val);
              },
            ),
          ),
        ],
      ),
    );
  }
}
