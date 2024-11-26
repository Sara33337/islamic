import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/feature/salah/presentation/view/prayerTime.dart';

class AppDesign extends StatelessWidget {
  const AppDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Quran',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 30.sp,
                        color: AppColors().appFont,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  'Easily read the Quran',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  '19:00',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 36.sp,
                        color: Color(0xFF232323),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PrayerTimes();
                    }));
                  },
                  child: Container(
                    width: 117.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                        color: Color(0xFF763FBC),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        'Prayer Times',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
                width: 176.w,
                height: 196.h,
                margin: EdgeInsets.only(top: 22),
                child: Image.asset("assets/images/surah.png"))
          ],
          
        ),
        
      ],
    );
  }
}
