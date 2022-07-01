import 'package:flutter/material.dart';
import 'package:noesatrip_app/presentation/widgets/booking_page/booking_list.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListBooking(isActive: true),
    );
  }
}
