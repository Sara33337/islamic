import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';

class getSurahService {
  Future<List<Surah>> getSurah() async {
    final response = await http.get(Uri.parse("https://api.alquran.cloud/v1/quran/ar.alafasy"));
    
    if (response.statusCode == 200) {
      Map<String, dynamic> fetchedData = jsonDecode(response.body);
      List<dynamic> surahs = fetchedData['data']['surahs']; // Access nested data if needed

      List<Surah> fetchedSurahs = [];
      
      for (int i = 0; i < surahs.length-1 ; i++) {
        fetchedSurahs.add(Surah.fromJson(surahs[i]));
      }
      
      return fetchedSurahs;
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }
}
