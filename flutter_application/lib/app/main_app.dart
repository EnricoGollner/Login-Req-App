import 'package:flutter/material.dart';
import 'package:flutter_application_diy/app/pages/home/home_page.dart';
import 'package:flutter_application_diy/app/pages/login/login_page.dart';

import 'pages/register/register_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pages',
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const RegisterPage(title: 'Register'),
        },
      ),
    );
  }
}
