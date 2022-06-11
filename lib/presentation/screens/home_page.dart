import 'package:provider/provider.dart';

import '../../data/providers/destination_data.dart';
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
  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<DestinationData>(context, listen: false)
        .fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshData(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Consumer<DestinationData>(
                  builder: (ctx, _, __) => const WelcomeView()),
              const DestinationView(),
              const CategoryView(),
              const PromoView(),
            ],
          ),
        ),
      ),
    );
  }
}
