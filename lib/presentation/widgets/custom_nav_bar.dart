import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

NavigationBarTheme customNavBar(int currentIndex, setIndex) {
  return NavigationBarTheme(
    data: NavigationBarThemeData(
      height: 46,
      backgroundColor: const Color(0xFF3252DF),
      indicatorColor: Colors.white.withOpacity(0.7),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      labelTextStyle: MaterialStateProperty.all(
        GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.grey[100],
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
            fontSize: 12,
          ),
        ),
      ),
      iconTheme: MaterialStateProperty.all(
        IconThemeData(
          color: Colors.grey[100],
          size: 28,
        ),
      ),
    ),
    child: NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: setIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          selectedIcon: Icon(
            Icons.home_rounded,
            color: Color(0xFF3252DF),
          ),
        ),
        NavigationDestination(
          icon: Icon(Icons.receipt_long_outlined),
          label: 'Booking',
          selectedIcon: Icon(
            Icons.receipt_long,
            color: Color(0xFF3252DF),
          ),
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline_rounded),
          label: 'Wishlist',
          selectedIcon: Icon(Icons.favorite_rounded, color: Color(0xFF3252DF)),
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
          selectedIcon: Icon(Icons.person_rounded, color: Color(0xFF3252DF)),
        ),
      ],
    ),
  );
}
