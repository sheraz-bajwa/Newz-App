import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newzapp/Services/WallStreetMethood.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchWallStreetData() async {
  var url = Uri.parse(
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=02a212ded5af40528a0d30959c5dadf1');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["articles"];
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

Future<List<dynamic>> fetchUsBusinessData() async {
  var url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=02a212ded5af40528a0d30959c5dadf1');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["articles"];
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

Future<List<dynamic>> fetchRecords(String city) async {
    //final response = await http.get(Uri.parse(AppUrl.Lahore));
    final queryParameter = {
      'q': city,
      'appid': '1962c8af92e499cfaf0f17369aed0f0b',
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);
final response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data["articles"];
    } else {
      throw Exception('Error');
    }
  }
