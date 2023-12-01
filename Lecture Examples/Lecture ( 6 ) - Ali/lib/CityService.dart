import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';
import 'locationService.dart';
import 'package:http/http.dart' as http;

late String date;


class CityService
{

  Future<List<String>> fetchCitySuggestions(String input) async {
    final response = await http.get(
      Uri.parse('http://api.geonames.org/searchJSON?q=$input&maxRows=10&username=saad.badie&type=json&featureClass=P'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> suggestions = json.decode(response.body)['geonames'];
      return suggestions.map((suggestion) => suggestion['name'].toString()).toList();
    } else {
      // Handle error
      print('Failed to fetch city suggestions');
      return [];
    }
  }



  Future<dynamic> OpenWeatherCity(dynamic cityname) async
  {
    LocationService obj = await new LocationService();
    await obj.GetLocation();
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=abe6f24f2d68edde13d556d363c0be58&units=metric'));
    if(response.statusCode == 200)
    {
      date = response.body;

      print(date);
      return jsonDecode(date);
    }
    else
    {

      return response.statusCode;
    }
  }

  Future<dynamic> OpenWeatherMap() async
  {
    LocationService obj = await new LocationService();
    await obj.GetLocation();
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${obj.latitude}&lon=${obj.longtuide}&appid=abe6f24f2d68edde13d556d363c0be58&units=metric'));
    if(response.statusCode == 200)
    {
      date = response.body;

      print(date);
      return jsonDecode(date);
    }
    else
    {

      return response.statusCode;
    }
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
}