

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/timeline/model/timeline.dart';
import 'package:ingatkan/features/timeline/view/presentation/edit_timeline_page.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:ingatkan/services/navigator_service.dart';

import '../view_model/view_model.dart';

class SingleTimelinePage extends StatefulWidget {
  final Timeline timeline;
  const SingleTimelinePage({Key? key, required this.timeline}) : super(key: key);

  @override
  State<SingleTimelinePage> createState() => _SingleTimelinePageState();
}

class _SingleTimelinePageState extends State<SingleTimelinePage> {
  final TimelineViewModel _viewModel = TimelineViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          if(ProfileData.data.isAdmin ?? false)
            IconButton(onPressed: (){
              DialogService().actionDialog(context,
                  title: 'Hapus Timeline',
                  message: 'Apakah Anda yakin?',
                  action: () async {
                    await _viewModel.deleteTimeline(context, id: widget.timeline.id);
                  }
              );
            }, icon: const Icon(Icons.delete)),
        ],
        title: Observer(
          builder: (context) {
            return Text(widget.timeline.judul ?? 'Activity');
          }
        ),
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0, left : 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Writer : " + (widget.timeline.writer ?? '')),
                      Text("Date : " + (widget.timeline.timeStamp ?? DateTime.now().toString())),
                    ],
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0, left : 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(widget.timeline.isi ?? '', style: const TextStyle(fontSize: 16)),),

                    ],
                  ),

                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: ProfileData.data.isAdmin ?? false
          ? FloatingActionButton(
        onPressed: () {
          NavigatorService.push(context, route: EditTimelinePage(timeline: widget.timeline));
        },
        child: const Icon(Icons.edit),
      ) : null,
    );
  }
}
