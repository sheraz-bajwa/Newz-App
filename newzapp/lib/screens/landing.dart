import 'package:flutter/material.dart';
import 'package:newzapp/screens/HomePage.dart';
import 'package:newzapp/screens/Top.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.content_cut_rounded))
          ],
        ),
        body: ListView(
          children: [Top(), HomePage()],
        ));
  }
}
