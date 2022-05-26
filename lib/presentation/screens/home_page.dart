import '../widgets/popular_view.dart';
import '../widgets/category_view.dart';
import '../widgets/promo_view.dart';
import '../widgets/welcome_view.dart';
import 'package:flutter/material.dart';
// import 'package:../data/dummy.dart';

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
            PopularView(),
            CategoryView(),
            PromoView(),
          ],
        ),
      ),
    );
  }
}
