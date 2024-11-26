import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/feature/surah/presentation/view/surahScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 200.w,
                height: 200.h,
                margin: EdgeInsets.only(top: 70),
                child: Image(image: AssetImage("assets/images/quran.png"))),
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
                    color: AppColors().greyFont,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              width: 180,
              height: 53,
              margin: EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors().appFont),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SurahScreen();
                    }));
                  },
                  child: Text(
                    "Read Now",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
