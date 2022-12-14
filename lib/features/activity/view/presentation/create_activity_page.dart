import 'package:flutter/material.dart';
import '../../../../core/widgets/ingatkan_textfield.dart';
import '../../../../services/dialog_service.dart';
import '../view_model/view_model.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  late TextEditingController judul;
  late TextEditingController isi;
  late TextEditingController kategori;
  final ActivityViewModel _viewModel = ActivityViewModel();

  @override
  void initState() {
    judul = TextEditingController();
    isi = TextEditingController();
    kategori = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    judul.dispose();
    isi.dispose();
    kategori.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Activity'),
        actions: [
          IconButton(
              onPressed: () async {
                if (judul.text.isEmpty) {
                  DialogService().showMessageDialog(context,
                      message: 'Harap masukkan nama activity!');
                } else {
                  await _viewModel.postActivity(context,
                      judul: judul.text, isi: isi.text, kategori: kategori.text);
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            IngatkanTextField(
              hint: 'Masukkan judul',
              controller: judul,
            ),
            const SizedBox(
              height: 16,
            ),
            IngatkanTextField(
              hint: 'Masukkan isi',
              controller: isi,
            ),
            const SizedBox(
              height: 16,
            ),
            IngatkanTextField(
              hint: 'Masukkan kategori',
              controller: kategori,
            ),
          ],
        ),
      ),
    );
  }
}
