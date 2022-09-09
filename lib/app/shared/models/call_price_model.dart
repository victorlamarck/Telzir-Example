// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CallPriceModel {
  int? id;
  int? sourceCod;
  int? destinationCod;
  double? price;

  CallPriceModel({
    this.id,
    this.sourceCod,
    this.destinationCod,
    this.price,
  });

  CallPriceModel copyWith({
    int? id,
    int? sourceCod,
    int? destinationCod,
    double? price,
  }) {
    return CallPriceModel(
      id: id ?? this.id,
      sourceCod: sourceCod ?? this.sourceCod,
      destinationCod: destinationCod ?? this.destinationCod,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'source_cod': sourceCod,
      'destination_cod': destinationCod,
      'price': price,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory CallPriceModel.fromMap(Map<String, dynamic> map) {
    return CallPriceModel(
      id: map['id'] != null ? map['id'] as int : null,
      sourceCod: map['source_cod'] != null ? map['source_cod'] as int : null,
      destinationCod:
          map['destination_cod'] != null ? map['destination_cod'] as int : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallPriceModel.fromJson(String source) =>
      CallPriceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallPriceModel(id: $id, sourceCod: $sourceCod, destinationCod: $destinationCod, price: $price)';
  }

  @override
  bool operator ==(covariant CallPriceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sourceCod == sourceCod &&
        other.destinationCod == destinationCod &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sourceCod.hashCode ^
        destinationCod.hashCode ^
        price.hashCode;
  }
}
