import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';

import '../view_model/view_model.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _username = TextEditingController(text: ProfileData.data.username);
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController(text: ProfileData.data.name);
  final TextEditingController _email = TextEditingController(text: ProfileData.data.email);
  final TextEditingController _phoneNumber = TextEditingController(text: ProfileData.data.phoneNumber);
  final TextEditingController _confirmPassword = TextEditingController();
  final ProfileViewModel _viewModel = ProfileViewModel();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
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
            const SizedBox(height: 16,),
            RegisterTextField(
                controller: _username,
                hint: 'Masukkan username'),
            const SizedBox(height: 16,),
            const Text('Masukkan nama: '),
            RegisterTextField(
                controller: _name,
                hint: 'Masukkan nama'),
            const SizedBox(height: 16,),
            const Text('Masukkan email: '),
            RegisterTextField(
                controller: _email,
                hint: 'Masukkan email'),
            const SizedBox(height: 16,),
            const Text('Masukkan nomor telepon: '),
            RegisterTextField(
                controller: _phoneNumber,
                hint: 'Masukkan nomor telepon'),
            const SizedBox(height: 16,),
            const Text('Masukkan password: '),
            RegisterTextField(
                controller: _password,
                obscuredText: true,
                hint: 'Masukkan password'),
            const SizedBox(height: 16,),
            const Text('Masukkan ulang password: '),
            RegisterTextField(
                controller: _confirmPassword,
                obscuredText: true,
                hint: 'Masukkan ulang password'),
            ElevatedButton(
                onPressed: (){
                  if(!_viewModel.isLoading){
                    _viewModel.editProfile(context,
                      username: _username.text,
                      phone: _phoneNumber.text,
                      password: _password.text,
                      email: _email.text,
                      confirmPassword: _confirmPassword.text,
                    );
                  }
                }, child: Observer(
                builder: (_) {
                  return Center(child: _viewModel.isLoading
                      ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4.0,))
                      : const Text('Edit Profile'));
                }
            ))
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

  const RegisterTextField({Key? key, required this.controller, required this.hint, this.obscuredText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1)
      ),
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscuredText,
        decoration: InputDecoration(
            hintText: hint
        ),
      ),
    );
  }
}

