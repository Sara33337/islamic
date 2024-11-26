import 'dart:convert';
import 'package:http/http.dart' as http;

class SalahService {
  Future<Map<String, dynamic>> getPrayerTimes() async {
    final response = await http.get(Uri.parse(
        "https://api.aladhan.com/timingsByAddress?address=Egypt,UK&method=99&methodSettings=18.5,null,17.5&tune=1,2,3,4,5"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> fetchedData = jsonDecode(response.body);

      // Access the timings
      Map<String, dynamic> salah = fetchedData['data']['timings'];

      // Access the date
      Map<String, dynamic> dateData = fetchedData['data']['date'];
      String date = dateData['readable']; // Format: "20-Apr-2024"

      // Convert timings to Map<String, String>
      Map<String, String> prayerTimes = salah.map((key, value) => MapEntry(key, value.toString()));

      // Return both the date and prayer times
      return {
        'date': date,
        'prayerTimes': prayerTimes,
      };
    } else {
      throw Exception("Failed to load prayer times: ${response.statusCode}");
    }
  }
}
