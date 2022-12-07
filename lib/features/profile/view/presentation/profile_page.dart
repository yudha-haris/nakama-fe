import 'package:flutter/material.dart';
import 'package:ingatkan/features/profile/view/presentation/edit_profile.dart';

import '../view_model/view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileViewModel _viewModel = ProfileViewModel();

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        child: Column(
          children: [
            ProfileLabelWidget(label: 'Username', content: _viewModel.profile.username ?? ''),
            ProfileLabelWidget(label: 'Email', content: _viewModel.profile.email ?? ''),
            ProfileLabelWidget(label: 'Nama', content: _viewModel.profile.name ?? ''),
            ProfileLabelWidget(label: 'Nomor Telepon', content: _viewModel.profile.phoneNumber ?? ''),
            ProfileLabelWidget(label: 'Is Admin', content: _viewModel.profile.isAdmin.toString() ?? ''),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
            }, child: const Center(
              child: Text('Edit Profile'),
            ))
          ],
        ),
      ),
    );
  }
}

class ProfileLabelWidget extends StatelessWidget {
  final String label;
  final String content;
  const ProfileLabelWidget({Key? key, required this.label, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          Text(label),
          const SizedBox(width: 16),
          Text(content),
        ],
      ),
    );
  }
}
