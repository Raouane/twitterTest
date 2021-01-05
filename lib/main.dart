import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter/API/sharedPrefs.dart';
import 'package:twitter/pages/BottomNavBar/bottomNavbar.dart';
import 'package:twitter/pages/HomePage/homePage.dart';
import 'package:twitter/pages/MyHomePage.dart';

SharedPreferences prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPrefs.saveToken("", "");
  prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token');

  Widget screen;
  if (token == null || token == '') {
    screen = MyHomePage();
  } else {
    screen = BottomNavBar();
  }
  runApp(MyApp(screen));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget screen;
  const MyApp(
    this.screen,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: this.screen,
    );
  }
}
