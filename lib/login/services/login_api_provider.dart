import 'package:dio/dio.dart';

import 'package:ma_voix_app/config.dart';

class LoginApiProvider {
  final String _tokenEndpoint = "$endpoint/token";
  final Dio _dio = Dio();

  Future token(email, password) async {
    try {
      Response response = await _dio
          .post(_tokenEndpoint, data: {"email": email, "password": password});
      return response.data;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
