// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/data/models/destination.dart';
import 'package:noesatrip_app/data/models/order.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:noesatrip_app/data/providers/destination_data.dart';
import 'package:noesatrip_app/data/providers/order_data.dart';
import 'package:provider/provider.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ListBooking extends StatefulWidget {
  const ListBooking({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  State<ListBooking> createState() => _ListBookingState();
}

class _ListBookingState extends State<ListBooking> {
  // ignore: prefer_final_fields
  late Future<dynamic> _data;

  Future _futureData() async {
    return await Provider.of<OrderData>(context, listen: false).fetchOrder();
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
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (_, __) => const OrderSkeleton(),
              itemCount: 1);
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
            return Consumer<OrderData>(
              builder: (context, data, child) => ListView.builder(
                itemCount: widget.isActive
                    ? data.activeOrder.length
                    : data.pendingOrder.length,
                itemBuilder: (context, index) => widget.isActive
                    ? ActiveOrderItem(item: data.activeOrder[index])
                    : PendingOrderItem(item: data.pendingOrder[index]),
              ),
            );
          }
        }
      },
    );
  }
}

class ActiveOrderItem extends StatelessWidget {
  const ActiveOrderItem({Key? key, required this.item}) : super(key: key);

  final Order item;

  @override
  Widget build(BuildContext context) {
    final String? username = Provider.of<Auth>(context, listen: false).username;
    // bool status = item.paymentStatus!.toLowerCase() == 'success' ? true : false;
    Destination dest =
        Provider.of<DestinationData>(context).findById(item.destinationId);

    return Center(
      child: TicketWidget(
        shadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: Colors.grey.shade200,
        width: 350,
        height: 400,
        isCornerRounded: true,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(width: 2.0, color: Colors.green),
                  ),
                  child: Center(
                    child: Text(
                      'Active',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, color: Colors.green),
                    ),
                  ),
                ),
                Text(
                  dest.kode,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF3252DF),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              color: Color(0xFF3252DF),
              thickness: 1.4,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(
                    'Trip Ticket',
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'ID: ${item.id}${item.userId}${item.destinationId}${item.startDate.substring(8)}',
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ticketDetailsWidget(
                    'Buyer',
                    username!,
                    'Purchase Date',
                    "${item.purchaseDate.toString().substring(8, 10)}/${item.purchaseDate.toString().substring(5, 7)}/${item.purchaseDate.toString().substring(0, 4)}",
                  ),
                  const SizedBox(height: 10),
                  ticketDetailsWidget('Destination', dest.name, 'Person(s)',
                      "${item.ticketQuantity.toString()} person"),
                  const SizedBox(height: 10),
                  ticketDetailsWidget(
                      'Start Date',
                      "${item.startDate.toString().substring(8, 10)}/${item.startDate.toString().substring(5, 7)}/${item.startDate.toString().substring(0, 4)}",
                      'Duration',
                      "${item.duration.toString()} night"),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const Divider(
              height: 20,
              color: Color(0xFF3252DF),
              thickness: 1.4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 12.0, right: 12.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/barcode.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PendingOrderItem extends StatelessWidget {
  const PendingOrderItem({Key? key, required this.item}) : super(key: key);

  final Order item;

  @override
  Widget build(BuildContext context) {
    final String? username = Provider.of<Auth>(context, listen: false).username;
    // bool status = item.paymentStatus!.toLowerCase() == 'success' ? true : false;
    Destination dest =
        Provider.of<DestinationData>(context).findById(item.destinationId);

    return Center(
      child: TicketWidget(
        shadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: Colors.grey.shade200,
        width: 350,
        height: 350,
        isCornerRounded: true,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border:
                        Border.all(width: 2.0, color: Colors.yellow.shade700),
                  ),
                  child: Center(
                    child: Text(
                      'Pending',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.yellow[700]),
                    ),
                  ),
                ),
                Text(
                  dest.kode,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF3252DF),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              color: Color(0xFF3252DF),
              thickness: 1.4,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(
                    'Trip Ticket',
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'ID: ${item.id}${item.userId}${item.destinationId}${item.startDate.substring(8)}',
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ticketDetailsWidget(
                    'Buyer',
                    username!,
                    'Purchase Date',
                    "${item.purchaseDate.toString().substring(8, 10)}/${item.purchaseDate.toString().substring(5, 7)}/${item.purchaseDate.toString().substring(0, 4)}",
                  ),
                  const SizedBox(height: 10),
                  ticketDetailsWidget('Destination', dest.name, 'Person(s)',
                      "${item.ticketQuantity.toString()} person"),
                  const SizedBox(height: 10),
                  ticketDetailsWidget(
                      'Start Date',
                      "${item.startDate.toString().substring(8, 10)}/${item.startDate.toString().substring(5, 7)}/${item.startDate.toString().substring(0, 4)}",
                      'Duration',
                      "${item.duration.toString()} night"),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const Divider(
              height: 20,
              color: Color(0xFF3252DF),
              thickness: 1.4,
            ),
            const SizedBox(
              height: 0,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSkeleton extends StatelessWidget {
  const OrderSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TicketWidget(
        shadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: Colors.grey.shade200,
        width: 350,
        height: 400,
        isCornerRounded: true,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Skeleton(width: 120, height: 25),
                Skeleton(width: 70, height: 25),
              ],
            ),
            const Divider(
              height: 20,
              color: Color(0xFF3252DF),
              thickness: 1.4,
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.0),
              child: Row(
                children: const [
                  Skeleton(width: 100, height: 25),
                  Spacer(),
                  Skeleton(width: 80, height: 25),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Skeleton(width: 80, height: 25),
                      Skeleton(width: 80, height: 25),
                    ],
                  ),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Skeleton(width: 100, height: 25),
                      Skeleton(width: 100, height: 25),
                    ],
                  ),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Skeleton(width: 120, height: 25),
                      Skeleton(width: 120, height: 25),
                    ],
                  ),
                  SizedBox(height: 22),
                ],
              ),
            ),
            const Divider(
              height: 20,
              color: Color(0xFF3252DF),
              thickness: 1.4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 12, right: 12),
              child: Skeleton(
                width: double.infinity,
                height: 50,
              ),
            )
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

Widget ticketDetailsWidget(String? firstTitle, String? firstDesc,
    String? secondTitle, String? secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle!,
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc!,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              secondTitle!,
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc!,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
