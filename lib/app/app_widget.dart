import 'package:asuka/asuka.dart';
import 'package:example/app/shared/core/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (BuildContext context, Widget? child) {
        return Asuka.builder(context, child);
      },
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Contatos',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: AppColors.primaryBlack,
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
