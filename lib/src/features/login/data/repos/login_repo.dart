import 'package:comicsawy/src/core/helpers/firebase_helpers.dart';
import 'package:comicsawy/src/features/login/data/models/login_error_model.dart';
import 'package:comicsawy/src/features/login/data/models/login_request_model.dart';
import 'package:comicsawy/src/features/login/networking/login_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  Future<LoginApiResult> login(LoginRequestModel loginModel) async {
    try {
      UserCredential userCredential = await FirebaseHelpers.firebaseAuth
          .signInWithEmailAndPassword(
              email: loginModel.email, password: loginModel.password);
      return LoginApiResult.success(userCredential);
    } on FirebaseAuthException catch (error) {
      return LoginApiResult.fail(LoginErrorModel(
          code: int.tryParse(error.code) ?? 400, message: error.message));
    } catch (error) {
      return LoginApiResult.fail(LoginErrorModel(
        code: 408,
        message: 'unknown error while login Please try again later',
      ));
    }
  }
}
