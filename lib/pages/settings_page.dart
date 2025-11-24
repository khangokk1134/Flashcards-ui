import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/feedback_service.dart';
import 'information_page.dart';
import 'webview_page.dart';

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

  /// 📧 Mở email app
  Future<void> _openEmailApp(BuildContext context) async {
    final email = "trantheo197@gmail.com";
    final subject = Uri.encodeComponent("FlashcardsApp Support");
    final body = Uri.encodeComponent("Xin chào,\n\nMình muốn góp ý về ứng dụng:\n");

    final Uri gmailUri = Uri.parse("googlegmail://co?to=$email&subject=$subject&body=$body");

    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
      return;
    }

    final Uri mailtoUri = Uri.parse("mailto:$email?subject=$subject&body=$body");

    if (await canLaunchUrl(mailtoUri)) {
      await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      return;
    }

    final Uri gmailWeb = Uri.parse(
      "https://mail.google.com/mail/u/0/?view=cm&fs=1&to=$email&su=$subject&body=$body",
    );

    if (await launchUrl(gmailWeb, mode: LaunchMode.externalApplication)) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("device_no_email_support".tr())),
    );
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
              title: Text("${'email'.tr()}: trantheo197@gmail.com"),
              onTap: () async {
                Navigator.pop(context);
                await _openEmailApp(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: Text("website".tr()),
              onTap: () async {
                Navigator.pop(context);
                final Uri url = Uri.parse('https://flashcardsapp-56acc.web.app');
                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("error_opening_website".tr())),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: Text('send_feedback'.tr()),
              onTap: () {
                Navigator.pop(context);
                _showSendFeedbackDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: Text('see_feedback'.tr()),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FeedbackPage()),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr()),
          ),
        ],
      ),
    );
  }

  /// 📨 Hộp thoại gửi phản hồi
  void _showSendFeedbackDialog(BuildContext context) {
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'send_feedback'.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "your_email_optional".tr(),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: messageController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "write_feedback".tr(),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("cancel".tr()),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () async {
                      final msg = messageController.text.trim();
                      final email = emailController.text.trim().isEmpty
                          ? null
                          : emailController.text.trim();

                      if (msg.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("please_enter_feedback".tr())),
                        );
                        return;
                      }

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Center(child: CircularProgressIndicator()),
                      );

                      try {
                        await sendFeedbackToFirestore(message: msg, email: email);

                        Navigator.pop(context);
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("feedback_sent".tr())),
                        );
                      } catch (e) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${'error_sending_feedback'.tr()}: $e")),
                        );
                      }
                    },
                    child: Text("send".tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InformationPage()),
            ),
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
