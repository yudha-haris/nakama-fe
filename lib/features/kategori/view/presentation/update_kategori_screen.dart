import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ingatkan/features/kategori/model/kategori.dart';
import 'package:ingatkan/core/global/profile_data.dart';

import '../../../../core/widgets/ingatkan_textfield.dart';
import '../view_model/view_model.dart';

class UpdateKategoriScreen extends StatefulWidget {
  final Kategori kategori;
  const UpdateKategoriScreen({Key? key, required this.kategori})
      : super(key: key);

  @override
  State<UpdateKategoriScreen> createState() => _UpdateActivityPageState();
}

class _UpdateActivityPageState extends State<UpdateKategoriScreen> {
  late TextEditingController judul;
  final KategoriViewModel _viewModel = KategoriViewModel();

  @override
  void initState() {
    judul = TextEditingController(text: widget.kategori.judul);
    super.initState();
  }

  @override
  void dispose() {
    judul.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
        actions: [
          IconButton(
              onPressed: () async {
                await _viewModel.updateKategori(
                  context,
                  judul: judul.text,
                  idKategori: widget.kategori.id,
                  username: ProfileData.data.username,
                );
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            IngatkanTextField(
              hint: 'Masukkan nama kategori',
              controller: judul,
            ),
          ],
        ),
      ),
    );
  }
}
