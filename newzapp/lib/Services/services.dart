import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newzapp/Services/WallStreetMethood.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchWallStreetData() async {
  var url = Uri.parse(
      'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=02a212ded5af40528a0d30959c5dadf1');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["articles"];
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

//al-jazeera-english
//cbc-news
//cnn
//bbc-news
//cbs-news
//google-news
//the-washington-post
//nbc-news
//usa-today
Future<List<dynamic>> fetchUsBusinessData() async {
  var url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=cnn&apiKey=02a212ded5af40528a0d30959c5dadf1');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["articles"];
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

// Future<void> fetchNews(String country) async {
//   final queryParameters = {
//     'country': country,
//     'apiKey': '02a212ded5af40528a0d30959c5dadf1',
//   };

//   final uri = Uri.https('newsapi.org', '/v2/top-headlines', queryParameters);

//   final response = await http.get(uri);

//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//     return data["articles"];
//   } else {
//     throw Exception('Error');
//   }
// }
