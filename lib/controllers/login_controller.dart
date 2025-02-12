import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../firebase.dart';
import 'dart:developer';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? emailValidatorMessage;
  String _email = '';
  String _password = '';

  setEmail(email) => _email = email;

  setPassword(password) => _password = password;

  _nextPage() => Get.toNamed('/addSound');

  _validateEmail() {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    emailValidatorMessage = _email.trim().isEmpty
        ? 'email field cant be empty'
        : !regExp.hasMatch(_email)
            ? 'email is not valid'
            : emailValidatorMessage;

    return formKey.currentState!.validate();
  }

  submitForm(BuildContext context) async {
    emailValidatorMessage = null;
    formKey.currentState!.save();
    if (_validateEmail()) {
      await login();
    }

    if (formKey.currentState!.validate()) {
      _nextPage();
    }
    update();
  }

  login() async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      emailValidatorMessage = e.message;
    } catch (e) {
      log(e.toString());
    }
  }
}
