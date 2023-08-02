import 'package:flutter/material.dart';
import 'package:newzapp/HomePage.dart';
import 'package:newzapp/Services/Top.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: ListView(
          children: [Top(), HomePage()],
        ));
  }
}
