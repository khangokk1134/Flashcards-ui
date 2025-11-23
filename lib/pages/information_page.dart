import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
    // vẫn dùng url_launcher cho email
    // import: import 'package:url_launcher/url_launcher.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Information")),
      body: ListView(
        children: [
          // Thông tin cơ bản
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

          // Liên hệ
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

          // Chính sách Quyền riêng tư (mở bằng WebViewPage trong app)
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Policy"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>  WebViewPage(
                    url: PRIVACY_POLICY_URL,
                    title: 'Privacy Policy',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
