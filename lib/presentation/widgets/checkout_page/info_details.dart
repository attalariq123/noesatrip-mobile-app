import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoDetails extends StatelessWidget {
  const InfoDetails({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            text1,
            style: GoogleFonts.poppins(
              color: const Color(0xFF3252DF),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            text2,
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
