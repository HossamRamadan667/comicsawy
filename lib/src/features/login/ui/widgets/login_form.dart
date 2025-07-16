import 'package:comicsawy/src/core/routing/routes.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/login/logic/cubit/login_cubit.dart';
import 'package:comicsawy/src/features/login/logic/cubit/login_state.dart';
import 'package:comicsawy/src/features/login/ui/widgets/login_button.dart';
import 'package:comicsawy/src/features/login/ui/widgets/login_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordSecured = true;
  var getCubit = (context) => BlocProvider.of<LoginCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Success) {
          Navigator.pushReplacementNamed(context, AppRoutes.uploadSound);
        } else {
          setState(() {});
        }
      },
      child: Form(
        key: getCubit(context).formKey,
        child: Column(
          children: [
            // email field
            LoginInputField(
              labelText: 'Email',
              controller: getCubit(context).emailController,
              prefixIcon: const Icon(Icons.email_rounded),
              validator: (value) => getCubit(context).emailValidator(value),
            ),

            Spacing.verticalSpace(15),

            // password field
            LoginInputField(
              labelText: 'Password',
              controller: getCubit(context).passwordController,
              prefixIcon: const Icon(Icons.lock),
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
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'this field can\'t be empty'
                  : null,
            ),

            Spacing.verticalSpace(15),
            LoginButton(
              onPressed: () => getCubit(context).validateAndLogin(context),
            ),
          ],
        ),
      ),
    );
  }
}
