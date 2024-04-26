import 'dart:developer';

import 'package:http/http.dart' as http;

import 'api_client.dart';

class RemoteUserServices {
  const RemoteUserServices();
  final _apiClient = const ApiClient();

  Future<http.Response> createUser(
    String name,
    String email,
    String password,
  ) async {
    var response = await _apiClient.postRequest(
      path: '/user/create/',
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    log(response.body);
    return response;
  }
}
