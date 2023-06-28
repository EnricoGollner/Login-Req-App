import 'package:flutter/material.dart';
import 'package:flutter_application_diy/app/pages/home/home_page.dart';
import 'package:flutter_application_diy/app/pages/login/login_page.dart';
import 'package:flutter_application_diy/app/pages/register_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pages',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
