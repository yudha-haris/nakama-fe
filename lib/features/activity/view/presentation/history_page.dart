import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/global/profile_data.dart';
import '../view_model/view_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final ScrollController _controller = ScrollController();
  final ActivityViewModel _viewModel = ActivityViewModel();

  @override
  void initState() {
    _viewModel.getHistory(context, username: ProfileData.data.username);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _viewModel.getHistory(context,
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
                  children: List.generate(_viewModel.histories.length, (index) {
                    String judul = _viewModel.histories[index].judul ?? '';
                    String isi = _viewModel.histories[index].isi ?? '';
                    String timeStamp =
                        _viewModel.histories[index].timeStamp ?? '';
                    String writer = _viewModel.histories[index].writer ?? '';
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
          }),
        ),
      ),
    );
  }
}
