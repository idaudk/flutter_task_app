import 'package:task_app/data/model/login/login_model.dart';

abstract class BaseApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<LoginModel>> loginResponse(
      String url, String email, String password);
}
