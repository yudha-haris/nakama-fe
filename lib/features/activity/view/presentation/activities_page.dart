import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/activity/view/presentation/update_activity_page.dart';
import 'package:ingatkan/features/activity/view/view_model/view_model.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:ingatkan/services/navigator_service.dart';

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
        await _viewModel.getActivity(context,
            username: ProfileData.data.username);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _controller,
        child: Observer(builder: (context) {
          return Stack(
            children: [
              ListView(
                controller: _controller,
                shrinkWrap: true,
                children: List.generate(_viewModel.activities.length, (index) {
                  String judul = _viewModel.activities[index].judul ?? '';
                  String isi = _viewModel.activities[index].isi ?? '';
                  String timeStamp =
                      _viewModel.activities[index].timeStamp ?? '';
                  String writer = _viewModel.activities[index].writer ?? '';
                  return InkWell(
                    onTap: () {
                      NavigatorService.push(context,
                          route: UpdateActivityPage(
                              activity: _viewModel.activities[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(judul),
                                  Text(isi),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        // tambah konfirmasi popup
                                        _viewModel.finishActivity(context,
                                            idActivity: _viewModel
                                                .activities[index].id);
                                      },
                                      icon: Icon(Icons.check)),
                                  IconButton(
                                      onPressed: () {
                                        // tambah konfirmasi popup
                                        _viewModel.deleteActivity(context,
                                            idActivity: _viewModel
                                                .activities[index].id);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
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
        }),
      ),
    );
  }
}
