import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:mobx/mobx.dart';

import '../../../authentication/model/profile.dart';
import '../../controller/profile_remote_data_sources.dart';

part 'view_model.g.dart';

class ProfileViewModel = ProfileViewModelBase with _$ProfileViewModel;

abstract class ProfileViewModelBase with Store {

  final ProfileRemoteDataSources _dataSources = ProfileRemoteDataSourcesImpl();
  final DialogService _dialogService = DialogService();

  @observable
  var _profile = Observable<Profile>(ProfileData.data);

  @observable
  var _isLoading = Observable<bool>(false);

  @action
  Future<void> editProfile(BuildContext context, {
    String? username,
    String? password,
    String? confirmPassword,
    String? name,
    String? email,
    String? phone,
  }) async {
    if(password != confirmPassword){
      _dialogService.showMessageDialog(context, title: 'Password Tidak Cocok');
    } else {
      try {
        _isLoading.value = true;
        var temp = await _dataSources.editProfile(username: username, password: password, name: name, phone: phone, email: email);
        log(temp.toJson().toString());
        _profile.value = temp;
        ProfileData.data = temp;
        _isLoading.value = false;

        Navigator.of(context).pop();
      } catch (e){
        _isLoading.value = false;
        log(e.toString());
        _dialogService.networkError(context);
      }
    }
  }

  @computed
  Profile get profile => _profile.value;

  @computed
  bool get isLoading => _isLoading.value;

}