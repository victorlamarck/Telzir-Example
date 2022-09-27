import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? token;
  String? email;
  String? password;
  String? userName;

  UserModel({
    this.id,
    this.name,
    this.token,
    this.email,
    this.password,
    this.userName,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? token,
    String? email,
    String? password,
    String? userName,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'token': token,
      'email': email,
      'password': password,
      'userName': userName,
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
      userName: map['userName'] != null ? map['userName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, token: $token, email: $email, password: $password, userName: $userName)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.token == token &&
        other.email == email &&
        other.password == password &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        token.hashCode ^
        email.hashCode ^
        password.hashCode ^
        userName.hashCode;
  }
}
