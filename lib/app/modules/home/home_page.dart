import 'package:disconts/app/shared/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:disconts/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    controller.navigate(0);
  }

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
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: RouterOutlet(),
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.pageIndex,
            onTap: controller.navigate,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.green,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Ínicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Pesquisa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Carrinho',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Perfil',
              ),
            ],
          );
        },
      ),
    );
  }
}
