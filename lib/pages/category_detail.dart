import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // ✅ Đa ngôn ngữ
import 'flashcard_viewer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/notification_service.dart';
import '../data/topic_data.dart';
import '../services/topic_service.dart';

class CategoryDetailPage extends StatefulWidget {
  final String title;
  final String image;

  const CategoryDetailPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  List<Map<String, String>> items = [];
  List<Map<String, String>> filteredItems = [];
  bool isFavorite = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 🇻🇳 Lấy dữ liệu từ topic_data.dart
    final data = topicData[widget.title];
    if (data != null) {
      items = data;
      filteredItems = items;
    }

    _loadFavoriteStatus();
  }

  /// 🇻🇳 Kiểm tra xem chủ đề có nằm trong danh sách yêu thích hay không
  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];
    setState(() {
      isFavorite = favList.any((e) => e.startsWith('${widget.title}|'));
    });
  }

  /// 🇻🇳 Bật/tắt yêu thích, đồng thời thêm/xóa thông báo (song ngữ)
  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];

    setState(() {
      isFavorite = !isFavorite;
    });

    final isVietnamese = context.locale.languageCode == 'vi';

    if (isFavorite) {
      // ✅ Thêm vào danh sách yêu thích
      favList.add('${widget.title}|${widget.image}');
      await prefs.setStringList('favorites', favList);

      // 💬 Hiển thị SnackBar theo ngôn ngữ hiện tại
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isVietnamese
                ? '💖 Đã bật nhắc từ vựng cho "${widget.title}"!'
                : '💖 Vocabulary reminder enabled for "${widget.title}"!',
          ),
        ),
      );

      // 🔹 Chuyển danh sách từ vựng sang Map chuẩn cho NotificationService
      final topicWords = items.map((e) {
        return {
          'name': e['name'] ?? '',
          'desc': e['desc_en'] ?? '',
          'vi': e['desc_vi'] ?? '',
        };
      }).toList();

      // 🔹 Thêm topic yêu thích vào NotificationService
      await NotificationService.addFavoriteTopic(widget.title, topicWords);

      // ✅ Ghi lại topic yêu thích sang tab "New"
      await addNewTopicToNewPage(widget.title);
    } else {
      // ❌ Xóa khỏi danh sách yêu thích
      favList.removeWhere((e) => e.startsWith('${widget.title}|'));
      await prefs.setStringList('favorites', favList);

      // 💬 Hiển thị SnackBar theo ngôn ngữ hiện tại
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isVietnamese
                ? '🚫 Đã tắt nhắc từ vựng cho "${widget.title}"'
                : '🚫 Vocabulary reminder disabled for "${widget.title}"',
          ),
        ),
      );

      // 🔹 Gỡ topic khỏi NotificationService
      await NotificationService.removeFavoriteTopic(widget.title);
    }
  }

  /// 🇻🇳 Lọc danh sách từ vựng theo tên
  void _filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
          item['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isVietnamese = context.locale.languageCode == 'vi'; // ✅ kiểm tra ngôn ngữ

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: _filterItems,
              decoration: InputDecoration(
                hintText: tr("search"), // ✅ Đa ngôn ngữ
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filteredItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final it = filteredItems[index];
          final mainText = it['name'] ?? '';
          final subText = isVietnamese
              ? it['desc_vi'] ?? '' // 🇻🇳 nếu VI → hiện EN
              : it['desc_en'] ?? ''; // 🇬🇧 nếu EN → hiện VI

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => FlashcardViewer(
                  flashcards: filteredItems,
                  startIndex: index,
                ),
              ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      it['img']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      children: [
                        Text(
                          mainText,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
