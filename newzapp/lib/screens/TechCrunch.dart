import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzapp/screens/TopHeadlines.dart';
import 'package:newzapp/Services/services.dart';
import 'package:newzapp/widget/fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd').format(dateTime);
    }

    return Container(
      child: FutureBuilder(
          future: fetchWallStreetData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 800,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors
                                            .white, // Background color of the shimmering tile
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 20,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors
                                                .white, // Background color of the shimmering tile
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 20,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors
                                                .white, // Background color of the shimmering tile
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 20,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors
                                                .white, // Background color of the shimmering tile
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade400,
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              //final List<dynamic> ratedMovies = snapshot.data!;
              return Container(
                height: 800,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String date = formatDate(
                        snapshot.data![index]['publishedAt'] != null
                            ? snapshot.data![index]['publishedAt']
                            : 'Not Available',
                      );
                      return InkWell(
                        onTap: () {
                          Future<void> _showAlertDialog(
                              BuildContext context) async {
                            return showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // icon: Icon(
                                  //   Icons.abc,
                                  //   color: Colors.amber,
                                  // ),

                                  title: Image.network(
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : 'loading',
                                  ),
                                  //contentTextStyle: ,
                                  content: text(
                                    0,
                                    color: Colors.black,
                                    size: 15,
                                    data:
                                        snapshot.data![index]['content'] != null
                                            ? snapshot.data![index]['content']
                                            : 'Not Available',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          _showAlertDialog(context);
                        },
                        child: Padding(
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
                                  offset: const Offset(0,
                                      3), // changes the position of the shadow
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                snapshot.data![index]
                                                            ['urlToImage'] !=
                                                        null
                                                    ? snapshot.data![index]
                                                        ['urlToImage']
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
                                                  data: snapshot.data![index]
                                                              ['title'] !=
                                                          null
                                                      ? snapshot.data![index]
                                                          ['title']
                                                      : 'Not Available',
                                                  color: Colors.black,
                                                  size: 15),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    text(
                                                      0,
                                                      data: snapshot.data![
                                                                          index]
                                                                      ['source']
                                                                  ['id'] !=
                                                              null
                                                          ? snapshot
                                                                  .data![index]
                                                              ['source']['id']
                                                          : 'Nill',
                                                      color: Colors.blueAccent,
                                                      size: 15,
                                                      Bold: FontWeight.bold,
                                                    ),
                                                    text(
                                                      0,
                                                      data: date,
                                                      color: Colors.black,
                                                      size: 15,
                                                      Bold: FontWeight.bold,
                                                    )
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
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
