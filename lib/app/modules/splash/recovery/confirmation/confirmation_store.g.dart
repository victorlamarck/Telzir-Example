// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmationStore on _ConfirmationStoreBase, Store {
  late final _$newPassIsObscuredAtom =
      Atom(name: '_ConfirmationStoreBase.newPassIsObscured', context: context);

  @override
  bool get newPassIsObscured {
    _$newPassIsObscuredAtom.reportRead();
    return super.newPassIsObscured;
  }

  @override
  set newPassIsObscured(bool value) {
    _$newPassIsObscuredAtom.reportWrite(value, super.newPassIsObscured, () {
      super.newPassIsObscured = value;
    });
  }

  late final _$confirmationPassIsObscuredAtom = Atom(
      name: '_ConfirmationStoreBase.confirmationPassIsObscured',
      context: context);

  @override
  bool get confirmationPassIsObscured {
    _$confirmationPassIsObscuredAtom.reportRead();
    return super.confirmationPassIsObscured;
  }

  @override
  set confirmationPassIsObscured(bool value) {
    _$confirmationPassIsObscuredAtom
        .reportWrite(value, super.confirmationPassIsObscured, () {
      super.confirmationPassIsObscured = value;
    });
  }

  late final _$newPasswordIconAtom =
      Atom(name: '_ConfirmationStoreBase.newPasswordIcon', context: context);

  @override
  Icon get newPasswordIcon {
    _$newPasswordIconAtom.reportRead();
    return super.newPasswordIcon;
  }

  @override
  set newPasswordIcon(Icon value) {
    _$newPasswordIconAtom.reportWrite(value, super.newPasswordIcon, () {
      super.newPasswordIcon = value;
    });
  }

  late final _$confirmationPasswordIconAtom = Atom(
      name: '_ConfirmationStoreBase.confirmationPasswordIcon',
      context: context);

  @override
  Icon get confirmationPasswordIcon {
    _$confirmationPasswordIconAtom.reportRead();
    return super.confirmationPasswordIcon;
  }

  @override
  set confirmationPasswordIcon(Icon value) {
    _$confirmationPasswordIconAtom
        .reportWrite(value, super.confirmationPasswordIcon, () {
      super.confirmationPasswordIcon = value;
    });
  }

  late final _$_ConfirmationStoreBaseActionController =
      ActionController(name: '_ConfirmationStoreBase', context: context);

  @override
  dynamic showNewPassword() {
    final _$actionInfo = _$_ConfirmationStoreBaseActionController.startAction(
        name: '_ConfirmationStoreBase.showNewPassword');
    try {
      return super.showNewPassword();
    } finally {
      _$_ConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showConfirmationPassword() {
    final _$actionInfo = _$_ConfirmationStoreBaseActionController.startAction(
        name: '_ConfirmationStoreBase.showConfirmationPassword');
    try {
      return super.showConfirmationPassword();
    } finally {
      _$_ConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newPassIsObscured: ${newPassIsObscured},
confirmationPassIsObscured: ${confirmationPassIsObscured},
newPasswordIcon: ${newPasswordIcon},
confirmationPasswordIcon: ${confirmationPasswordIcon}
    ''';
  }
}
