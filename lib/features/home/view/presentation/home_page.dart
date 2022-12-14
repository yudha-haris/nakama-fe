import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/core/global/global_state.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/core/widgets/ingatkan_button.dart';
import 'package:ingatkan/features/activity/view/presentation/activities_page.dart';
import 'package:ingatkan/features/activity/view/presentation/create_activity_page.dart';
import 'package:ingatkan/features/activity/view/presentation/history_page.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';
import 'package:ingatkan/features/kategori/view/presentation/kategori_screen.dart';
import 'package:ingatkan/features/profile/view/presentation/profile_page.dart';
import 'package:ingatkan/features/profile/view/view_model/view_model.dart';
import 'package:ingatkan/features/timeline/view/presentation/create_timeline_page.dart';
import 'package:ingatkan/features/timeline/view/presentation/timeline_page.dart';
import 'package:ingatkan/services/navigator_service.dart';
import 'package:ingatkan/services/shared_prefs.dart';
import 'package:provider/provider.dart';

import '../../../authentication/model/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingatkan' + (!(ProfileData.data.isAdmin ?? false) ? '' : ' (admin)')),
        actions: <Widget>[
          if(!(ProfileData.data.isAdmin ?? false))
            IconButton(onPressed: (){
              NavigatorService.push(context, route: const HistoryPage());
            }, icon: const Icon(Icons.history))
        ],
      ),
      drawer: const HomePageDrawer(),
      body: !(ProfileData.data.isAdmin ?? false)
          ? PageView(
        physics: const NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        controller: _controller,
        children: const [
          ActivitiesPage(),
          TimelinePage(),
        ],
      ) : const TimelinePage(),
      bottomNavigationBar: !(ProfileData.data.isAdmin ?? false)
          ? HomePageBottomNavigationBar(
        controller: _controller,)
          : const SizedBox(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if(ProfileData.data.isAdmin ?? false){
            NavigatorService.push(context, route: const CreateTimelinePage());
          } else {
            NavigatorService.push(context, route: const CreateActivityPage());
          }
        },
      ),
      floatingActionButtonLocation: !(ProfileData.data.isAdmin ?? false)
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
    );
  }
}

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  State<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  final GlobalState _globalState = GlobalState();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16,),
            InkWell(
                onTap: (){
                  NavigatorService.push(context, route: const ProfilePage());
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(height: 8,),
                            Text(ProfileData.data.username ?? 'Pengguna',
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        )))),
            const SizedBox(height: 16,),
            IngatkanButton(label: 'Kategori', onPressed: (){
              NavigatorService.push(context, route: const KategoriScreen());
            }),
            const SizedBox(height: 16,),

            const Text('Ganti Tema'),
            Observer(
              builder: (context) {
                return Switch(value: context.read<GlobalState>().themeMode == ThemeMode.light, onChanged: (value) async {
                  context.read<GlobalState>().switchTheme();
                  ProfileViewModel().switchTheme(context, themeData: context.read<GlobalState>().themeMode);
                });
              }
            ),
            const Spacer(),
            IngatkanButton(
                label: 'Keluar', onPressed: (){
                  SharedPrefs().removeUser();
                  ProfileData.data = Profile();
                  NavigatorService.pushReplacement(context, route: const LoginPage());
            }),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}

class HomePageBottomNavigationBar extends StatefulWidget {
  final PageController controller;
  const HomePageBottomNavigationBar({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePageBottomNavigationBar> createState() => _HomePageBottomNavigationBarState();
}

class _HomePageBottomNavigationBarState extends State<HomePageBottomNavigationBar> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeBottomNavBarItem(
                onTap: (){
                  setState(() {
                    widget.controller.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                    pageIndex = 0;
                  });
                },
                isSelected: pageIndex == 0 ,
                icon: Icons.alarm,
                label: 'Activities'),
            HomeBottomNavBarItem(
                onTap: (){
                  setState(() {
                    widget.controller.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                    pageIndex = 1;
                  });
                },
                isSelected: pageIndex == 1 ,
                icon: Icons.file_present,
                label: 'Timeline'),
          ],
        ),
      ),
    );
  }
}

class HomeBottomNavBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final IconData icon;
  final String label;
  const HomeBottomNavBarItem(
      {Key? key,
      required this.onTap,
      required this.isSelected,
      required this.icon,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap.call();
        },
        child: Column(
          children: [
            Container(
              width: 50,
              height: 4,
              color: isSelected ? Colors.lightBlueAccent : Colors.transparent,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
