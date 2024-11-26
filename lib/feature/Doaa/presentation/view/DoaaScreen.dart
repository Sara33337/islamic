import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/core/widgets/appDesign.dart';
import 'package:islamicapp/feature/surah/presentation/view/surahScreen.dart';
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';

class DoaaScreen extends StatelessWidget {
  const DoaaScreen({super.key , this.surahModel});
  final Surah? surahModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 21, top: 22),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppDesign(),
                      Text(
                        'Categorie',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SurahScreen(
                                    surahModel: surahModel);
                              }));
                            },
                            child: Container(
                              width: 73.w,
                              height: 37.h,
                              margin:
                                  EdgeInsets.only(top: 8, right: 8, bottom: 20),
                              decoration: BoxDecoration(
                                  color: AppColors().appFont,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  "Surah",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 73.w,
                              height: 37.h,
                              margin:
                                  EdgeInsets.only(top: 8, right: 8, bottom: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  "Doaa",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]))),
      ),
    );
  }
}
