import 'package:task_app/data/remote/api_endPoints.dart';
import 'package:task_app/data/remote/network_api_service.dart';
import 'package:task_app/repo/login/login_repo.dart';

import '../../data/remote/base_api_service.dart';


class LoginRepoImp extends LoginRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future login(String email, String password) async {
    try {
      print("LoginRepoImp -->> login");
      dynamic response = await _apiService.loginResponse(ApiEndPoints().getUserList, email, password);
      return response;
    } catch(e) {
      rethrow;
    }
  }
}