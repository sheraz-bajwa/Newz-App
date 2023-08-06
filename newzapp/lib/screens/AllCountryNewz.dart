import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:newzapp/widget/fonts.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  TextEditingController _countryController = TextEditingController();
  List<dynamic> _news = [];

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Future<void> fetchNews(String country) async {
    final queryParameters = {
      'country': country,
      'apiKey': '02a212ded5af40528a0d30959c5dadf1',
    };

    final uri = Uri.https('newsapi.org', '/v2/top-headlines', queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _news = data["articles"];
      });
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _countryController,
                // decoration: InputDecoration(
                //   hintText: 'Enter country code (e.g., in, us)',
                // ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 1, color: Color(0xffE6E8EB)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xffE6E8EB))),
                  hintText: 'Enter country code (e.g., in, us)',
                  hintStyle: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                fetchNews(_countryController.text);
              },
              child: Text('Get News'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  String date = formatDate(
                    _news[index]['publishedAt'] != null
                        ? _news[index]['publishedAt']
                        : 'Not Available',
                  );

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                            offset: const Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          _news[index]['urlToImage'] != null
                                              ? _news[index]['urlToImage']
                                              : 'loading',
                                        ),
                                      )),
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        text(0,
                                            data: _news[index]['title'] != null
                                                ? _news[index]['title']
                                                : 'Not Available',
                                            color: Colors.black,
                                            size: 15),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              text(
                                                0,
                                                data: _news[index]['source']
                                                            ['id'] !=
                                                        null
                                                    ? _news[index]['source']
                                                        ['id']
                                                    : 'Nill',
                                                color: Colors.blueAccent,
                                                size: 15,
                                                Bold: FontWeight.bold,
                                              ),
                                              text(0,
                                                  data: date,
                                                  color: Colors.black,
                                                  size: 15)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}