import 'package:flutter/material.dart';
import 'package:newzapp/Services/services.dart';
import 'package:newzapp/widget/fonts.dart';
import 'package:shimmer/shimmer.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUsBusinessData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            //final List<dynamic> ratedMovies = snapshot.data!;
            return Container(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 350,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      snapshot.data![index]['urlToImage'],
                                    ),
                                  )),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 10,
                              child: Container(
                                  //height: 200,
                                  width: 200,
                                  child: text(
                                    0,
                                    data: snapshot.data![index]['title'],
                                    color: Colors.white,
                                    size: 13,
                                    Bold: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            );
          }
        });
  }
}
