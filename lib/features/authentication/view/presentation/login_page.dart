import 'package:flutter/material.dart';
import 'package:ingatkan/features/authentication/view/view_model/view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)
              ),
              height: 50,
              width: double.infinity,
              child: TextField(
                controller: _username,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Username'
                ),
              ),
            ),
            const SizedBox(height: 16,),
            const Text('Password: '),
            const SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)
              ),
              height: 50,
              width: double.infinity,
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Masukkan Password'
                ),
              ),
            ),
            const SizedBox(height: 48,),
            ElevatedButton(
                onPressed: (){
                  if(!_viewModel.isLoading){
                    _viewModel.login(context, username: _username.text, password: _password.text);
                  }
            }, child: Observer(
              builder: (_) {
                return Center(child: _viewModel.isLoading
                    ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4.0,))
                    : const Text('Login'));
              }
            ))
          ],
        ),
      ),
    );
  }
}
