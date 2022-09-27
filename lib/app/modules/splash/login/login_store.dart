import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final keyForm = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  bool isObscured = true;

  @observable
  Icon passwordIcon = Icon(Icons.visibility, color: Colors.grey);

  @action
  showPassword() {
    if (isObscured == false) {
      isObscured = !isObscured;
      passwordIcon = Icon(Icons.visibility, color: Colors.grey);
    } else {
      isObscured = !isObscured;
      passwordIcon = Icon(Icons.visibility_off, color: Colors.grey);
    }
  }
}
