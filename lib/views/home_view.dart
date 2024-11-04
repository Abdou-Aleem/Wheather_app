import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_myapp/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app_myapp/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app_myapp/views/search_view.dart';
import 'package:weather_app_myapp/widgets/no_weather_body.dart';
import 'package:weather_app_myapp/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return Text('OPPS, there was an error ');
          }
        },
      ),
    );
  }
}
