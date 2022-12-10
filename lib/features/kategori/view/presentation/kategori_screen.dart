import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/kategori/view/presentation/add_kategori_screen.dart';
import 'package:ingatkan/features/kategori/view/presentation/update_kategori_screen.dart';
import 'package:ingatkan/features/kategori/view/view_model/view_model.dart';
import 'package:ingatkan/services/navigator_service.dart';

class KategoriScreen extends StatefulWidget {
  const KategoriScreen({Key? key}) : super(key: key);

  @override
  State<KategoriScreen> createState() => _KategoriScreenState();
}

class _KategoriScreenState extends State<KategoriScreen> {
  final ScrollController _controller = ScrollController();
  final KategoriViewModel _viewModel = KategoriViewModel();

  @override
  void initState() {
    _viewModel.getKategori(context, username: ProfileData.data.username);
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
        title: Text('Category Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _viewModel.getKategori(context,
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
                  children: List.generate(_viewModel.categories.length, (index) {
                    String judul = _viewModel.categories[index].judul ?? '';
                    return InkWell(
                      onTap: () {
                        NavigatorService.push(context,
                            route: UpdateKategoriScreen(
                                kategori: _viewModel.categories[index]));
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
                                Column(
                                  children: [
                                    Text(judul),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _viewModel.deleteKategori(
                                              context,
                                              idKategori: _viewModel
                                                  .categories[index].id);
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
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          NavigatorService.push(context, route: const AddKategoriScreen());
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
