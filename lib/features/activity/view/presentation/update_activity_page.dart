import 'package:flutter/material.dart';
import '../../../../core/widgets/ingatkan_textfield.dart';
import '../../../../services/dialog_service.dart';
import '../../model/activity.dart';
import '../view_model/view_model.dart';

class UpdateActivityPage extends StatefulWidget {
  final Activity activity;
  const UpdateActivityPage({Key? key, required this.activity})
      : super(key: key);

  @override
  State<UpdateActivityPage> createState() => _UpdateActivityPageState();
}

class _UpdateActivityPageState extends State<UpdateActivityPage> {
  late TextEditingController judul;
  late TextEditingController isi;
  late TextEditingController kategori;
  final ActivityViewModel _viewModel = ActivityViewModel();

  @override
  void initState() {
    judul = TextEditingController(text: widget.activity.judul);
    isi = TextEditingController(text: widget.activity.isi);

    super.initState();
  }

  @override
  void dispose() {
    judul.dispose();
    isi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Activity'),
        actions: [
          IconButton(
              onPressed: () async {
                if (judul.text.isEmpty) {
                  DialogService().showMessageDialog(context,
                      message: 'Harap masukkan nama activity!');
                } else {
                  DialogService().actionDialog(
                    context,
                    title: 'Ubah Activity',
                    message: 'Activity berhasil diubah!',
                    action: () async {
                      await _viewModel.putActivity(context,
                          judul: judul.text,
                          isi: isi.text,
                          idActivity: widget.activity.id);
                    },
                  );
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
              hint: 'Masukkan Kategori',
              controller: kategori,
            ),
          ],
        ),
      ),
    );
  }
}
