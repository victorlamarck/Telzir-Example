import 'package:mobx/mobx.dart';

part 'my_profile_store.g.dart';

class MyProfileStore = _MyProfileStoreBase with _$MyProfileStore;
abstract class _MyProfileStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}