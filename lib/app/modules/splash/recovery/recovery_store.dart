import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'recovery_store.g.dart';

class RecoveryStore = _RecoveryStoreBase with _$RecoveryStore;

abstract class _RecoveryStoreBase with Store {
  final emailController = TextEditingController();
}
