import 'dart:async';

import 'package:assistant/data/user_data.dart';
import 'package:assistant/services/remote_user_services.dart';
import 'package:get/get.dart';

import '../data/data.dart';

class UserController extends GetxController {
  final _remoteUserServices = const RemoteUserServices();

  var _userData = User(
    id: 1,
    name: 'Имя',
    surname: 'Фамилия',
    patronymic: 'Отчество',
    fullName: 'Фамилия Имя Отчество',
    email: 'mail@yandex.ru',
    userCompetencies: [
      UserCompetency(
        id: 1,
        name: 'C#',
        priority: 1,
        level: 'Уровень 0',
        testTimeMinutes: 15,
        passThreshold: 5,
        completed: false,
        testAttempts: [
          TestAttempt(
            solutionDuration: 10,
            uploadedAt: "2024-06-11T16:50:45.544Z",
            answers: [
              Answer(option: 'Ответ 1', isCorrect: false),
              Answer(option: 'Ответ 2', isCorrect: false),
              Answer(option: 'Ответ 3', isCorrect: false),
              Answer(option: 'Ответ 4', isCorrect: false),
            ],
          ),
        ],
      ),
    ],
  );

  User get user => _userData;
  // Competency get comp => _compData;

  UserController();

  Future<void> createUser(
      String name, String surname, String patronymic, String email) async {
    var response = await _remoteUserServices.createUser(
      name,
      surname,
      patronymic,
      email,
    );
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> getInfo(String email) async {
    var response = await _remoteUserServices.getInfo(email);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> editInfo(
      String name, String surname, String patronymic, String email) async {
    var response = await _remoteUserServices.editInfo(
        _userData.id, name, surname, patronymic, email);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> deleteUser() async {
    var response = await _remoteUserServices.deleteUser(_userData.id);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> getComps() async {
    var response = await _remoteUserServices.getCompetencies();
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> addComp(int compId) async {
    var response =
        await _remoteUserServices.addCompetency(_userData.id, compId);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> nextLevel(int compId) async {
    var response = await _remoteUserServices.nextLevel(_userData.id, compId);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> sendTest(
      int compId, int duration, List<Map<String, int>> answers) async {
    var response = await _remoteUserServices.sendTest(
        _userData.id, compId, duration, answers);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }

  Future<void> getFile(String dir, String fileName) async {
    var response = await _remoteUserServices.getFile(dir, fileName);
    var data = Data.fromJson(response.body);
    if (data.isSuccess) {
      _userData = User.fromJson(data.data);
    }
  }
}
