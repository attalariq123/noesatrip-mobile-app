import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/presentation/widgets/booking_page/booking_list.dart';
import 'package:noesatrip_app/presentation/widgets/booking_page/custom_tab_bar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            const CustomTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  const ActiveView(),
                  const PendingView(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No History Tickets',
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Icon(
                        Icons.lock_clock,
                        size: 60,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActiveView extends StatelessWidget {
  const ActiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          ListBooking(status: 'Active'),
        ],
      ),
    );
  }
}

class PendingView extends StatelessWidget {
  const PendingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          ListBooking(status: 'Pending'),
          ListBooking(status: 'Pending'),
          ListBooking(status: 'Pending'),
        ],
      ),
    );
  }
}
