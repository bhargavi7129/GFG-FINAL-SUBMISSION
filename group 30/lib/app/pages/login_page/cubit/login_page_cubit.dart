import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  bool isLogin = true;
  LoginPageCubit() : super(LoginPageState.initial());

  void setPassword(String password) {
    emit(
      state.copyWith(
        password: password,
        status: LoginStatus.initial,
      ),
    );
  }

  void setEmail(String email) {
    emit(
      state.copyWith(
        email: email,
        status: LoginStatus.initial,
      ),
    );
  }

  void setName(String name) {
    emit(
      state.copyWith(
        name: name,
        status: LoginStatus.initial,
      ),
    );
  }

  void toggleLogin() {
    isLogin = !isLogin;
    emit(state.copyWith(status: LoginStatus.initial));
  }

  void switchUserType() {
    emit(state.copyWith(
        userType: state.userType == UserType.doctor
            ? UserType.patient
            : UserType.doctor));
  }

  String get userTypeString {
    return state.userType == UserType.doctor ? 'Doctor' : 'Patient';
  }

  void signUp() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.email.trim(),
        password: state.password.trim(),
      );
      emit(state.copyWith(status: LoginStatus.success));
    } on Exception {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  void login() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email.trim(),
        password: state.password.trim(),
      );
      emit(state.copyWith(status: LoginStatus.success));
    } on Exception {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}
