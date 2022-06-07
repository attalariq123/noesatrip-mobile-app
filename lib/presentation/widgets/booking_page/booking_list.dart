// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ListBooking extends StatelessWidget {
  const ListBooking({Key? key, required this.status}) : super(key: key);

  final String? status;

  @override
  Widget build(BuildContext context) {
    final bool isActive = status!.toLowerCase() == 'active';
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
        height: isActive ? 400 : 350,
        isCornerRounded: true,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: TicketData(status: isActive),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({Key? key, required this.status}) : super(key: key);

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                border: Border.all(
                    width: 2.0,
                    color: status ? Colors.green : Colors.yellow.shade700),
              ),
              child: Center(
                child: Text(
                  status ? 'Active' : 'Pending',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: status ? Colors.green : Colors.yellow[700]),
                ),
              ),
            ),
            Text(
              'DWR',
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
                'ID: 2313918',
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
                  'Buyer', 'Alex Garcia', 'Purchase Date', '05/06/2022'),
              const SizedBox(height: 10),
              ticketDetailsWidget(
                  'Destination', 'Desa Wae Rebo', 'Passenger(s)', '3 Person'),
              const SizedBox(height: 10),
              ticketDetailsWidget(
                  'Start Date', '10/06/2022', 'Duration', '4 Days'),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const Divider(
          height: 20,
          color: Color(0xFF3252DF),
          thickness: 1.4,
        ),
        status
            ? Padding(
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
              )
            : const SizedBox(
                height: 0,
                width: double.infinity,
              ),
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
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
              secondTitle,
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
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
