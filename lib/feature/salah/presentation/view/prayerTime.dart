import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/core/widgets/salah.dart';
import 'package:islamicapp/feature/salah/logic/cubit/salah_cubit.dart';

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({super.key});

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SalahCubit()..fetchPrayerTimes(),
        child: BlocBuilder<SalahCubit, SalahState>(
          builder: (context, state) {
            if (state is SalahLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SalahLoadded) {
              // Fetched data
              final timings = state.prayerTimes; // A Map<String, String>
              // A formatted date string
              final date = state.date;

              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 330.h,
                        child: Image.asset(
                          "assets/images/salah.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Prayer Times',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Next Prayer',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // Dynamically display the next prayer time
                            Text(
                              '${timings['Fajr']}',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 90,),
                            Center(
                              child: Text(
                                'What distinguishes believers from \ninfidels is abandoning prayer.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFF180B37),
                      child: Column(
                        
                        children: [
                          Container(
                            width: 300.w,
                            height: 45.h,
                            margin: EdgeInsets.only( bottom: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: Center(
                              child: Text(
                                date.toString(), // Display the fetched date
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: timings.length,
                              itemBuilder: (context, index) {
                                final key = timings.keys.elementAt(index);
                                final value = timings[key];
                                return SalahTime(
                                  prayerName: key,
                                  prayerTime: value,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is SalahError) {
              return Center(
                child: Text(
                  state.error,
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Unexpected error'));
            }
          },
        ),
      ),
    );
  }
}
