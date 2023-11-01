import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/data/model/login/login_model.dart';
import 'package:task_app/repo/login/login_repo_imp.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _loginRepo = LoginRepoImp();
  bool isPasswordVisible = false;

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_login);
    on<TogglePasswordVisibility>(_passwordVisibilityHandler);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginButtonPressed) {
      emit(LoginLoading());
      await _loginRepo
          .login(event.email, event.password)
          .onError((error, stackTrace) =>
              emit(LoginFailure(error: error.toString())))
          .then((value) {
        if (isEmailMatch(value, event.email, event.password)) {
          print('login sucessful');
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: 'Login Failed!'));
        }
      });
    }
  }

  _passwordVisibilityHandler(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    isPasswordVisible = !isPasswordVisible;
    // Emit a new state to reflect the updated visibility state
    emit(LoginPasswordVisibilityChanged(isPasswordVisible: isPasswordVisible));
  }

  bool isEmailMatch(List<LoginModel> users, String email, String password) {
    var tEmail = email.toLowerCase().trim();
    var tPass = password.toLowerCase().trim();
    print(tEmail);
    print(tPass);
    // First, check if email and password are the same
    if (tEmail == tPass) {
      // Now, check if the entered email exists in the list of users
      return users.any((user) => user.email!.toLowerCase() == tEmail);
    }
    return false;
  }
}
