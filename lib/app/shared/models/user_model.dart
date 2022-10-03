// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:disconts/app/shared/models/category_model.dart';

class UserModel {
  int? id;
  String? name;
  String? token;
  String? email;
  String? password;
  String? username;
  String? cpfCnpj;
  List<CategoryModel>? categories;

  UserModel({
    this.id,
    this.name,
    this.token,
    this.email,
    this.password,
    this.username,
    this.cpfCnpj,
    this.categories,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'token': token,
      'email': email,
      'password': password,
      'username': username,
      'cpf_cnpj': cpfCnpj,
      'categories': categories?.map((x) => x.toMap()).toList(),
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      cpfCnpj: map['cpf_cnpj'] != null ? map['cpf_cnpj'] as String : null,
      categories: map['categories'] != null
          ? List<CategoryModel>.from(
              (map['categories'] as List<int>).map<CategoryModel?>(
                (x) => CategoryModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
