import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ingatkan/features/authentication/view/view_model/view_model.dart';
import 'package:ingatkan/features/profile/view/view_model/view_model.dart';
import 'package:ingatkan/services/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> checkLogin() async {
    Future.delayed(const Duration(seconds: 1));
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await SharedPrefs().initUser(context);
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Ingatkan'),
              SizedBox(
                  width: 100,
                  child: LinearProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
