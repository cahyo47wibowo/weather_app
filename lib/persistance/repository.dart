import 'package:weather_app/model/weather_response_model.dart';
import 'package:weather_app/persistance/api_provider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<WeatherResponse> fetchLondonWeather() => apiProvider.fetchLondonWeather();
}