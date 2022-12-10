import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/widgets/ingatkan_button.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';

import '../../../../core/widgets/ingatkan_textfield.dart';
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
            IngatkanTextField(controller: _username, hint: 'Masukkan username'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan nama: '),
            IngatkanTextField(controller: _name, hint: 'Masukkan nama'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan email: '),
            IngatkanTextField(controller: _email, hint: 'Masukkan email'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan nomor telepon: '),
            IngatkanTextField(
                controller: _phoneNumber, hint: 'Masukkan nomor telepon'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan password: '),
            IngatkanTextField(
                controller: _password,
                obscuredText: true,
                hint: 'Masukkan password'),
            const SizedBox(
              height: 16,
            ),
            const Text('Masukkan ulang password: '),
            IngatkanTextField(
                controller: _confirmPassword,
                obscuredText: true,
                hint: 'Masukkan ulang password'),
            IngatkanButton(isLoading: _viewModel.isLoading, label: 'Register', onPressed: (){
              _viewModel.register(
                context,
                username: _username.text,
                name: _name.text,
                phone: _phoneNumber.text,
                password: _password.text,
                confirmPassword: _confirmPassword.text,
                email: _email.text,
              );
            }),
            const SizedBox(
              height: 16,
            ),
            IngatkanButton(label: 'Login', onPressed: (){Navigator.pop(context);}),
          ],
        ),
      ),
    );
  }
}
