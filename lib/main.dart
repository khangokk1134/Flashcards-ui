import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/category_detail.dart';
import 'pages/settings_page.dart';
import 'pages/favorites_page.dart';
import 'pages/new_page.dart';
import 'services/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';
import 'pages/webview_page.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

/// 🧱 Tạo kênh thông báo cho Android
Future<void> createNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'topic_channel',
    'Topic Reminder',
    description: 'Thông báo từ vựng từng chủ đề yêu thích',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  // ✅ Xin quyền thông báo (Android 13+)
  final status = await Permission.notification.request();

  // ✅ Tạo channel và khởi tạo dịch vụ thông báo
  await createNotificationChannel();
  await NotificationService.init();

  // ✅ Lấy dữ liệu lưu trong SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? false;
  final langCode = prefs.getString('lang') ?? 'en';

  // ❌ Đã xóa phần gửi test notification khi khởi động app

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: MyApp(isDark: isDark, langCode: langCode),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isDark;
  final String langCode;
  const MyApp({Key? key, required this.isDark, required this.langCode})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDark;
  late String _langCode;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDark;
    _langCode = widget.langCode;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.setLocale(Locale(_langCode));
    });
  }

  Future<void> _toggleTheme(bool value) async {
    setState(() => _isDark = value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', value);
  }

  Future<void> _changeLanguage(String code) async {
    setState(() => _langCode = code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', code);
    await context.setLocale(Locale(code));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashcardsApp',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: Colors.red),
      ),
      darkTheme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: Colors.red),
      ),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: MainScreen(
        onThemeChanged: _toggleTheme,
        isDark: _isDark,
        onLanguageChanged: _changeLanguage,
        langCode: _langCode,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final void Function(bool) onThemeChanged;
  final bool isDark;
  final void Function(String) onLanguageChanged;
  final String langCode;

  const MainScreen({
    Key? key,
    required this.onThemeChanged,
    required this.isDark,
    required this.onLanguageChanged,
    required this.langCode,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const FavoritesPage(),
      const NewPage(),
      SettingsPage(
        isDark: widget.isDark,
        onThemeChanged: widget.onThemeChanged,
        onLanguageChanged: widget.onLanguageChanged,
        langCode: widget.langCode,
      ),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF121212)
            : Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: tr('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            activeIcon: const Icon(Icons.favorite),
            label: tr('favorite'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.fiber_new_outlined),
            activeIcon: const Icon(Icons.fiber_new),
            label: tr('new'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: tr('settings'),
          ),
        ],
      ),
    );
  }
}

/// ======================
/// 🏠 Home Page
/// ======================
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  bool _isLoading = true;

  final List<Map<String, String>> cats = [
    {'title': 'Alphabet', 'img': 'assets/images/alphabet/Alphabet.jpg'},
    {'title': 'Colors', 'img': 'assets/images/colors/rainbow.jpg'},
    {'title': 'Fruits', 'img': 'assets/images/fruits/fruits.jpg'},
    {'title': 'Sea animals', 'img': 'assets/images/sea_animals/sea.jpg'},
    {'title': 'Animals', 'img': 'assets/images/animals/animals.jpg'},
    {'title': 'Vegetables', 'img': 'assets/images/vegetables/vege.jpg'},
    {'title': 'Farm Animals', 'img': 'assets/images/farm_animals/farmanimals.jpg'},
    {'title': 'Body', 'img': 'assets/images/body/face.jpg'},
    {'title': 'Flowers', 'img': 'assets/images/flowers/flowers.jpg'},
    {'title': 'Jobs', 'img': 'assets/images/jobs/jobs.jpg'},
    {'title': 'Weather', 'img': 'assets/images/weather/weather.jpg'},
    {'title': 'School Supplies', 'img': 'assets/images/schoolsupplies/schoolsupplies.jpg'},
    {'title': 'Transport', 'img': 'assets/images/transport/transport.jpg'},
    {'title': 'Emotions', 'img': 'assets/images/emotions/emotions.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return _buildShimmerGrid();

    final filteredCats = cats.where((c) {
      final title = c['title']!.toLowerCase();
      return title.contains(_searchQuery.toLowerCase());
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: tr('search'),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: filteredCats.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final c = filteredCats[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CategoryDetailPage(
                          title: c['title']!,
                          image: c['img']!,
                        ),
                      ));
                    },
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.asset(
                                  c['img']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  c['title']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: FavoriteButton(
                            title: c['title']!,
                            img: c['img']!,
                          ),
                        ),
                      ],
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

  Widget _buildShimmerGrid() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final String title;
  final String img;
  const FavoriteButton({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFav = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];
    setState(() {
      _isFav = favList.any((e) => e.startsWith('${widget.title}|'));
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];

    if (_isFav) {
      favList.removeWhere((e) => e.startsWith('${widget.title}|'));
    } else {
      favList.add('${widget.title}|${widget.img}');
    }

    await prefs.setStringList('favorites', favList);
    setState(() => _isFav = !_isFav);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        child: const Icon(Icons.favorite_border, color: Colors.grey, size: 28),
      );
    }

    return GestureDetector(
      onTap: _toggleFavorite,
      child: Icon(
        _isFav ? Icons.favorite : Icons.favorite_border,
        color: _isFav ? Colors.red : Colors.white,
        size: 28,
      ),
    );
  }
}
