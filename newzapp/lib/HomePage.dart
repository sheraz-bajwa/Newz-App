import 'package:flutter/material.dart';
import 'package:newzapp/Services/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder(
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
                          height: 30,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
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
                              Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        snapshot.data![index]['title'],
                                        style: TextStyle(color: Colors.amber),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            snapshot.data![index]
                                                ['publishedAt'],
                                            style:
                                                TextStyle(color: Colors.amber),
                                          ),
                                          // Text(
                                          //   snapshot.data![index]['id'],
                                          //   style: TextStyle(color: Colors.amber),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
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
