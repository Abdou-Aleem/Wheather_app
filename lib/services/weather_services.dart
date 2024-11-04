
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_myapp/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'cf7c08dd64a2460ca88185047241410';

  WeatherServices(this.dio);

  Future<WeatherModel> getcurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try again later';
      throw Exception(errMessage);

    } catch (e) {
      log(e.toString());
      throw Exception('ops there was an error, try again later');
    }
  }

  // Future<WeatherModel> getForcast({required String cityName}) async {
  //   Response response = await dio.get(
  //       '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
  //   WeatherModel weatherModel = WeatherModel.fromJson(response.data);

  //   return weatherModel;
  // }
}
