import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
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
}
