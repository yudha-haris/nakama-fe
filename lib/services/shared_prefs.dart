import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';
import 'package:ingatkan/features/authentication/view/view_model/view_model.dart';
import 'package:ingatkan/services/navigator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final AuthenticationViewModel _viewModel = AuthenticationViewModel();
  static SharedPreferences? prefs;

  Future<void> init() async {
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      prefs = await SharedPreferences.getInstance();
    });

  }

  Future<void> initUser(BuildContext context) async {
    if(prefs == null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? username = prefs.getString('username');
      final String? password = prefs.getString('password');
      if(username != null && password != null){
        _viewModel.login(context, username: username, password: password);
      } else {
        NavigatorService.pushReplacement(context, route: const LoginPage());
      }
    } else {
      final String? username = prefs?.getString('username');
      final String? password = prefs?.getString('password');
      if(username != null && password != null){
        _viewModel.login(context, username: username, password: password);
      } else {
        NavigatorService.pushReplacement(context, route: const LoginPage());
      }
    }

  }

  Future<void> saveUser(String username, String password) async {
    if(prefs == null){
      await init();
    }
    await prefs?.setString('username', username);
    await prefs?.setString('password', password);
    final String? username2 = prefs?.getString('username');
    final String? password2 = prefs?.getString('password');
  }

  Future<void> removeUser() async {
    if(prefs == null){
      await init();
    }
    await prefs?.remove('username');
    await prefs?.remove('password');
  }
}