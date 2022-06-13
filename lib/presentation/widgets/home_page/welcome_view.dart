import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:provider/provider.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final String? _username =
        Provider.of<Auth>(context, listen: false).username;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, $_username',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF3252DF),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Mau liburan \nkemana pekan ini?',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                maxRadius: 34,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464'),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SearchBox(),
              FilterBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterBox extends StatelessWidget {
  const FilterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Color(0xFF3252DF),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: const Icon(
        Icons.filter_list,
        size: 26,
        color: Colors.white,
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        height: 36,
        // width: MediaQuery.of(context).size.width * 0.76,
        child: TextField(
          cursorColor: const Color(0xFF3252DF),
          style: GoogleFonts.poppins(
            color: Colors.grey[800],
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Cari destinasi...',
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey[500],
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 32,
            ),
            contentPadding: const EdgeInsets.all(4),
          ),
        ),
      ),
    );
  }
}
