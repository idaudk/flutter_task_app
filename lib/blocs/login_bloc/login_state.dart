part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
 final String error;

 const LoginFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class LoginPasswordVisibilityChanged extends LoginState {
  final bool isPasswordVisible;
  LoginPasswordVisibilityChanged({required this.isPasswordVisible});

  @override
  List<Object> get props => [isPasswordVisible];
}