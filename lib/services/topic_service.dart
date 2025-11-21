import 'package:shared_preferences/shared_preferences.dart';
import '../data/new_topics.dart' as newData;

/// ✅ Hàm thêm topic mới vào danh sách "New"
Future<void> addNewTopicToNewPage(String topicName) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> saved = prefs.getStringList('newTopics') ?? [];

  // Nếu topic đã có thì không thêm lại
  if (!saved.contains(topicName)) {
    // Giữ tối đa 5 topic mới nhất
    if (saved.length >= 5) saved.removeAt(0);
    saved.add(topicName);
    await prefs.setStringList('newTopics', saved);

    // Cập nhật luôn trong bộ nhớ đang chạy
    newData.newTopicNames
      ..clear()
      ..addAll(saved);
  }
}
