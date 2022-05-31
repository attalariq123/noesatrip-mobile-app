// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ListBooking extends StatelessWidget {
  const ListBooking({Key? key, required this.status}) : super(key: key);

  final String? status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TicketWidget(
        color: Colors.white,
        width: 350,
        height: 380,
        isCornerRounded: true,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: TicketData(status: status),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({Key? key, required this.status}) : super(key: key);

  final String? status;

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
                    width: 1.0,
                    color: status == 'Active' ? Colors.green : Colors.red),
              ),
              child: Center(
                child: Text(
                  '$status',
                  style: TextStyle(
                      color: status == 'Active' ? Colors.green : Colors.red),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.place_outlined,
                    color: status == 'Active' ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  'DWR',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF3252DF),
                    fontWeight: FontWeight.w600,
                    // fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
        const Divider(
          height: 20,
          color: Color(0xFF3252DF),
          thickness: 2,
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
                'ID: #2313918',
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
                  'Buyer', 'Alex Garcia', 'Purchase Date', '05-06-2022'),
              const SizedBox(height: 10),
              ticketDetailsWidget(
                  'Destination', 'Desa Wae Rebo', 'Passenger(s)', '3 Person'),
              const SizedBox(height: 10),
              ticketDetailsWidget(
                  'Start Date', '10-06-2022', 'Duration', '4 Days'),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const Divider(
          height: 20,
          color: Color(0xFF3252DF),
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 12.0, right: 12.0),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/barcode.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}


// Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 2,
//       margin: const EdgeInsets.only(
//         top: 4,
//         bottom: 12,
//       ),
//       child: SizedBox(
//         height: 154,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.all(6.0),
//           child: Row(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.32,
//                 height: MediaQuery.of(context).size.height,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/desa-wae-rebo.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Desa Wae Rebo',
//                       style: GoogleFonts.poppins(
//                         color: const Color(0xFF3252DF),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     Row(
//                       children: [
//                         for (int i = 0; i < 5; i++)
//                           const Icon(
//                             Icons.star_rounded,
//                             color: Color(0xFFFFCC47),
//                             size: 14,
//                           )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     Text(
//                       'Sebuah destinasi wisata dengan view perbukitan dan laut yang indah.',
//                       style: GoogleFonts.poppins(
//                         color: Colors.grey[900],
//                         fontWeight: FontWeight.w400,
//                         fontSize: 10,
//                       ),
//                       textScaleFactor: 0.92,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 3,
//                       softWrap: true,
//                     ),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       'Manggarai, Nusa Tenggara Timur',
//                       style: GoogleFonts.poppins(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 10,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       softWrap: true,
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                               color: const Color(0xFF3252DF),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Text(
//                             'Rp 250k',
//                             style: GoogleFonts.poppins(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 6,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Text(
//                             'Rp 500k',
//                             style: GoogleFonts.poppins(
//                               color: Colors.redAccent,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               decorationThickness: 1.5,
//                               decoration: TextDecoration.lineThrough,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
