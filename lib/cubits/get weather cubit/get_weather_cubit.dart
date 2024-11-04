import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_myapp/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app_myapp/models/weather_model.dart';
import 'package:weather_app_myapp/services/weather_services.dart';
import 'package:weather_app_myapp/views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherServices(Dio()).getcurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
