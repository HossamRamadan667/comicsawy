import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/login/ui/widgets/login_button.dart';
import 'package:comicsawy/src/features/login/ui/widgets/login_input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordSecured = true;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          LoginInputField(
            controller: TextEditingController(),
            prefixIcon: const Icon(Icons.email_rounded),
            labelText: 'Email',
          ),
          Spacing.verticalSpace(15),
          LoginInputField(
            controller: passwordController,
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Password',
            isObscure: isPasswordSecured,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordSecured = !isPasswordSecured;
                  });
                },
                child: Icon(isPasswordSecured
                    ? Icons.visibility_rounded
                    : Icons.visibility_off)),
          ),
          Spacing.verticalSpace(15),
          const LoginButton(),
        ],
      ),
    );
  }
}
