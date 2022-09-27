import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'confirmation_store.g.dart';

class ConfirmationStore = _ConfirmationStoreBase with _$ConfirmationStore;

abstract class _ConfirmationStoreBase with Store {
  final keyForm = GlobalKey<FormState>();

  final tokenController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  @observable
  bool newPassIsObscured = true;

  @observable
  bool confirmationPassIsObscured = true;

  @observable
  Icon newPasswordIcon = Icon(Icons.visibility, color: Colors.grey);

  @observable
  Icon confirmationPasswordIcon = Icon(Icons.visibility, color: Colors.grey);

  @action
  showNewPassword() {
    if (newPassIsObscured == false) {
      newPassIsObscured = !newPassIsObscured;
      newPasswordIcon = Icon(Icons.visibility, color: Colors.grey);
    } else {
      newPassIsObscured = !newPassIsObscured;
      newPasswordIcon = Icon(Icons.visibility_off, color: Colors.grey);
    }
  }

  @action
  showConfirmationPassword() {
    if (confirmationPassIsObscured == false) {
      confirmationPassIsObscured = !confirmationPassIsObscured;
      confirmationPasswordIcon = Icon(Icons.visibility, color: Colors.grey);
    } else {
      confirmationPassIsObscured = !confirmationPassIsObscured;
      confirmationPasswordIcon = Icon(Icons.visibility_off, color: Colors.grey);
    }
  }
}
