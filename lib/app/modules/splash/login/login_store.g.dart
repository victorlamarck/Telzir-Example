// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$isObscuredAtom =
      Atom(name: '_LoginStoreBase.isObscured', context: context);

  @override
  bool get isObscured {
    _$isObscuredAtom.reportRead();
    return super.isObscured;
  }

  @override
  set isObscured(bool value) {
    _$isObscuredAtom.reportWrite(value, super.isObscured, () {
      super.isObscured = value;
    });
  }

  late final _$passwordIconAtom =
      Atom(name: '_LoginStoreBase.passwordIcon', context: context);

  @override
  Icon get passwordIcon {
    _$passwordIconAtom.reportRead();
    return super.passwordIcon;
  }

  @override
  set passwordIcon(Icon value) {
    _$passwordIconAtom.reportWrite(value, super.passwordIcon, () {
      super.passwordIcon = value;
    });
  }

  late final _$validateAsyncAction =
      AsyncAction('_LoginStoreBase.validate', context: context);

  @override
  Future validate() {
    return _$validateAsyncAction.run(() => super.validate());
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStoreBase.login', context: context);

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic showPassword() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.showPassword');
    try {
      return super.showPassword();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscured: ${isObscured},
passwordIcon: ${passwordIcon}
    ''';
  }
}
