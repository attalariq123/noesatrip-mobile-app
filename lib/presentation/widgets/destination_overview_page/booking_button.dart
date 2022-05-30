import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingButton extends StatefulWidget {
  const BookingButton({Key? key}) : super(key: key);

  @override
  State<BookingButton> createState() => _BookingButtonState();
}

class _BookingButtonState extends State<BookingButton> {
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

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              width: _screenSize.width * 0.36,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: _removeQuantity,
                      icon: const Icon(
                        Icons.remove,
                        color: Color(0xFF3252DF),
                      ),
                      alignment: Alignment.center,
                      iconSize: 20,
                    ),
                    Text(
                      '$_quantity',
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _addQuantity(),
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF3252DF),
                      ),
                      alignment: Alignment.center,
                      iconSize: 20,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF3252DF),
                ),
                width: _screenSize.width * 0.52,
                height: 48,
                child: Center(
                  child: Text(
                    'Book Now',
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
    );
  }
}
