import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:noesatrip_app/data/models/destination.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:noesatrip_app/presentation/screens/booking_page.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    Key? key,
    required this.personQty,
    required this.item,
  }) : super(key: key);

  final int personQty;
  final Destination item;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _quantity = 1;

  void _addQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _removeQuantity() {
    if (_quantity != 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  DateTime date = DateTime.now();

  DateFormat formatter = DateFormat.yMd();

  String pickDate = '';

  @override
  Widget build(BuildContext context) {
    final String buyers = Provider.of<Auth>(context, listen: false).username!;
    final item = widget.item;
    Size _screen = MediaQuery.of(context).size;
    int person = widget.personQty;
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: _screen.width,
                height: 280,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details',
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Divider(
                      thickness: 1.4,
                      color: const Color(0xFF3252DF).withOpacity(0.7),
                    ),
                    const Spacer(),
                    InfoDetails(
                      text1: 'Buyers name: ',
                      text2: buyers,
                    ),
                    const Spacer(),
                    InfoDetails(
                      text1: 'Destination: ',
                      text2: item.name!,
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Start date: ',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF3252DF),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );

                              if (newDate == null) return;

                              setState(() {
                                date = newDate;
                                pickDate =
                                    '${date.day}/${date.month}/${date.year}';
                                print(date);
                                print(pickDate);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF3252DF),
                            ),
                            child: Text(
                              date.minute == DateTime.now().minute
                                  ? 'Select Date'
                                  : pickDate,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          )
                          // Text(
                          //   '30/06/2022',
                          //   style: GoogleFonts.poppins(
                          //     color: Colors.black.withOpacity(0.8),
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // const InfoDetails(
                    //   text1: 'Start date: ',
                    //   text2: '30/06/2022',
                    // ),
                    const Spacer(),
                    InfoDetails(
                        text1: 'Quantity: ',
                        text2:
                            person != 1 ? '$person persons' : '$person person'),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Duration (night):',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF3252DF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color(0xFF3252DF).withOpacity(0.9),
                          radius: 18,
                          child: IconButton(
                            onPressed: _removeQuantity,
                            splashRadius: 1,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            iconSize: 20,
                          ),
                        ),
                        Text(
                          '$_quantity',
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              const Color(0xFF3252DF).withOpacity(0.9),
                          radius: 18,
                          child: IconButton(
                            onPressed: () => _addQuantity(),
                            splashRadius: 1,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            iconSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Divider(
                thickness: 1.4,
                color: const Color(0xFF3252DF).withOpacity(0.7),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount: ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF3252DF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Rp 1.400.000',
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment method: ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF3252DF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Bank transfer to',
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '1010-0063-4132 \n a/n PT.Noesatrip',
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BookingPage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF3252DF),
                  ),
                  width: double.infinity,
                  height: 48,
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoDetails extends StatelessWidget {
  const InfoDetails({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            text1,
            style: GoogleFonts.poppins(
              color: const Color(0xFF3252DF),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            text2,
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget? customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      'Booking Summary',
      style: GoogleFonts.poppins(
        color: const Color(0xFF3252DF),
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 1.5,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      splashRadius: 1,
      onPressed: () => Navigator.of(context).pop(),
      icon: const CircleAvatar(
        backgroundColor: Color(0xFF3252DF),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    ),
  );
}
