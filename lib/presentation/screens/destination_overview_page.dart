import 'package:flutter/material.dart';
import 'package:noesatrip_app/data/models/destination.dart';
import 'package:noesatrip_app/presentation/widgets/destination_overview_page/booking_button.dart';
import 'package:noesatrip_app/presentation/widgets/destination_overview_page/detail_scroll_sheet.dart';
import '../widgets/destination_overview_page/destination_image.dart';

class DestinationOverviewPage extends StatefulWidget {
  const DestinationOverviewPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Destination item;

  @override
  State<DestinationOverviewPage> createState() =>
      _DestinationOverviewPageState();
}

class _DestinationOverviewPageState extends State<DestinationOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final Destination item = widget.item;
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context),
      body: SizedBox(
        width: _screenSize.width,
        height: _screenSize.height,
        child: Stack(
          children: <Widget>[
            DestinationImage(url: item.imagePath),
            DetailScrollSheet(item: item),
            BookingButton(idDest: item.id),
          ],
        ),
      ),
    );
  }
}

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
