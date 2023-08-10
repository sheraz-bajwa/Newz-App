import 'package:flutter/material.dart';
import 'package:newzapp/Services/WallStreetMethood.dart';
import 'package:newzapp/screens/AllCountryNewz.dart';
import 'package:newzapp/screens/DifferentSources.dart';
import 'package:newzapp/screens/categories.dart';
import 'package:newzapp/screens/landing.dart';
import 'package:newzapp/widget/fonts.dart';
import 'package:sidebarx/sidebarx.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          hoverColor: scaffoldBackgroundColor,
          textStyle: TextStyle(color: canvasColor),
          selectedTextStyle: const TextStyle(color: Colors.white),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: canvasColor),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: actionColor.withOpacity(0.37),
            ),
            gradient: const LinearGradient(
              colors: [accentCanvasColor, canvasColor],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 30,
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: canvasColor,
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
        ),
        extendedTheme: const SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: extendedcolor,
          ),
        ),
        footerDivider: divider,
        headerBuilder: (context, extended) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: text(
                  0,
                  data: 'The News',
                  color: canvasColor,
                  size: 40,
                  Bold: FontWeight.bold, 
                ),
                //Image.asset('assets/MyTime.png'),
              ),
            ),
          );
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Landing()),
              );
            },
          ),
          SidebarXItem(
              icon: Icons.search,
              label: 'Search Country News',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCounties()),
                );
              }),
          SidebarXItem(
              icon: Icons.category_outlined,
              label: 'Category',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCategories()),
                );
              }),
          SidebarXItem(
              icon: Icons.newspaper,
              label: 'News By agencies',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => All()),
                );
              }),
          SidebarXItem(
              iconWidget: FlutterLogo(size: 20),
              label: 'Flutter',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCounties()),
                );
              }),
        ],
      ),
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const extendedcolor = Color.fromRGBO(224, 217, 238, 1);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color.fromRGBO(70, 70, 103, 1);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
