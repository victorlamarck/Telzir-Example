import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int pageIndex = 0;

  @action
  void navigate(int index) {
    pageIndex = index;

    switch (index) {
      case 0:
        Modular.to.navigate('/home/initial/');
        break;
      case 1:
        Modular.to.navigate('/home/search/');
        break;
      case 2:
        Modular.to.navigate('/home/cart/');
        break;
      case 3:
        Modular.to.navigate('/home/my_profile/');
        break;
    }
  }
}
