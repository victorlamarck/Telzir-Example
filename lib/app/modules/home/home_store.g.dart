// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$plansAtom = Atom(name: 'HomeStoreBase.plans', context: context);

  @override
  List<PlanModel> get plans {
    _$plansAtom.reportRead();
    return super.plans;
  }

  @override
  set plans(List<PlanModel> value) {
    _$plansAtom.reportWrite(value, super.plans, () {
      super.plans = value;
    });
  }

  late final _$callPricesAtom =
      Atom(name: 'HomeStoreBase.callPrices', context: context);

  @override
  List<CallPriceModel> get callPrices {
    _$callPricesAtom.reportRead();
    return super.callPrices;
  }

  @override
  set callPrices(List<CallPriceModel> value) {
    _$callPricesAtom.reportWrite(value, super.callPrices, () {
      super.callPrices = value;
    });
  }

  late final _$callsAtom = Atom(name: 'HomeStoreBase.calls', context: context);

  @override
  ObservableList<CallModel> get calls {
    _$callsAtom.reportRead();
    return super.calls;
  }

  @override
  set calls(ObservableList<CallModel> value) {
    _$callsAtom.reportWrite(value, super.calls, () {
      super.calls = value;
    });
  }

  late final _$chosenCallAtom =
      Atom(name: 'HomeStoreBase.chosenCall', context: context);

  @override
  CallPriceModel? get chosenCall {
    _$chosenCallAtom.reportRead();
    return super.chosenCall;
  }

  @override
  set chosenCall(CallPriceModel? value) {
    _$chosenCallAtom.reportWrite(value, super.chosenCall, () {
      super.chosenCall = value;
    });
  }

  late final _$chosenPlanAtom =
      Atom(name: 'HomeStoreBase.chosenPlan', context: context);

  @override
  PlanModel? get chosenPlan {
    _$chosenPlanAtom.reportRead();
    return super.chosenPlan;
  }

  @override
  set chosenPlan(PlanModel? value) {
    _$chosenPlanAtom.reportWrite(value, super.chosenPlan, () {
      super.chosenPlan = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic getCallPrice(CallPriceModel callPrice, PlanModel plan, int minutes) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getCallPrice');
    try {
      return super.getCallPrice(callPrice, plan, minutes);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearChosenCall() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clearChosenCall');
    try {
      return super.clearChosenCall();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearChosenPlan() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clearChosenPlan');
    try {
      return super.clearChosenPlan();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic consult() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.consult');
    try {
      return super.consult();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
plans: ${plans},
callPrices: ${callPrices},
calls: ${calls},
chosenCall: ${chosenCall},
chosenPlan: ${chosenPlan}
    ''';
  }
}
