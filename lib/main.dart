import 'package:flutter/material.dart';
import 'widgets/map_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // ✅ Transparent background
      statusBarIconBrightness: Brightness.dark, // or Brightness.light
    ),
  );

  final queryParams = Uri.base.queryParameters;
  final categoryId = queryParams['category_id'];
  final lang = queryParams['lang'];

  runApp(MyApp(categoryId: categoryId, lang: lang));
}


class MyApp extends StatelessWidget {
  final String? categoryId;
  final String? lang;

  const MyApp({super.key, this.categoryId, this.lang});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directories - Flamencos.eu',
      debugShowCheckedModeBanner: false,
      home: MapPage(
        categoryId: categoryId,
        lang: lang,
      ),
    );
  }
}
