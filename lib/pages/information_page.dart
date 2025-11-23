import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flashcardsapp/pages/webview_page.dart';

// 🔹 Link Privacy Policy chính thức trên GitHub Pages
const String PRIVACY_POLICY_URL =
    'https://khangokk1134.github.io/Flashcards-ui/privacy_policy.html';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  // Hàm mở Email
  Future<void> _openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'trantheo197@gmail.com',
      queryParameters: {
        'subject': 'FlashcardsApp Information',
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    }
  }

  // Hàm mở Website
  Future<void> _openWebsite() async {
    final Uri url = Uri.parse('https://flashcardsapp-56acc.web.app');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  // Hàm mở Privacy Policy (tự động xử lý Web / App)
  Future<void> _openPrivacyPolicy(BuildContext context) async {
    final Uri url = Uri.parse(PRIVACY_POLICY_URL);

    if (kIsWeb) {
      // Flutter Web → mở tab mới
      await launchUrl(url, mode: LaunchMode.externalApplication);
      return;
    }

    // App Android/iOS → mở WebView trong app
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => WebViewPage(
          url: PRIVACY_POLICY_URL,
          title: 'Privacy Policy',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Information")),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("App Name"),
            subtitle: Text("Flashcards Languages"),
          ),
          const ListTile(
            leading: Icon(Icons.verified),
            title: Text("Version"),
            subtitle: Text("1.0.0"),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Developer"),
            subtitle: Text("Théo Trần"),
          ),

          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Contact"),
            subtitle: const Text("trantheo197@gmail.com"),
            onTap: _openEmail,
          ),

          ListTile(
            leading: const Icon(Icons.web),
            title: const Text("Website"),
            subtitle: const Text("https://flashcardsapp-56acc.web.app"),
            onTap: _openWebsite,
          ),

          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Policy"),
            onTap: () => _openPrivacyPolicy(context),
          ),
        ],
      ),
    );
  }
}
