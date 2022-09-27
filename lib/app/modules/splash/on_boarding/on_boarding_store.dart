import 'package:mobx/mobx.dart';

part 'on_boarding_store.g.dart';

class OnBoardingStore = _OnBoardingStoreBase with _$OnBoardingStore;
abstract class _OnBoardingStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}