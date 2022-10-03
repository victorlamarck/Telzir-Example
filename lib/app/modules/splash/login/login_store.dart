import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:disconts/app/shared/interfaces/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final userRepository = Modular.get<IUser>();
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

  @action
  validate() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (keyForm.currentState?.validate() == false) {
      return AsukaSnackbar.alert('Você precisa preencher os campos indicados')
          .show();
    }

    login();
  }

  @action
  login() async {
    final result = await userRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (l) => AsukaSnackbar.message(l.message).show(),
      (r) => log(r.toJson()),
    );
  }
}
