import '../widgets/home_page/destination_view.dart';
import '../widgets/home_page/category_view.dart';
import '../widgets/home_page/promo_view.dart';
import '../widgets/home_page/welcome_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            WelcomeView(),
            DestinationView(),
            CategoryView(),
            PromoView(),
          ],
        ),
      ),
    );
  }
}
