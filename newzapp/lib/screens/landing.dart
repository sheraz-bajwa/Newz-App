import 'package:flutter/material.dart';
import 'package:newzapp/screens/AllCountryNewz.dart';
import 'package:newzapp/screens/TechCrunch.dart';
import 'package:newzapp/screens/TopHeadlines.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newzapp/widget/SideBar.dart';
import 'package:newzapp/widget/fonts.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        appBar: AppBar(
          title: text(
            0,
            data: 'The News',
            color: Color.fromARGB(255, 58, 58, 58),
            size: 30,
            Bold: FontWeight.bold,
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/menus.png',
                    height: 20,
                    width: 20,
                    color: const Color.fromARGB(255, 58, 58, 58),
                  ),
                ),
              );
            },
          ),
        ),
        drawer: ExampleSidebarX(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text(
                    0,
                    data: '.',
                    color: Colors.white,
                    size: 1,
                    Bold: FontWeight.bold,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    0,
                    data: 'Top Headlines',
                    color: Colors.black,
                    size: 33,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Top(),
                  SizedBox(
                    height: 20,
                  ),
                  text(0, data: 'Tech News', color: Colors.black, size: 33),
                  HomePage()
                ],
              ),
            ),
          ],
        ));
  }
}
