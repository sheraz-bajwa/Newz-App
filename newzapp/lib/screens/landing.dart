import 'package:flutter/material.dart';
import 'package:newzapp/screens/AllCountryNewz.dart';
import 'package:newzapp/screens/HomePage.dart';
import 'package:newzapp/screens/Top.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newzapp/widget/SideBar.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: Icon(
              Icons.menu, // Replace with your custom icon data
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        // drawer: ExampleSidebarX(

        //     // Drawer content goes here
        //     // ...
        //     ),
        // actions: [

        //   IconButton(onPressed: () { Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) =>  NewsApp()),
        //           );}, icon: Icon(Icons.person_outlined))
        // ],

        body: ListView(
          children: [Top(), HomePage()],
        ));
  }
}
