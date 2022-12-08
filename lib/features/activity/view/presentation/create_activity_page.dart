import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/activity.dart';
import '../view_model/view_model.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  late TextEditingController judul;
  late TextEditingController isi;
  final ActivityViewModel _viewModel = ActivityViewModel();

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
        title: Text('Create Activity'),
        actions: [
          IconButton(
              onPressed: () async {
                await _viewModel.postActivity(context,
                    judul: judul.text, isi: isi.text);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: judul,
          ),
          TextField(
            controller: isi,
          )
        ],
      ),
    );
  }
}