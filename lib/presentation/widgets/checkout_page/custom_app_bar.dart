import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget? customAppBarCheckout(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      'Booking Summary',
      style: GoogleFonts.poppins(
        color: const Color(0xFF3252DF),
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 1.5,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      splashRadius: 1,
      onPressed: () => Navigator.of(context).pop(),
      icon: const CircleAvatar(
        backgroundColor: Color(0xFF3252DF),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    ),
  );
}
