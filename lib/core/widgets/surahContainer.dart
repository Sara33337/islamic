import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/feature/surah/presentation/view/surahRead.dart';
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';

class surahContainer extends StatelessWidget {
  const surahContainer({
    super.key,
    required this.surahModel
  });

  final Surah surahModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7.w,
          height: 70.h,
          margin: EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(
              color: AppColors().appFont,
              borderRadius: BorderRadius.circular(12)),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return ReadSurah(surahModel: surahModel,);
            }));
          },
          child: Container(
            width: 310.w,
            height: 70.h,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7,
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.14))
                ]),
            child: Center(
              child: ListTile(
                leading: Container(
                    width: 35.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors().appFont, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                        child: Text(
                      surahModel.number.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ))),
                title: Text(
                  surahModel.englishName,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF240F4F))),
                ),
                subtitle: Text(
                "${surahModel.revelationType} ",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8789A3))),
                ),
                trailing: Text(
                  surahModel.name,
                  style: GoogleFonts.amiri(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF863ED5))),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}