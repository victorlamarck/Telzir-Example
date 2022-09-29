import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:disconts/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final controller = Modular.get<SplashStore>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (_) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 1300),
              opacity: controller.opacity,
              curve: Curves.easeIn,
              child: Image.asset(
                'assets/images/logo.jpg',
              ),
            );
          },
        ),
      ),
    );
  }
}
