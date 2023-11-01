import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task_app/data/remote/api_exception.dart';

import '../../data/remote/base_api_service.dart';
import '../model/login/login_model.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<List<LoginModel>> loginResponse(
      String url, String email, String password) async {
    try {
      // var testUrl = Uri.http(baseUrl, url);
      var uri = Uri.parse(
          'https://jsonplaceholder.typicode.com/users'); //TODO will add base URL here
      final response = await http.get(uri);
      return responseJson(response);
    } catch (e) {
      if (e is AppException) {
        throw FetchDataException(e.toString());
      } else if (e is SocketException) {
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
  }

  dynamic responseJson(http.Response response) {
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final List<LoginModel> users =
          jsonResponse.map((json) => LoginModel.fromJson(json)).toList();
      return users;
    } else {
      throw FetchDataException(
          'Failed with status code: ${response.statusCode}');
    }
  }
}
