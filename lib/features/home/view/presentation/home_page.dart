import 'package:flutter/material.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';
import 'package:ingatkan/features/timeline/view/presentation/timeline_page.dart';
import 'package:ingatkan/services/navigator_service.dart';

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
        title: const Text('Ingatkan'),
      ),
      drawer: const HomePageDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        controller: _controller,
        children: [
          Container(
          ),
          const TimelinePage(),
        ],
      ),
      bottomNavigationBar: HomePageBottomNavigationBar(
        controller: _controller,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {  },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Text(ProfileData.data.username ?? 'Pengguna'),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){
              // move to kategori page
            }, child: const Center(child: Text('Kategori'),)),
            const Spacer(),
            ElevatedButton(onPressed: (){
              ProfileData.data = Profile();
              NavigatorService.pushReplacement(context, route: const LoginPage());
            }, child: const Center(child: Text('Keluar'),)),
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
        color: Colors.blueAccent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeBottomNavBarItem(
                onTap: (){
                  setState(() {
                    widget.controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    pageIndex = 0;
                  });
                },
                isSelected: pageIndex == 0 ,
                icon: Icons.alarm,
                label: 'Activities'),
            HomeBottomNavBarItem(
                onTap: (){
                  setState(() {
                    widget.controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
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
  const HomeBottomNavBarItem({Key? key, required this.onTap, required this.isSelected, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          onTap.call();
        },
        child: Column(
          children: [
            Container(
              width: 50,
              height: 4,
              color: isSelected ? Colors.lightBlueAccent : Colors.transparent,
            ),
            Expanded(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(height: 4,),
                Text(label, style: const TextStyle(color: Colors.white),)
              ],))

          ],),),
    );
  }
}



