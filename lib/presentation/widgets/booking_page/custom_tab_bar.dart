import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Material(
        child: TabBar(
          tabs: const [
            Tab(
              text: "Active",
            ),
            Tab(
              text: "Pending",
            ),
            Tab(
              text: "History",
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black87,
          labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          indicator: MaterialIndicator(
            color: const Color(0xFF3252DF),
            height: 4,
            topLeftRadius: 4,
            topRightRadius: 4,
            bottomLeftRadius: 4,
            bottomRightRadius: 4,
            horizontalPadding: 30,
            tabPosition: TabPosition.bottom,
          ),
        ),
      ),
    );
  }
}
