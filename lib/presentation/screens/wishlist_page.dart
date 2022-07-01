import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/data/providers/destination_data.dart';
import 'package:noesatrip_app/presentation/widgets/home_page/destination_list.dart';
import 'package:noesatrip_app/presentation/widgets/wishlist_page/empty_data.dart';
import 'package:noesatrip_app/presentation/widgets/wishlist_page/wishlist_list.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // ignore: prefer_final_fields
  late Future<dynamic> _data;

  Future _futureData() async {
    return await Provider.of<DestinationData>(context, listen: false)
        .fetchDestination();
  }

  @override
  void didChangeDependencies() {
    _data = _futureData();
    super.didChangeDependencies();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<DestinationData>(context, listen: false)
        .fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteData =
        Provider.of<DestinationData>(context, listen: false).favoriteItems;

    return Scaffold(
      body: favoriteData.isEmpty
          ? const EmptyData()
          : RefreshIndicator(
              onRefresh: () => _refreshData(context),
              child: FutureBuilder(
                future: _data,
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemCount: favoriteData.length,
                      itemBuilder: (_, __) => const DestinationSkeleton(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 200,
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                    );
                  } else {
                    if (snapShot.error != null) {
                      return Center(
                        child: Text(
                          'There\'s an error...',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3252DF),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      );
                    } else {
                      return Consumer<DestinationData>(
                        builder: (context, data, _) => GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(20),
                          itemCount: data.favoriteItems.length,
                          itemBuilder: (context, index) =>
                              ListWishlist(item: data.favoriteItems[index]),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 200,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
    );
  }
}
