import 'package:_9_store_app/pages/cart_page.dart';
import 'package:_9_store_app/pages/home_page.dart';
import 'package:_9_store_app/pages/main_home_page.dart';
import 'package:_9_store_app/pages/profile_page.dart';
import 'package:_9_store_app/pages/updata_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MainHomePage.id: (context) => MainHomePage(),
        HomePage.id: (context) => HomePage(),
        UbdatePage.id: (context) => UbdatePage(),
        CartPage.id: (context) => CartPage(),
        ProfilePage.id: (context) => ProfilePage(),
      },
      home: MainHomePage(),
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontWeight: FontWeight.w400),
          bodySmall: TextStyle(fontWeight: FontWeight.w300),
          titleMedium: TextStyle(fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
