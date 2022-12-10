import 'package:flutter/material.dart';
import 'package:ingatkan/core/widgets/ingatkan_button.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            ProfileLabelWidget(
                label: 'Username', content: _viewModel.profile.username ?? ''),
            ProfileLabelWidget(
                label: 'Email', content: _viewModel.profile.email ?? ''),
            ProfileLabelWidget(
                label: 'Nama', content: _viewModel.profile.name ?? ''),
            ProfileLabelWidget(
                label: 'Nomor Telepon',
                content: _viewModel.profile.phoneNumber ?? ''),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  IngatkanButton(
                      label: 'Edit Profile',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfilePage()));
                      }),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class ProfileLabelWidget extends StatelessWidget {
  final String label;
  final String content;
  const ProfileLabelWidget(
      {Key? key, required this.label, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Divider(
            thickness: 1,
            height: 8,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            content,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
