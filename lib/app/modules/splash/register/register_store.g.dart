// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$isObscuredNewAtom =
      Atom(name: '_RegisterStoreBase.isObscuredNew', context: context);

  @override
  bool get isObscuredNew {
    _$isObscuredNewAtom.reportRead();
    return super.isObscuredNew;
  }

  @override
  set isObscuredNew(bool value) {
    _$isObscuredNewAtom.reportWrite(value, super.isObscuredNew, () {
      super.isObscuredNew = value;
    });
  }

  late final _$isObscuredConfirmationAtom =
      Atom(name: '_RegisterStoreBase.isObscuredConfirmation', context: context);

  @override
  bool get isObscuredConfirmation {
    _$isObscuredConfirmationAtom.reportRead();
    return super.isObscuredConfirmation;
  }

  @override
  set isObscuredConfirmation(bool value) {
    _$isObscuredConfirmationAtom
        .reportWrite(value, super.isObscuredConfirmation, () {
      super.isObscuredConfirmation = value;
    });
  }

  late final _$newPasswordIconAtom =
      Atom(name: '_RegisterStoreBase.newPasswordIcon', context: context);

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
      name: '_RegisterStoreBase.confirmationPasswordIcon', context: context);

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

  late final _$indexPageAtom =
      Atom(name: '_RegisterStoreBase.indexPage', context: context);

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  late final _$checkBoxAtom =
      Atom(name: '_RegisterStoreBase.checkBox', context: context);

  @override
  bool? get checkBox {
    _$checkBoxAtom.reportRead();
    return super.checkBox;
  }

  @override
  set checkBox(bool? value) {
    _$checkBoxAtom.reportWrite(value, super.checkBox, () {
      super.checkBox = value;
    });
  }

  late final _$firstStepRegisterAsyncAction =
      AsyncAction('_RegisterStoreBase.firstStepRegister', context: context);

  @override
  Future firstStepRegister() {
    return _$firstStepRegisterAsyncAction.run(() => super.firstStepRegister());
  }

  late final _$registerAccAsyncAction =
      AsyncAction('_RegisterStoreBase.registerAcc', context: context);

  @override
  Future registerAcc() {
    return _$registerAccAsyncAction.run(() => super.registerAcc());
  }

  late final _$registerAccountAsyncAction =
      AsyncAction('_RegisterStoreBase.registerAccount', context: context);

  @override
  Future registerAccount() {
    return _$registerAccountAsyncAction.run(() => super.registerAccount());
  }

  late final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase', context: context);

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousPage() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showNewPassword() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.showNewPassword');
    try {
      return super.showNewPassword();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showConfirmationPassword() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.showConfirmationPassword');
    try {
      return super.showConfirmationPassword();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscuredNew: ${isObscuredNew},
isObscuredConfirmation: ${isObscuredConfirmation},
newPasswordIcon: ${newPasswordIcon},
confirmationPasswordIcon: ${confirmationPasswordIcon},
indexPage: ${indexPage},
checkBox: ${checkBox}
    ''';
  }
}
