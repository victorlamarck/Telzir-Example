import 'package:asuka/asuka.dart';
import 'package:disconts/app/modules/splash/register/register_page.dart';
import 'package:disconts/app/shared/interfaces/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final userRepository = Modular.get<IUser>();
  final keyForm = GlobalKey<FormState>();

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
  firstStepRegister() async {
    var cpfCnpj = cpfController.text
        .trim()
        .replaceAll('/', '')
        .replaceAll('.', '')
        .replaceAll('-', '');
    if (nameController.text.trim() == '')
      return AsukaSnackbar.message('Necessário preencher o seu nome');

    if (emailController.text.trim() == '' && emailController.text.contains('@'))
      return AsukaSnackbar.message('Necessário preencher o seu email');

    if (cpfCnpj == '')
      return AsukaSnackbar.message('Necessário preencher o seu nome');

    registerAcc();
  }

  @action
  registerAcc() async {
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
        print(r);
        nextPage();
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
