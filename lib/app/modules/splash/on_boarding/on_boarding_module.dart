import 'package:example/app/modules/splash/on_boarding/categories/categories_page.dart';
import 'package:example/app/modules/splash/on_boarding/categories/categories_store.dart';
import 'package:example/app/modules/splash/on_boarding/on_boarding_page.dart';
import 'package:example/app/modules/splash/on_boarding/on_boarding_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnBoardingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnBoardingStore()),
    Bind.lazySingleton((i) => CategoriesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OnBoardingPage()),
    ChildRoute('/categories', child: (_, args) => CategoriesPage()),
  ];
}
