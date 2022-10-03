import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:disconts/app/modules/splash/register/register_page.dart';
import 'package:disconts/app/shared/interfaces/user_interface.dart';
import 'package:disconts/app/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final userRepository = Modular.get<IUser>();

  final keyForm1 = GlobalKey<FormState>();
  final keyForm2 = GlobalKey<FormState>();
  final keyForm3 = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final tokenFromEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @observable
  bool isObscuredNew = true;

  @observable
  bool isObscuredConfirmation = true;

  @observable
  Icon newPasswordIcon = Icon(Icons.visibility, color: Colors.grey);

  @observable
  Icon confirmationPasswordIcon = Icon(Icons.visibility, color: Colors.grey);

  @observable
  int indexPage = 1;

  @observable
  bool? checkBox = false;

  @observable
  UserModel? user;

  @action
  nextPage() {
    indexPage++;
  }

  @action
  previousPage() {
    indexPage--;
  }

  @action
  showNewPassword() {
    if (isObscuredNew == false) {
      isObscuredNew = !isObscuredNew;
      newPasswordIcon = Icon(Icons.visibility, color: Colors.grey);
    } else {
      isObscuredNew = !isObscuredNew;
      newPasswordIcon = Icon(Icons.visibility_off, color: Colors.grey);
    }
  }

  @action
  showConfirmationPassword() {
    if (isObscuredConfirmation == false) {
      isObscuredConfirmation = !isObscuredConfirmation;
      confirmationPasswordIcon = Icon(Icons.visibility, color: Colors.grey);
    } else {
      isObscuredConfirmation = !isObscuredConfirmation;
      confirmationPasswordIcon = Icon(Icons.visibility_off, color: Colors.grey);
    }
  }

  @action
  firstStepValidate() {
    if (keyForm1.currentState!.validate() == false) {
      return AsukaSnackbar.alert('Você precisa preencher os campos indicados')
          .show();
    }

    firstStepRegister();
  }

  @action
  firstStepRegister() async {
    final result = await userRepository.register(
      name: nameController.text,
      email: emailController.text,
      cpfCnpj: cpfController.text
          .trim()
          .replaceAll('/', '')
          .replaceAll('.', '')
          .replaceAll('-', ''),
    );

    result.fold(
      (l) => AsukaSnackbar.message(l.message).show(),
      (r) {
        log(r.toJson());
        user = r;
        nextPage();
      },
    );
  }

  @action
  secondStepValidate() {
    if (keyForm2.currentState!.validate() == false) {
      return AsukaSnackbar.alert('Você precisa preencher os campos indicados')
          .show();
    }

    secondStepRegister();
  }

  @action
  secondStepRegister() async {
    final result = await userRepository.confirmEmail(
      email: emailController.text,
      code: tokenFromEmailController.text,
    );

    result.fold(
      (l) => AsukaSnackbar.message(l.message).show(),
      (r) {
        log(r.toJson());
        user = r;
        nextPage();
      },
    );
  }

  @action
  thirdStepValidate() {
    if (keyForm3.currentState!.validate() == false) {
      return AsukaSnackbar.alert('Você precisa preencher os campos indicados')
          .show();
    }

    if (checkBox == null || !checkBox!)
      return AsukaSnackbar.alert(
              'Você precisa aceitar os Termos de uso e Políticas de privacidade.')
          .show();

    thirdStepRegister();
  }

  @action
  thirdStepRegister() async {
    final result = await userRepository.registerPassword(
      password: passwordController.text,
      confirmationPassword: passwordConfirmationController.text,
      userId: '${user?.id}',
    );

    result.fold(
      (l) => AsukaSnackbar.message(l.message).show(),
      (r) {
        log(r.toJson());
        registerAccount();
      },
    );
  }

  @action
  registerAccount() async {
    await Asuka.showDialog(
      barrierColor: Colors.black54.withOpacity(0.3),
      builder: (context) {
        return ConfirmationDialog();
      },
    );

    Modular.to.pushNamed('/home/');
  }
}
