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
  final TextEditingController _username = TextEditingController(text: 'nakama_user');
  final TextEditingController _password = TextEditingController(text: 'nakama');
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        child: Column(
          children: [
            const Text('Username: '),
            const SizedBox(height: 16,),
            IngatkanTextField(controller: _username, hint: 'Masukkan Username'),
            const SizedBox(height: 16,),
            const Text('Password: '),
            const SizedBox(height: 16,),
            IngatkanTextField(controller: _password, hint: 'Masukkan Password', obscuredText: true,),
            const SizedBox(height: 48,),
            Observer(
              builder: (context) {
                return IngatkanButton(
                    isLoading: _viewModel.isLoading,
                    label: 'Login',
                    onPressed: (){
                      _viewModel.login(context, username: _username.text, password: _password.text);});
              }
            ),
            const SizedBox(height: 16,),
            IngatkanButton(label: 'Register', onPressed: (){NavigatorService.push(context, route: const RegisterPage()); })
          ],
        ),
      ),
    );
  }
}
