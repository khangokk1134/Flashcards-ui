import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/new_topics.dart' as newData;
import 'category_detail.dart';
import 'package:easy_localization/easy_localization.dart';


class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  bool isAdmin = true; // 🔐 Chế độ admin (thêm topic thủ công)

  @override
  void initState() {
    Future<void> _clearSavedNewTopics() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('newTopics');
      print('✅ Cleared saved new topics');
    }

    super.initState();
    _clearSavedNewTopics();
    _loadNewTopics();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadNewTopics();
  }

  Future<void> _loadNewTopics() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('newTopics');
    if (saved != null && saved.isNotEmpty) {
      setState(() {
        newData.newTopicNames
          ..clear()
          ..addAll(saved);
      });
    }
  }

  Future<void> _saveNewTopics() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('newTopics', newData.newTopicNames);
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Dùng newTopicImages để lấy ảnh tương ứng
    final newTopics = newData.newTopicNames.map((topic) {
      final img = newData.newTopicImages[topic] ??
          'assets/images/default/default.png'; // ảnh mặc định nếu thiếu
      return {'title': topic, 'img': img};
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New Topics",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                if (isAdmin)
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      _showAddTopicDialog(context);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: newTopics.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final item = newTopics[index];
                  final title = item['title']!;
                  final img = item['img']!;

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CategoryDetailPage(
                            title: title,
                            image: img,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                img,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.broken_image,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🧩 Hộp thoại thêm topic mới
  void _showAddTopicDialog(BuildContext context) {
    String newTopicName = '';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Topic'),
        content: TextField(
          onChanged: (value) => newTopicName = value,
          decoration: const InputDecoration(labelText: 'Topic name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (newTopicName.isEmpty) return;

              // ⚠️ Nếu topic chưa có ảnh -> báo lỗi
              if (!newData.newTopicImages.containsKey(newTopicName)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('topic_missing_image'.tr())),
                );

                return;
              }

              setState(() {
                if (newData.newTopicNames.length >= 5) {
                  newData.newTopicNames.removeAt(0);
                }
                newData.newTopicNames.add(newTopicName);
              });

              await _saveNewTopics();
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
