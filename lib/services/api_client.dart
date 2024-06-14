import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiClient {
  static const ip = 'http://192.168.31.93:8001/api';
  static const fileIp = 'http://192.168.31.93:8002/api';
  static final client = http.Client();
  const ApiClient();

  Future<http.Response> getRequest(
      {required String path, bool addIp = true, bool file = false}) async {
    try {
      final url =
          Uri.parse(file ? (fileIp + path) : ((addIp ? ip : '') + path));
      final response = await client.get(url);
      log((addIp ? ip : '') + path);
      if (response.body.length < 10000) {
        log(response.body);
      } else {
        //log(response.body.substring(0, 2000));
      }
      log(response.request.toString());

      switch (response.statusCode) {
        case 200:
          return response;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> request({
    required String path,
    required String reqType,
    Object? body,
    bool addIp = true,
  }) async {
    final url = Uri.parse((addIp ? ip : '') + path);
    http.Response response;
    switch (reqType) {
      case 'post':
        {
          response = await client.post(
            url,
            body: body,
          );
        }
      case 'patch':
        {
          response = await client.patch(
            url,
            body: body,
          );
        }
      default:
        {
          response = await client.delete(
            url,
            body: body,
          );
        }
    }
    log(ip + path);
    log(response.body);
    log(response.request.toString());
    switch (response.statusCode) {
      case 200:
        return response;
      default:
        throw Exception(response.reasonPhrase);
    }
  }

  // Future<http.Response> postRequest(
  //     {required String path, Object? body, bool addIp = true}) async {
  //   final url = Uri.parse((addIp ? ip : '') + path);
  //   // try {
  //   var response = await client.post(
  //     url,
  //     body: body,
  //   );
  //   log(ip + path);
  //   log(response.body);
  //   log(response.request.toString());
  //   switch (response.statusCode) {
  //     case 200:
  //       return response;
  //     default:
  //       throw Exception(response.reasonPhrase);
  //   }
  //   // } catch (e) {
  //   //   throw Exception(e);
  //   // }
  // }

  // Future<http.Response> patchRequest(
  //     {required String path, Object? body, bool addIp = true}) async {
  //   final url = Uri.parse((addIp ? ip : '') + path);
  //   // try {
  //   var response = await client.patch(
  //     url,
  //     body: body,
  //   );
  //   log(ip + path);
  //   log(response.body);
  //   log(response.request.toString());
  //   switch (response.statusCode) {
  //     case 200:
  //       return response;
  //     default:
  //       throw Exception(response.reasonPhrase);
  //   }
  //   // } catch (e) {
  //   //   throw Exception(e);
  //   // }
  // }

  // Future<http.Response> deleteRequest(
  //     {required String path, Object? body, bool addIp = true}) async {
  //   final url = Uri.parse((addIp ? ip : '') + path);
  //   // try {
  //   var response = await client.delete(
  //     url,
  //     body: body,
  //   );
  //   log(ip + path);
  //   log(response.body);
  //   log(response.request.toString());
  //   switch (response.statusCode) {
  //     case 200:
  //       return response;
  //     default:
  //       throw Exception(response.reasonPhrase);
  //   }
  //   // } catch (e) {
  //   //   throw Exception(e);
  //   // }
  // }
}
