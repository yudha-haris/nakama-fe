import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/widgets/ingatkan_textfield.dart';
import '../view_model/view_model.dart';

class AddKategoriScreen extends StatefulWidget {
  const AddKategoriScreen({Key? key}) : super(key: key);

  @override
  State<AddKategoriScreen> createState() => _AddKategoriScreenState();
}

class _AddKategoriScreenState extends State<AddKategoriScreen> {
  late TextEditingController judul;
  final KategoriViewModel _viewModel = KategoriViewModel();

  @override
  void initState() {
    judul = TextEditingController();
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
        title: Text('Create Category'),
        actions: [
          IconButton(
              onPressed: () async {
                await _viewModel.addKategori(
                  context,
                    judul: judul.text,
                );
              },
              icon: Icon(Icons.save))
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
