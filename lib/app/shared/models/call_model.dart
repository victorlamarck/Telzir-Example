// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:example/app/shared/models/call_price_model.dart';
import 'package:example/app/shared/models/plan_model.dart';

class CallModel {
  int? id;
  CallPriceModel? callPrice;
  int? time;
  PlanModel? activePlan;
  double? withFaleMais;
  double? withoutFaleMais;

  CallModel({
    this.id,
    this.callPrice,
    this.time,
    this.activePlan,
    this.withFaleMais,
    this.withoutFaleMais,
  });

  CallModel copyWith({
    int? id,
    CallPriceModel? callPrice,
    int? time,
    PlanModel? activePlan,
    double? withFaleMais,
    double? withoutFaleMais,
  }) {
    return CallModel(
      id: id ?? this.id,
      callPrice: callPrice ?? this.callPrice,
      time: time ?? this.time,
      activePlan: activePlan ?? this.activePlan,
      withFaleMais: withFaleMais ?? this.withFaleMais,
      withoutFaleMais: withoutFaleMais ?? this.withoutFaleMais,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'call_price': callPrice?.toMap(),
      'time': time,
      'active_plan': activePlan?.toMap(),
      'with_fale_mais': withFaleMais,
      'without_fale_mais': withoutFaleMais,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory CallModel.fromMap(Map<String, dynamic> map) {
    return CallModel(
      id: map['id'] != null ? map['id'] as int : null,
      callPrice: map['call_price'] != null
          ? CallPriceModel.fromMap(map['call_price'] as Map<String, dynamic>)
          : null,
      time: map['time'] != null ? map['time'] as int : null,
      activePlan: map['active_plan'] != null
          ? PlanModel.fromMap(map['active_plan'] as Map<String, dynamic>)
          : null,
      withFaleMais: map['with_fale_mais'] != null
          ? map['with_fale_mais'] as double
          : null,
      withoutFaleMais: map['without_fale_mais'] != null
          ? map['without_fale_mais'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallModel.fromJson(String source) =>
      CallModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallModel(id: $id, callPrice: $callPrice, time: $time, activePlan: $activePlan, withFaleMais: $withFaleMais, withoutFaleMais: $withoutFaleMais)';
  }

  @override
  bool operator ==(covariant CallModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.callPrice == callPrice &&
        other.time == time &&
        other.activePlan == activePlan &&
        other.withFaleMais == withFaleMais &&
        other.withoutFaleMais == withoutFaleMais;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        callPrice.hashCode ^
        time.hashCode ^
        activePlan.hashCode ^
        withFaleMais.hashCode ^
        withoutFaleMais.hashCode;
  }
}
