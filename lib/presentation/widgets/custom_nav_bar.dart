import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

NavigationBarTheme customNavBar(int currentIndex, setIndex) {
  return NavigationBarTheme(
    data: NavigationBarThemeData(
      height: 60,
      backgroundColor: Colors.grey[300],
      indicatorColor: Colors.white.withOpacity(0.8),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      labelTextStyle: MaterialStateProperty.all(
        GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Color(0xFF3252DF),
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
            fontSize: 12,
          ),
        ),
      ),
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(
          color: Color(0xFF3252DF),
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
          selectedIcon: Icon(Icons.home_rounded),
        ),
        NavigationDestination(
          icon: Icon(Icons.receipt_long_outlined),
          label: 'Booking',
          selectedIcon: Icon(Icons.receipt_long),
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline_rounded),
          label: 'Wishlist',
          selectedIcon: Icon(Icons.favorite_rounded),
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
          selectedIcon: Icon(Icons.person_rounded),
        ),
      ],
    ),
  );
}
