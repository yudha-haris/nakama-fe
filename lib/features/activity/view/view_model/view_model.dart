import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/authentication/controller/authentication_remote_data_sources.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';
import 'package:ingatkan/features/home/view/presentation/home_page.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:ingatkan/services/navigator_service.dart';
import 'package:mobx/mobx.dart';

import '../../controller/activity_remote_data_sources.dart';
import '../../model/activity.dart';

part 'view_model.g.dart';

class ActivityViewModel = ActivityViewModelBase with _$ActivityViewModel;

abstract class ActivityViewModelBase with Store {

  final ActivityRemoteDataSources _dataSources = ActivityRemoteDataSourcesImpl();
  final DialogService _dialogService = DialogService();

  @observable
  var _activities = ObservableList<Activity>();

  @observable
  var _histories = ObservableList<Activity>();

  @observable
  var _activity = Observable<Activity>(Activity());

  @observable
  var _isLoading = Observable<bool>(false);

  @action
  Future<void> getHistory(BuildContext context, {String? username}) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getHistory(username: username);
      log(temp.toString());
      _histories.clear();
      for(var i = 0; i < temp.length; i++){
        _histories.add(temp[i]);
      }
      _isLoading.value = false;

    } catch (e){
      _isLoading.value = false;
      if(e is Error){
        if(e.statusCode == 401){
          _dialogService.networkError(context);
        }
      }
      log(e.toString());
      _dialogService.networkError(context);
    }

  }

  @action
  Future<void> getActivity(BuildContext context, {String? username}) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getActivity(username: username);
      log(temp.toString());
      _activities.clear();
      for(var i = 0; i < temp.length; i++){
        _activities.add(temp[i]);
      }
      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      if(e is Error){
        if(e.statusCode == 401){
          _dialogService.networkError(context);
        }
      }
      log(e.toString());
      _dialogService.networkError(context);
    }

  }

  @computed
  Activity get activity => _activity.value;

  @computed
  List<Activity> get activities => _activities;

  @computed
  List<Activity> get histories => _histories;

  @computed
  bool get isLoading => _isLoading.value;

}