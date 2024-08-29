import 'package:fast_inventory/screens/auth/change_password.dart';
import 'package:fast_inventory/screens/auth/login_page.dart';
import 'package:fast_inventory/screens/homepage/home_page.dart';
import 'package:fast_inventory/screens/order/create_order.dart';
import 'package:fast_inventory/screens/profile/profile_page.dart';
import 'package:fast_inventory/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Inventory',
      theme: ThemeData(
        textTheme: GoogleFonts.zillaSlabTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: scafoldClr),
        useMaterial3: true,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
        'profile': (context) => ProfilePage(),
        'changepassword': (context) => const ChangePassword(),
        'createOrder': (context) => CreateOrder(),
      },
    );
  }
}
