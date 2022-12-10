import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/core/widgets/ingatkan_button.dart';

import '../../../../core/widgets/ingatkan_textfield.dart';
import '../view_model/view_model.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _username =
      TextEditingController(text: ProfileData.data.username);
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name =
      TextEditingController(text: ProfileData.data.name);
  final TextEditingController _email =
      TextEditingController(text: ProfileData.data.email);
  final TextEditingController _phoneNumber =
      TextEditingController(text: ProfileData.data.phoneNumber);
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
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditProfileLabelWidget(label: 'Username'),
                  IngatkanTextField(
                    controller: _username,
                    hint: 'Masukkan username',
                    prefixIcon: const Icon(Icons.alternate_email_rounded),
                  ),
                  const EditProfileLabelWidget(label: 'Nama'),
                  IngatkanTextField(
                      controller: _name,
                      hint: 'Masukkan nama',
                      prefixIcon: const Icon(Icons.person_rounded)),
                  const EditProfileLabelWidget(label: 'Email'),
                  IngatkanTextField(
                    controller: _email,
                    hint: 'Masukkan email',
                    prefixIcon: const Icon(Icons.email_rounded),
                  ),
                  const EditProfileLabelWidget(label: 'Nomor Telepon'),
                  IngatkanTextField(
                    controller: _phoneNumber,
                    hint: 'Masukkan nomor telepon',
                    prefixIcon: const Icon(Icons.phone_iphone_rounded),
                  ),
                  const EditProfileLabelWidget(
                    label: 'Password',
                  ),
                  IngatkanTextField(
                    controller: _password,
                    obscuredText: true,
                    hint: 'Masukkan password',
                    prefixIcon: const Icon(Icons.lock_rounded),
                  ),
                  const EditProfileLabelWidget(label: 'Konfirmasi Password'),
                  IngatkanTextField(
                    controller: _confirmPassword,
                    obscuredText: true,
                    hint: 'Masukkan ulang password',
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
                        label: 'Simpan',
                        onPressed: () {
                          _viewModel.editProfile(
                            context,
                            username: _username.text,
                            name: _name.text,
                            phone: _phoneNumber.text,
                            password: _password.text,
                            email: _email.text,
                            confirmPassword: _confirmPassword.text,
                          );
                        }),
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

class EditProfileLabelWidget extends StatelessWidget {
  final String label;
  const EditProfileLabelWidget({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
