import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:noesatrip_app/presentation/screens/boarding_screen.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? _username =
        Provider.of<Auth>(context, listen: false).username;
    final String? _email = Provider.of<Auth>(context, listen: false).email;
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: _screenSize.height,
        width: _screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: _screenSize.height * 0.34,
                width: _screenSize.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF3252DF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: _screenSize.height * 0.06),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464'),
                      minRadius: 60,
                      maxRadius: 60,
                    ),
                    SizedBox(height: _screenSize.height * 0.01),
                    Text(
                      '$_username',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[50],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '$_email',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: _screenSize.height * 0.08),
            Expanded(
              child: ListView(
                children: [
                  const ProfileListItem(
                    icon: Icons.edit,
                    text: 'Edit Profile',
                  ),
                  const ProfileListItem(
                      icon: Icons.receipt_long_rounded,
                      text: 'Purchase History'),
                  const ProfileListItem(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BoardingScreen(),
                        ),
                      );
                    },
                    child: const ProfileListItem(
                      icon: Icons.login_rounded,
                      text: 'Sign Out',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 22),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFF3252DF),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 18,
            color: Colors.grey[50],
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.grey[50],
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: Colors.grey[50],
          ),
        ],
      ),
    );
  }
}
