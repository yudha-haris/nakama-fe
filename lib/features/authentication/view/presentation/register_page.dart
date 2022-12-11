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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Username: '),
                ),
                IngatkanTextField(
                  controller: _username,
                  hint: 'Masukkan username',
                  prefixIcon: const Icon(Icons.alternate_email_rounded),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Nama: '),
                ),
                IngatkanTextField(
                  controller: _name,
                  hint: 'Masukkan nama',
                  prefixIcon: const Icon(Icons.person_rounded),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Email: '),
                ),
                IngatkanTextField(
                  controller: _email,
                  hint: 'Masukkan email',
                  prefixIcon: const Icon(Icons.email_rounded),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Nomor Telepon: '),
                ),
                IngatkanTextField(
                  controller: _phoneNumber,
                  hint: 'Masukkan nomor telepon',
                  prefixIcon: const Icon(Icons.phone_iphone_rounded),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Password: '),
                ),
                IngatkanTextField(
                  controller: _password,
                  obscuredText: true,
                  hint: 'Password',
                  prefixIcon: const Icon(Icons.lock_rounded),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Masukkan ulang password: '),
                ),
                IngatkanTextField(
                  controller: _confirmPassword,
                  obscuredText: true,
                  hint: 'Konfirmasi password',
                  prefixIcon: const Icon(Icons.lock_rounded),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Center(
              child: Column(
                children: [
                  IngatkanButton(
                      isLoading: _viewModel.isLoading,
                      label: 'Register',
                      onPressed: () {
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
                  IngatkanButton(
                      label: 'Login',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
