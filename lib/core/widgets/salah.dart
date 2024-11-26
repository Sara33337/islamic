import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SalahTime extends StatelessWidget {
  const SalahTime({super.key,
  required this.prayerName,
  required this.prayerTime});

  final String prayerName;
  final String prayerTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50 , right: 50 , top: 15 , bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 30.w,
              height: 25.h,
              child: Image(
                image: AssetImage("assets/images/maghrib.png"),
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 100,
          ),
          Text(prayerName.toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(
            width: 100,
          ),
          Text(prayerTime.toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ))
        ],
      ),
    );
  }
}
