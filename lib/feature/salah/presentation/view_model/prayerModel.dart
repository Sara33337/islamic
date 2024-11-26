class PrayerTimingResponse {
  final int code;
  final String status;
  final TimingsData data;

  PrayerTimingResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimingResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimingResponse(
      code: json['code'],
      status: json['status'],
      data: TimingsData.fromJson(json['data']),
    );
  }
}

class TimingsData {
  final Timings timings;
  final DateInfo date;

  TimingsData({required this.timings, required this.date});

  factory TimingsData.fromJson(Map<String, dynamic> json) {
    return TimingsData(
      timings: Timings.fromJson(json['timings']),
      date: DateInfo.fromJson(json['date']),
    );
  }
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstThird;
  final String lastThird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstThird,
    required this.lastThird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstThird: json['Firstthird'],
      lastThird: json['Lastthird'],
    );
  }
}

class DateInfo {
  final String readable;
  final HijriDate hijri;
  

  DateInfo({
    required this.readable,
    required this.hijri,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      readable: json['readable'],
      hijri: HijriDate.fromJson(json['hijri']),
    
    );
  }
}

class HijriDate {
  final String date;
  final String format;
  final String day;
  
  final String year;

  HijriDate({
    required this.date,
    required this.format,
    required this.day,
  
    required this.year,
  });

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      date: json['date'],
      format: json['format'],
      day: json['day'],

      year: json['year'],
    );
  }
}

