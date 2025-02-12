import 'package:comicsawy/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('manager Login'),
      ),
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) {
                        controller.setEmail(email);
                      },
                      validator: (email) {
                        return controller.emailValidatorMessage;
                      },
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onSaved: (password) {
                        controller.setPassword(password);
                      },
                      decoration:
                          const InputDecoration(label: Text('Password')),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => controller.submitForm(context),
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
