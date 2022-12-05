import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/authentication/controller/authentication_remote_data_sources.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:mobx/mobx.dart';

import '../../model/profile.dart';

part 'view_model.g.dart';

class AuthenticationViewModel = AuthenticationViewModelBase with _$AuthenticationViewModel;

abstract class AuthenticationViewModelBase with Store {

  final AuthenticationRemoteDataSources _dataSources = AuthenticationRemoteDataSourcesImpl();
  final DialogService _dialogService = DialogService();

  @observable
  var _profile = Observable<Profile>(Profile());

  @observable
  var _isLoading = Observable<bool>(false);

  @action
  Future<void> login(BuildContext context, {String? username, String? password}) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.login(username: username, password: password);
      log(temp.toJson().toString());
      _profile.value = temp;
      ProfileData.data = temp;
      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      if(e is Error){
        if(e.statusCode == 401){
          _dialogService.showMessageDialog(context, title: 'Username/Password Salah', message: 'Periksa kembali!');
        }
      }
      log(e.toString());
      _dialogService.networkError(context);
    }

  }

  @computed
  Profile get profile => _profile.value;

  @computed
  bool get isLoading => _isLoading.value;

}