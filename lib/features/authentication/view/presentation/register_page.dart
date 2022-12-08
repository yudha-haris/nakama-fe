import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';

import '../../../../services/navigator_service.dart';
import '../view_model/view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final AuthenticationViewModel _viewModel = AuthenticationViewModel();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _name.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Username: '),
            const SizedBox(
              height: 16,
            ),
            RegisterTextField(controller: _username, hint: 'Masukkan username'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan nama: '),
            RegisterTextField(controller: _name, hint: 'Masukkan nama'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan email: '),
            RegisterTextField(controller: _email, hint: 'Masukkan email'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan nomor telepon: '),
            RegisterTextField(
                controller: _phoneNumber, hint: 'Masukkan nomor telepon'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan password: '),
            RegisterTextField(
                controller: _password,
                obscuredText: true,
                hint: 'Masukkan password'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan ulang password: '),
            RegisterTextField(
                controller: _confirmPassword,
                obscuredText: true,
                hint: 'Masukkan ulang password'),
            ElevatedButton(onPressed: () {
              if (!_viewModel.isLoading) {
                _viewModel.register(
                  context,
                  username: _username.text,
                  name: _name.text,
                  phone: _phoneNumber.text,
                  password: _password.text,
                  confirmPassword: _confirmPassword.text,
                  email: _email.text,
                );
              }
            }, child: Observer(builder: (_) {
              return Center(
                  child: _viewModel.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 4.0,
                          ))
                      : const Text('Register'));
            })),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(child: Text('Login')))
          ],
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscuredText;

  const RegisterTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.obscuredText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscuredText,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
