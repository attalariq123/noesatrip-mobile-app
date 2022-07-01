import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Let\'s add some wishtrip',
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Icon(
            Icons.accessibility_new_rounded,
            size: 60,
          ),
        ],
      ),
    );
  }
}
