import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, this.title = 'SearchPage'}) : super(key: key);
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
          ),
        ],
      ),
    );
  }
}
