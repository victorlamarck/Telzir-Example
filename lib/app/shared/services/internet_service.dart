import 'dart:io';

class InternetService {
  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('www.google.com.br');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
