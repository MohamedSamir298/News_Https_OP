import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/screens/tabs/categories_tab.dart';
import 'package:news/screens/tabs/news_tab.dart';

class Home extends StatelessWidget {
  static String routeName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'News',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff39A552),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        leading: Icon(Icons.menu),
      ),
      body: NewsTab(),
    );
  }
}
