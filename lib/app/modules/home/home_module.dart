import 'package:disconts/app/modules/home/detail_product/detail_product_page.dart';
import 'package:disconts/app/modules/home/detail_product/detail_product_store.dart';
import 'package:disconts/app/modules/home/cart/cart_page.dart';
import 'package:disconts/app/modules/home/my_profile/my_profile_page.dart';
import 'package:disconts/app/modules/home/my_profile/my_profile_store.dart';
import 'package:disconts/app/modules/home/cart/cart_store.dart';
import 'package:disconts/app/modules/home/search/search_page.dart';
import 'package:disconts/app/modules/home/search/search_store.dart';
import 'package:disconts/app/modules/home/initial/initial_page.dart';
import 'package:disconts/app/modules/home/initial/initial_store.dart';
import 'package:disconts/app/modules/home/working/working_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailProductStore()),
    Bind.lazySingleton((i) => CartStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => InitialStore()),
    Bind.lazySingleton((i) => MyProfileStore()),
    Bind.lazySingleton((i) => SearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
      children: [
        ChildRoute(
          '/initial/',
          child: (_, args) => const InitialPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/search/',
          child: (_, args) => const SearchPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/cart/',
          child: (_, args) => const CartPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/my_profile/',
          child: (_, args) => const MyProfilePage(),
          transition: TransitionType.noTransition,
        ),
      ],
    ),
    ChildRoute(
      '/product/:id',
      child: (_, args) => DetailProductPage(id: args.params['id']),
    ),
    ChildRoute('/working/', child: (_, args) => const WorkingPage()),
  ];
}
