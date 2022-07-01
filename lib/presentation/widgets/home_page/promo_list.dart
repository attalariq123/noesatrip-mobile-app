import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPromo extends StatelessWidget {
  const ListPromo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: const EdgeInsets.only(
        top: 4,
        bottom: 12,
      ),
      child: SizedBox(
        height: 154,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.32,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/desa-wae-rebo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Desa Wae Rebo',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3252DF),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                    Text(
                      'Manggarai, Nusa Tenggara Timur',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sebuah destinasi wisata dengan view perbukitan dan laut yang indah.',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                      textScaleFactor: 0.92,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFCC47),
                            size: 14,
                          )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3252DF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Rp 250k',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Rp 500k',
                            style: GoogleFonts.poppins(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              decorationThickness: 1.5,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
