

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/timeline/model/timeline.dart';
import 'package:ingatkan/services/dialog_service.dart';

import '../../../../core/widgets/ingatkan_textfield.dart';
import '../view_model/view_model.dart';

class CreateTimelinePage extends StatefulWidget {
  const CreateTimelinePage({Key? key}) : super(key: key);

  @override
  State<CreateTimelinePage> createState() => _CreateTimelinePageState();
}

class _CreateTimelinePageState extends State<CreateTimelinePage> {
  final TimelineViewModel _viewModel = TimelineViewModel();

  late TextEditingController judul;
  late TextEditingController isi;

  @override
  void initState() {
    judul = TextEditingController();
    isi = TextEditingController();
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
        centerTitle: true,
        actions: [
          if(ProfileData.data.isAdmin ?? false)
            IconButton(onPressed: (){
              DialogService().actionDialog(context,
                  title: 'Buat Timeline',
                  message: 'Apakah Anda yakin?',
                  action: () async {
                    await _viewModel.createTimeline(context, judul: judul.text, isi: isi.text);
                  }
              );
            }, icon: const Icon(Icons.save)),
        ],
        title: const Text('Buat Timeline'),
      ),
      body: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16,),
                    IngatkanTextField(
                      hint: 'Masukkan judul',
                      controller: judul,),
                    const SizedBox(height: 16,),
                    IngatkanTextField(
                      hint: 'Masukkan isi',
                      controller: isi,
                    ),
                  ],
              ),
            );
          }
      ),
    );
  }
}
