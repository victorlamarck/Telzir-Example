import 'package:asuka/asuka.dart';
import 'package:example/app/shared/data/calls_price_data.dart';
import 'package:example/app/shared/data/plans_data.dart';
import 'package:example/app/shared/models/call_model.dart';
import 'package:example/app/shared/models/call_price_model.dart';
import 'package:example/app/shared/models/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  int _id = 1;

  final minutesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @observable
  List<PlanModel> plans = PLANSDATA;

  @observable
  List<CallPriceModel> callPrices = CALLPRICES;

  @observable
  ObservableList<CallModel> calls = <CallModel>[].asObservable();

  @observable
  CallPriceModel? chosenCall;

  @observable
  PlanModel? chosenPlan;

  @action
  getCallPrice(CallPriceModel callPrice, PlanModel plan, int minutes) {
    double _withFaleMais =
        ((minutes - (plan.minutes ?? 0)) * ((callPrice.price ?? 0) * 1.10));

    double _withoutFaleMais = (minutes * (callPrice.price ?? 0));

    calls.add(CallModel(
      id: _id,
      callPrice: callPrice,
      time: minutes,
      activePlan: plan,
      withFaleMais: _withFaleMais > 0 ? _withFaleMais : 0,
      withoutFaleMais: _withoutFaleMais > 0 ? _withoutFaleMais : 0,
    ));

    _id++;

    clearChosenCall();
    clearChosenPlan();
    minutesController.clear();
  }

  @action
  clearChosenCall() {
    chosenCall = null;
  }

  @action
  clearChosenPlan() {
    chosenPlan = null;
  }

  @action
  consult() async {
    if (chosenCall == null) {
      AsukaSnackbar.message(
              'É necessário selecionar um DDD de origem e um DDD de destino.')
          .show();
      return;
    }

    if (chosenPlan == null) {
      AsukaSnackbar.message('É necessário selecionar um plano FaleMais.')
          .show();
      return;
    }

    if (formKey.currentState!.validate() == false) {
      AsukaSnackbar.message(
              'Confira se informou corretamente um tempo estimado.')
          .show();
      return;
    }

    getCallPrice(chosenCall!, chosenPlan!, int.parse(minutesController.text));
  }
}
