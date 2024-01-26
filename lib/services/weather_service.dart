import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = 'YOUR_API_KEY';

  Future<Map<String, dynamic>> getWeather(double latitude, double longitude) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
