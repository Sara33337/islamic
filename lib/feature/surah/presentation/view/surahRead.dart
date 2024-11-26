import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:islamicapp/core/constants/AppColors.dart';
import 'package:islamicapp/core/widgets/ayah.dart';
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';

class ReadSurah extends StatefulWidget {
  const ReadSurah({super.key, required this.surahModel});
  final Surah surahModel;

  @override
  State<ReadSurah> createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {
  final AudioPlayer player = AudioPlayer();
  List<String> completeSurah = [];
  int currentAyahIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    getAllSurah();
    player.onPlayerComplete.listen((_) {
      playNextAyah();
    });
  }

  @override
  void dispose() {
    player.dispose(); // Dispose of the player to prevent memory leaks
    super.dispose();
  }

  // Function to get all audio URLs for the surah
  void getAllSurah() {
    completeSurah = widget.surahModel.ayahs.map((ayah) => ayah.audio).toList();
  }

  // Function to play the next ayah
  void playNextAyah() {
    if (currentAyahIndex < completeSurah.length) {
      player.play(UrlSource(completeSurah[currentAyahIndex]));
      currentAyahIndex++;
    } else {
      stopPlaying();
    }
  }

  // Function to handle play/stop button press
  void togglePlayPause() {
    if (isPlaying) {
      stopPlaying();
    } else {
      startPlaying();
    }
  }

  // Start playing from the first ayah
  void startPlaying() {
    setState(() {
      isPlaying = true;
      currentAyahIndex = 0;
    });
    playNextAyah();
  }

  // Stop the audio player and reset the state
  void stopPlaying() {
    player.stop();
    setState(() {
      isPlaying = false;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors().appFont,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
                    padding: const EdgeInsets.only(top: 28, right: 75, bottom: 20),
                    child: Text(
                      widget.surahModel.englishName,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 30.sp,
                          color: AppColors().appFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.surahModel.ayahs.length,
              itemBuilder: (context, index) {
                return Ayat(
                  ayahModel: widget.surahModel.ayahs[index],
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 5),
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.20),
                ),
              ],
            ),
            child: Center(
              child: IconButton(
                onPressed: togglePlayPause,
                icon: Icon(
                  isPlaying ? Icons.stop_outlined : Icons.play_arrow_outlined, // Show stop icon when playing
                  size: 40,
                  color: Color(0xFF863ED5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
