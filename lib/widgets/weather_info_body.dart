import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_myapp/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app_myapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
           Text(
            'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style:const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https:${weatherModel.image!}"),
              Text(
                weatherModel.temp.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: ${weatherModel.maxTemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mintemp: ${weatherModel.minTemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.weatherStateName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}

