import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:noesatrip_app/data/providers/destination_data.dart';
import 'package:noesatrip_app/data/models/destination.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_effect/scroll_snap_effect.dart';
import '/presentation/screens/destination_overview_page.dart';

class ListDestination extends StatefulWidget {
  const ListDestination({Key? key}) : super(key: key);

  @override
  State<ListDestination> createState() => _ListDestinationState();
}

class _ListDestinationState extends State<ListDestination> {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, __) => const DestinationSkeleton(),
            itemCount: 4,
          );
        } else {
          if (dataSnapshot.error != null) {
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
              builder: (ctx, data, child) => ScrollSnapEffect(
                duration: const Duration(milliseconds: 1000),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemSize: 162,
                itemCount: data.items.length,
                itemBuilder: (context, index) =>
                    DestinationItem(item: data.items[index]),
              ),
            );
          }
        }
      },
    );
  }
}

class DestinationSkeleton extends StatelessWidget {
  const DestinationSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        right: 12,
        top: 4,
        bottom: 4,
      ),
      child: SizedBox(
        width: 150,
        // height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton(
              width: double.infinity,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Skeleton(
                    height: 16,
                    width: 90,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(child: Skeleton(height: 16)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Skeleton(
                height: 16,
                width: 80,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Skeleton(
                height: 16,
                width: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class DestinationItem extends StatefulWidget {
  const DestinationItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Destination item;

  @override
  State<DestinationItem> createState() => _DestinationItemState();
}

class _DestinationItemState extends State<DestinationItem> {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DestinationOverviewPage(item: widget.item),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        margin: const EdgeInsets.only(
          right: 12,
          top: 4,
          bottom: 4,
        ),
        child: SizedBox(
          width: 150,
          // height: 280,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.item.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.name,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF3252DF),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.item.toggleFovoriteStatus(
                              authData.userId, authData.token);
                        });
                      },
                      child: widget.item.isFavorite
                          ? const Icon(
                              Icons.favorite,
                              size: 16,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline_rounded,
                              size: 16,
                              color: Colors.grey[800],
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      size: 10,
                      color: Colors.grey[800],
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        widget.item.city,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 8,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      size: 14,
                      color: Color(0xFFFFCC47),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '${widget.item.overallRating} ',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                            ),
                          ),
                          TextSpan(
                            text: '(${widget.item.totalReview})',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
