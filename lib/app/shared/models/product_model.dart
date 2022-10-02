import 'dart:convert';

import 'package:disconts/app/shared/models/category_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? description;
  CategoryModel? category;
  num? olderPrice;
  num? actualPrice;
  DateTime? dueDate;
  String? imageUrl;

  ProductModel({
    this.id,
    this.name,
    this.category,
    this.olderPrice,
    this.actualPrice,
    this.dueDate,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category?.toMap(),
      'olderPrice': olderPrice,
      'actualPrice': actualPrice,
      'dueDate': dueDate?.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'] as Map<String, dynamic>)
          : null,
      olderPrice: map['olderPrice'] != null ? map['olderPrice'] as num : null,
      actualPrice:
          map['actualPrice'] != null ? map['actualPrice'] as num : null,
      dueDate: map['dueDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int)
          : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
