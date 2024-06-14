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
    var response = await _apiClient.request(
      path: '/users',
      reqType: 'post',
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
    var response = await _apiClient.request(
      path: '/users/$userId',
      reqType: 'patch',
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
    var response = await _apiClient.request(
      path: '/users/$userId',
      reqType: 'delete',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> addCompetency(
    int userId,
    int compId,
  ) async {
    var response = await _apiClient.request(
      path: '/users/$userId/competencies?competencyId=$compId',
      reqType: 'post',
    );
    log(response.body);
    return response;
  }

  Future<http.Response> getCompetencies() async {
    var response = await _apiClient.getRequest(
      path: '/competencies/unique-names',
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
    var response = await _apiClient.request(
      path: '/users/$userId/competencies/$compId/test',
      reqType: 'post',
      body: {
        "solutionDuration": solutionDuration,
        "answers": answers,
      },
    );
    log(response.body);
    return response;
  }

  Future<http.Response> getFile(String directory, String name) async {
    var response = await _apiClient.getRequest(
      path: '/files/$directory/$name',
      file: true,
    );
    log(response.body);
    return response;
  }
}
