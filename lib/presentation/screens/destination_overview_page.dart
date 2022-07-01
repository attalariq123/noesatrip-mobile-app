import 'package:flutter/material.dart';
import 'package:noesatrip_app/data/models/destination.dart';
import 'package:noesatrip_app/presentation/widgets/destination_overview_page/booking_button.dart';
import 'package:noesatrip_app/presentation/widgets/destination_overview_page/custom_app_bar.dart';
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
