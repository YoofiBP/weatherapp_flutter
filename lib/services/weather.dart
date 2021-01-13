import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "501c93088acd414b56c915dc401559da";
const openWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  NetworkHelper networkHelper;
  Future<dynamic> getCityWeather(String cityName) async {
    networkHelper = NetworkHelper(
        "$openWeatherUrl?q=$cityName&units=imperial&appid=$apiKey");

    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    networkHelper = NetworkHelper(
        "$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&units=imperial&appid=$apiKey");

    dynamic weatherData = await networkHelper.getData();
    return weatherData;
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
