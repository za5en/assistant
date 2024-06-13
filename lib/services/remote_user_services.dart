import 'dart:developer';

import 'package:http/http.dart' as http;

import 'api_client.dart';

class RemoteUserServices {
  const RemoteUserServices();
  final _apiClient = const ApiClient();

  Future<http.Response> createUser(
    String name,
    String surname,
    String patronymic,
    String email,
  ) async {
    var response = await _apiClient.postRequest(
      path: '/users',
      body: {
        "name": name,
        "surname": surname,
        "patronymic": patronymic,
        "email": email,
      },
    );
    log(response.body);
    return response;
  }

  Future<http.Response> getInfo(String email) async {
    var response = await _apiClient.getRequest(
      path: '/users/$email',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> editInfo(
    int userId,
    String name,
    String surname,
    String patronymic,
    String email,
  ) async {
    var response = await _apiClient.patchRequest(
      path: '/users/$userId',
      body: {
        "name": name,
        "surname": surname,
        "patronymic": patronymic,
        "email": email
      },
    );
    log(response.body);
    return response;
  }

  Future<http.Response> deleteUser(int userId) async {
    var response = await _apiClient.deleteRequest(
      path: '/users/$userId',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> addCompetency(
    int userId,
    int compId,
  ) async {
    var response = await _apiClient.postRequest(
      path: '/users/$userId/competencies?competencyId=$compId',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> getCompetencies() async {
    var response = await _apiClient.getRequest(
      path: '/users/competencies/unique-names',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> nextLevel(
    int userId,
    int compId,
  ) async {
    var response = await _apiClient.getRequest(
      path: '/users/$userId/competencies/$compId/next-level',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> sendTest(
    int userId,
    int compId,
    int solutionDuration,
    List<Map<String, int>> answers,
  ) async {
    var response = await _apiClient.postRequest(
      path: '/users/$userId/competencies/$compId/test',
      body: {
        "solutionDuration": solutionDuration,
        "answers": answers,
      },
    );
    log(response.body);
    return response;
  }
}
