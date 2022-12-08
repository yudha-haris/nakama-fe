import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: Text('Edit Activity'),
        actions: [
          IconButton(
              onPressed: () async {
                await _viewModel.putActivity(context,
                    judul: judul.text,
                    isi: isi.text,
                    idActivity: widget.activity.id);
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
