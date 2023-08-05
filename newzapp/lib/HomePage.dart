import 'package:flutter/material.dart';
import 'package:newzapp/Services/Top.dart';
import 'package:newzapp/Services/services.dart';
import 'package:newzapp/fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: FutureBuilder(
          future: fetchWallStreetData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              //final List<dynamic> ratedMovies = snapshot.data!;
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2.0,
                                  blurRadius: 5.0,
                                  offset: const Offset(0,
                                      3), // changes the position of the shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          snapshot.data![index]['urlToImage'],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            //height: 200,
                                            width: 200,
                                            child: text(0,
                                                data: snapshot.data![index]
                                                    ['title'],
                                                color: Colors.white,
                                                size: 20)),
                                        Row(
                                          children: [
                                            Container(
                                              // width: 200,
                                              child: Text(
                                                snapshot.data![index]
                                                    ['publishedAt'],
                                                style: TextStyle(
                                                    color: Colors.amber),
                                              ),
                                            ),
                                            // Text(
                                            //   snapshot.data![index]['id'],
                                            //   style: TextStyle(color: Colors.amber),
                                            // ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}
