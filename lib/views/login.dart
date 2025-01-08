import 'package:comicsawy/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var formKey = ref.watch(loginProvider);
    var formKeyController = ref.watch(loginProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('manager Login'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) {
                  formKeyController.setEmail(email);
                },
                validator: (email) {
                  return formKeyController.emailValidatorMessage;
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
                  formKeyController.setPassword(password);
                },
                decoration: const InputDecoration(label: Text('Password')),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => formKeyController.submitForm(context),
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
