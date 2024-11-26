class QuranResponse {
  final int code;
  final String status;
  final List<Surah> surahs;

  QuranResponse({required this.code, required this.status, required this.surahs});

  factory QuranResponse.fromJson(Map<String, dynamic> json) {
    return QuranResponse(
      code: json['code'],
      status: json['status'],
      surahs: (json['data']['surahs'] as List).map((index) => Surah.fromJson(index)).toList(),
    );
  }
}

class Surah {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      revelationType: json['revelationType'],
      ayahs: (json['ayahs'] as List).map((index) => Ayah.fromJson(index)).toList(),
    );
  }
}

class Ayah {
  final int number;
  final String audio;
  final List<String> audioSecondary;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;


  Ayah({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,

  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'],
      audio: json['audio'],
      audioSecondary: List<String>.from(json['audioSecondary']),
      text: json['text'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],

    );
  }
}
