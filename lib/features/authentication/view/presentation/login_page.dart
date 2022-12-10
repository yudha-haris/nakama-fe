import 'package:flutter/material.dart';
import 'package:ingatkan/core/widgets/ingatkan_button.dart';
import 'package:ingatkan/core/widgets/ingatkan_textfield.dart';
import 'package:ingatkan/features/authentication/view/presentation/register_page.dart';
import 'package:ingatkan/features/authentication/view/view_model/view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/services/navigator_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username =
      TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthenticationViewModel _viewModel = AuthenticationViewModel();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Username: '),
                  const SizedBox(
                    height: 16,
                  ),
                  IngatkanTextField(
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                      controller: _username,
                      hint: 'Masukkan Username'),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Password: '),
                  const SizedBox(
                    height: 16,
                  ),
                  IngatkanTextField(
                    prefixIcon: const Icon(Icons.lock_rounded),
                    controller: _password,
                    hint: 'Masukkan Password',
                    obscuredText: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              Center(
                child: Column(
                  children: [
                    Observer(builder: (context) {
                      return IngatkanButton(
                          isLoading: _viewModel.isLoading,
                          label: 'Login',
                          onPressed: () {
                            _viewModel.login(context,
                                username: _username.text,
                                password: _password.text);
                          });
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    IngatkanButton(
                        label: 'Register',
                        onPressed: () {
                          NavigatorService.push(context,
                              route: const RegisterPage());
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
