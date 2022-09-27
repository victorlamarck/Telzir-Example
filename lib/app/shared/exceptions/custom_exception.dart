class CustomException implements Exception {
  final dynamic _data;

  CustomException(this._data);

  String get message {
    if (_data == null) {
      return 'Houve um erro desconhecido';
    }

    try {
      if (_data['errors'] is List) {
        return _data['errors'][0];
      }
    } catch (e) {}

    try {
      if (_data['message'] != null) {
        return _data['message'];
      }
    } catch (e) {}

    if (_data is String) {
      return _data;
    }

    return 'Houve um erro desconhecido';
  }
}
