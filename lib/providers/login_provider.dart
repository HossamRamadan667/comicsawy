import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:comicsawy/views/add_sound.dart';
import 'package:comicsawy/firebase.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class LoginNotifier extends StateNotifier<GlobalKey<FormState>> {
  LoginNotifier() : super(GlobalKey<FormState>());
  String? emailValidatorMessage;
  String _email = '';
  String _password = '';

  setEmail(email) => _email = email;

  setPassword(password) => _password = password;

  _nextPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const AddSound(),
      ),
    );
  }

  _validateEmail() {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    emailValidatorMessage = _email.trim().isEmpty
        ? 'email field cant be empty'
        : !regExp.hasMatch(_email)
            ? 'email is not valid'
            : emailValidatorMessage;

    return state.currentState!.validate();
  }

  submitForm(BuildContext context) async {
    emailValidatorMessage = null;
    state.currentState!.save();

    if (_validateEmail()) {
      await login();
    }

    if (state.currentState!.validate()) {
      // ignore: use_build_context_synchronously
      _nextPage(context);
    }
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

StateNotifierProvider<LoginNotifier, GlobalKey<FormState>> loginProvider =
    StateNotifierProvider<LoginNotifier, GlobalKey<FormState>>(
  (ref) => LoginNotifier(),
);
