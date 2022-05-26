import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/presentation/widgets/custom_nav_bar.dart';
import '../presentation/screens/home_page.dart';
import '../presentation/screens/booking_page.dart';
import '../presentation/screens/wishlist_page.dart';
import '../presentation/screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    BookingPage(),
    WishlistPage(),
    ProfilePage(),
  ];

  void _setIndex(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: customNavBar(
        _currentIndex,
        (val) => _setIndex(val),
      ),
    );
  }
}
