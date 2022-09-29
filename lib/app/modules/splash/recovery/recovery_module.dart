import 'package:disconts/app/modules/splash/recovery/confirmation/confirmation_page.dart';
import 'package:disconts/app/modules/splash/recovery/confirmation/confirmation_store.dart';
import 'package:disconts/app/modules/splash/recovery/recovery_Page.dart';
import 'package:disconts/app/modules/splash/recovery/recovery_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoveryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RecoveryStore()),
    Bind.lazySingleton((i) => ConfirmationStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RecoveryPage()),
    ChildRoute('/confirmation', child: (_, args) => ConfirmationPage()),
  ];
}
