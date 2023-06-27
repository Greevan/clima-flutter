import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String apiId= '3615d7492cc58eba03a158ff3d2bf632';

  Future<dynamic> getNamedLocation(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiId&units=metric');
    var responseData = await networkHelper.getData();
    return responseData;
  }

  Future<dynamic> getLocationWeather() async{
    Location locate = Location();
    await locate.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apiId&units=metric');
    var responseData = await networkHelper.getData();
    return responseData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp <= 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp > 30) {
      return 'Drink more 🥥 water';
    } else {
      return 'Don\'t come out.';
    }
  }
}
