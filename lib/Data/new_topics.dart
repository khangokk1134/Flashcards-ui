/// 🔹 Danh sách các chủ đề mới nhất được hiển thị ở tab “New”
final List<String> newTopicNames = [
  "Transport",
  "Weather",
  "Jobs",
  "Emotions",
  "School Supplies",
  "Alnimals",

];

/// 🖼️ Map đường dẫn ảnh cho từng chủ đề (ảnh đại diện trong thư mục assets)
final Map<String, String> newTopicImages = {
  "Transport": "assets/images/transport/transport.jpg",
  "Weather": "assets/images/weather/weather.jpg",
  "Jobs": "assets/images/jobs/jobs.jpg",
  "Emotions": "assets/images/emotions/emotions.jpg",
  "School Supplies": "assets/images/schoolsupplies/schoolsupplies.jpg",
  "Flowers": "assets/images/flowers/flowers.jpg",
  "Alnimals": "assets/images/animals/animals.jpg",
};

/// ⚙️ Nếu bạn thêm topic mới từ CategoryDetailPage hoặc admin,
/// chỉ cần cập nhật ảnh tương ứng tại đây, ví dụ:
/// "Technology": "assets/images/technology/technology.jpg",
///
/// App sẽ tự động nhận và hiển thị trong tab “New”.
