import 'package:example/app/shared/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {
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
        actions: [
          TextButton(
            child: Text(
              'Pular',
              style: AppFonts.roboto.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Modular.to.navigate('/home/'),
          ),
          const SizedBox(width: 20),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 36),
                  Text(
                    'Selecione as categorias\ndo seu interesse',
                    style: AppFonts.openSans.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 26),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 26,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (_, index) {
                      return Container(
                        color: Colors.red,
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () => Modular.to.navigate('/home/'),
                child: Text(
                  'Próximo',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
