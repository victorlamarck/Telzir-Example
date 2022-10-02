import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  final String title;
  const MyProfilePage({Key? key, this.title = 'MyProfilePage'})
      : super(key: key);
  @override
  MyProfilePageState createState() => MyProfilePageState();
}

class MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
