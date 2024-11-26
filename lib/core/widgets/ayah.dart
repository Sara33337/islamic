import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';

class Ayat extends StatelessWidget {
  Ayat({super.key, required this.ayahModel});

  
  final Ayah ayahModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          
            Container(
              width: 327.w,
              height: 47.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors().appFont.withOpacity(0.12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      width: 30.w,
                      height: 27.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF863ED5),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Center(
                        child: Text(
                          ayahModel.number.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_outlined,
                          size: 30,
                          color: Color(0xFF863ED5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final player = AudioPlayer();
                          
                          player.play(UrlSource(ayahModel.audio));
                        },
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          size: 35,
                          color: Color(0xFF863ED5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          size: 30,
                          color: Color(0xFF863ED5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 327.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0, 4),
                      color: Colors.grey.withOpacity(0.15))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                
                    Text(
                      ayahModel.text,
                      maxLines: null,
                      style: GoogleFonts.amiri(
                          textStyle: TextStyle(
                              color: Color(0xFF240F4F),
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   "[All] praise is [due] to Allah, Lord of the worlds -",
                  //   maxLines: null,
                  //   style: GoogleFonts.amiri(
                  //       textStyle: TextStyle(
                  //           color: Color(0xFF240F4F),
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w700)),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
