import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/features/timeline/view/presentation/single_timeline_page.dart';
import 'package:ingatkan/features/timeline/view/view_model/view_model.dart';
import 'package:ingatkan/services/navigator_service.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final TimelineViewModel _viewModel = TimelineViewModel();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _viewModel.getAllTimeline(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _viewModel.getAllTimeline(context);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _controller,
        child: Observer(
          builder: (context) {
            return Stack(
              children: [
                ListView(
                  controller: _controller,
                  shrinkWrap: true,
                  children: List.generate(_viewModel.timelines.length, (index) {
                    String judul = _viewModel.timelines[index].judul ?? '';
                    String isi = _viewModel.timelines[index].isi ?? '';
                    String timeStamp = _viewModel.timelines[index].timeStamp ?? '';
                    String writer = _viewModel.timelines[index].writer ?? '';
                    return InkWell(
                      onTap: () async {
                        await _viewModel.getTimeline(context, id: _viewModel.timelines[index].id);
                        if(!_viewModel.isLoading){
                          NavigatorService.push(context, route: SingleTimelinePage(timeline: _viewModel.timeline,));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Writer : " + writer),
                                Text("Date : " + timeStamp),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                    child: Expanded(child: Text(judul, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),)


                                    )],
                                ),
                                // if(_viewModel.isLoading && _viewModel.timelines.isNotEmpty)
                                //   Expanded(child: const Center(
                                //     child: CircularProgressIndicator(),
                                //   ),),

                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(isi, maxLines: 2,),),
                                // if(_viewModel.isLoading && _viewModel.timelines.isNotEmpty)
                                //   const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
