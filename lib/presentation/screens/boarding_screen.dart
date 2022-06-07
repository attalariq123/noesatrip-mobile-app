import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/presentation/screens/sign_in_page.dart';
import 'package:noesatrip_app/presentation/screens/sign_up_page.dart';

final List<String> images = [
  'https://raw.githubusercontent.com/attalariq123/NoesaTrip-App/login/assets/home1.png',
  'https://raw.githubusercontent.com/attalariq123/NoesaTrip-App/login/assets/home2.png',
  'https://raw.githubusercontent.com/attalariq123/NoesaTrip-App/login/assets/home3.png',
];

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Noesa Trip",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF3252DF),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Enjoy your holiday by getting to know our culture",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3)),
                items: images
                    .map(
                      (item) => Center(
                        child:
                            Image.network(item, fit: BoxFit.cover, width: 1000),
                      ),
                    )
                    .toList(),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    color: const Color(0xFF3252DF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFF3252DF)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3252DF),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
