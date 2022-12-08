import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/activity/view/view_model/view_model.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final ScrollController _controller = ScrollController();
  final ActivityViewModel _viewModel = ActivityViewModel();

  @override
  void initState() {
    _viewModel.getActivity(context, username: ProfileData.data.username);
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
        await _viewModel.getActivity(context, username: ProfileData.data.username);
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
                    children: List.generate(_viewModel.activities.length, (index) {
                      String judul = _viewModel.activities[index].judul ?? '';
                      String isi = _viewModel.activities[index].isi ?? '';
                      String timeStamp = _viewModel.activities[index].timeStamp ?? '';
                      String writer = _viewModel.activities[index].writer ?? '';
                      return Container(
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
                        child: GestureDetector(
                          onTap: () async {
                            // await _viewModel.get(context, id: _viewModel.timelines[index].id);
                            // NavigatorService.push(context, route: const SingleTimelinePage());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(writer),
                                  Text(timeStamp),
                                ],
                              ),
                              Text(judul),
                              Text(isi),
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
