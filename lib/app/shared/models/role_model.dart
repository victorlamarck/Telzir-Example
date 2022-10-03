import 'dart:convert';

class RoleModel {
  int? id;
  String? name;

  RoleModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
