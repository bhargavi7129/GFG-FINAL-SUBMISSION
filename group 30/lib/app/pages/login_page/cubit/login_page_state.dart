part of 'login_page_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

enum UserType {
  doctor,
  patient,
}

class LoginPageState {
  final String name;
  final String email;
  final String password;
  final LoginStatus status;
  final UserType userType;

  const LoginPageState({
    required this.name,
    required this.email,
    required this.password,
    required this.status,
    this.userType = UserType.patient,
  });

  factory LoginPageState.initial() => const LoginPageState(
        name: '',
        email: '',
        password: '',
        status: LoginStatus.initial,
      );

  LoginPageState copyWith({
    String? name,
    String? email,
    String? password,
    UserType? userType,
    LoginStatus? status,
  }) {
    return LoginPageState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
      status: status ?? this.status,
    );
  }
}
