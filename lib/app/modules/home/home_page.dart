import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:example/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disconts'),
      ),
      body: Container(
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
