// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlanModel {
  int? id;
  String? name;
  int? minutes;
  double? price;

  PlanModel({
    this.id,
    this.name,
    this.minutes,
    this.price,
  });

  PlanModel copyWith({
    int? id,
    String? name,
    int? minutes,
    double? price,
  }) {
    return PlanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      minutes: minutes ?? this.minutes,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'minutes': minutes,
      'price': price,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      minutes: map['minutes'] != null ? map['minutes'] as int : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) =>
      PlanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PlanModel(id: $id, name: $name, minutes: $minutes)';

  @override
  bool operator ==(covariant PlanModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.minutes == minutes;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ minutes.hashCode;
}
