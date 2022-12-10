

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/timeline/model/timeline.dart';
import 'package:ingatkan/services/dialog_service.dart';

import '../../../../core/widgets/ingatkan_textfield.dart';
import '../view_model/view_model.dart';

class EditTimelinePage extends StatefulWidget {
  final Timeline timeline;
  const EditTimelinePage({Key? key, required this.timeline}) : super(key: key);

  @override
  State<EditTimelinePage> createState() => _EditTimelinePageState();
}

class _EditTimelinePageState extends State<EditTimelinePage> {
  final TimelineViewModel _viewModel = TimelineViewModel();

  late TextEditingController judul;
  late TextEditingController isi;

  @override
  void initState() {
    judul = TextEditingController(text: widget.timeline.judul);
    isi = TextEditingController(text: widget.timeline.isi);
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          if(ProfileData.data.isAdmin ?? false)
            IconButton(onPressed: (){
              DialogService().actionDialog(context,
                  title: 'Edit Timeline',
                  message: 'Apakah Anda yakin?',
                  action: () async {
                    await _viewModel.updateTimeline(context, judul: judul.text, isi: isi.text, id: widget.timeline.id ?? '');
                  }
              );
            }, icon: const Icon(Icons.save)),
        ],
        title: const Text('Edit Timeline'),
      ),
      body: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical : 16),
                    child: Text("Masukkan judul : "),
                  ),
                  IngatkanTextField(
                    hint: 'judul',
                    controller: judul,),
                  const SizedBox(height: 16,),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical : 16),
                    child: Text("Masukkan isi : "),
                  ),
                  IngatkanTextField(
                    hint: 'isi',
                    controller: isi,
                    maxLine: 10,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
