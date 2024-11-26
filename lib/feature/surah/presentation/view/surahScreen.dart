import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/core/widgets/appDesign.dart';
import 'package:islamicapp/core/widgets/surahContainer.dart';
import 'package:islamicapp/feature/Doaa/presentation/view/DoaaScreen.dart';
import 'package:islamicapp/feature/surah/logic/cubit/surah_cubit_cubit.dart';
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahScreen extends StatefulWidget {
  SurahScreen({super.key, this.surahModel});
  final Surah? surahModel;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<Surah> allSurahs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SurahCubitCubit()..fetchSurahs(),
        child: BlocBuilder<SurahCubitCubit, SurahCubitState>(
          builder: (context, state) {
            if (state is SurahCubitLoaded) {
              allSurahs = state.surahs; // Assign surahs data to allSurahs

              return SingleChildScrollView(
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
                                    surahModel: widget.surahModel);
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
                            onTap: () {
                              
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DoaaScreen();
                              }));
                            },
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
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allSurahs.length,
                        itemBuilder: (context, index) {
                          return surahContainer(
                            surahModel: allSurahs[index],
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            } else if (state is SurahCubitError) {
              // Handle error state (displaying error message)
              return Center(
                child: Text(
                  "Error: ${state.error}",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            } else {
              // Fallback for unexpected states
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
