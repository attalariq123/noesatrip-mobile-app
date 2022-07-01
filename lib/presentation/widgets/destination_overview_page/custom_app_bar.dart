import 'package:flutter/material.dart';

PreferredSizeWidget? customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      splashRadius: 1,
      onPressed: () => Navigator.of(context).pop(),
      icon: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.6),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF3252DF),
        ),
      ),
    ),
  );
}
