import 'package:comicsawy/src/core/helpers/app_regex.dart';
import 'package:comicsawy/src/features/login/data/models/login_request_model.dart';
import 'package:comicsawy/src/features/login/data/repos/login_repo.dart';
import 'package:comicsawy/src/features/login/logic/cubit/login_state.dart';
import 'package:comicsawy/src/features/login/networking/login_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.idle());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? errorMessage;

  validateAndLogin(BuildContext context) {
    errorMessage = null;
    if (formKey.currentState!.validate()) {
      return login();
    }
    emit(LoginState.idle());
  }

  emailValidator(email) {
    if (email == null || email.trim().isEmpty) {
      return 'this field can\'t be empty';
    }
    if (!AppRegex.isEmailValid(email)) {
      return "email is not valid";
    }
    return errorMessage;
  }

  Future login() async {
    LoginApiResult response = await loginRepo.login(LoginRequestModel(
        email: emailController.value.text.trim(),
        password: passwordController.value.text.trim()));

    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      fail: (loginErrorModel) {
        errorMessage = loginErrorModel.message;
        formKey.currentState!.validate();
        emit(LoginState.fail(loginErrorModel));
      },
    );
  }
}
