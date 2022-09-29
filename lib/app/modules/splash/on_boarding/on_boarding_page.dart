import 'package:disconts/app/shared/core/app_colors.dart';
import 'package:disconts/app/shared/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30,
          child: Image.asset(
            'assets/images/logo.jpg',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            const SizedBox(height: 60),
            SizedBox(
              height: 250,
              child: Image.asset(
                'assets/images/homeinitial.png',
              ),
            ),
            const SizedBox(height: 37),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bem vindo ao\ne-commerce que quer\nmelhorar o mundo!',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 54),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/login/'),
                child: Text(
                  'Log in',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: () =>
                    Modular.to.pushNamed('/on_boarding/categories'),
                child: Text(
                  'Entrar sem log in',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AINDA NÃO TEM CADASTRO?',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  child: Text(
                    'CLIQUE AQUI!',
                    style: AppFonts.roboto.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: AppColors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => Modular.to.pushNamed('/register/'),
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
