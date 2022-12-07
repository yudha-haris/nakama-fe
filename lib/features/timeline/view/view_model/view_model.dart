import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ingatkan/features/timeline/model/timeline.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:mobx/mobx.dart';

import '../../controller/timeline_remote_data_sources.dart';

part 'view_model.g.dart';

class TimelineViewModel = TimelineViewModelBase with _$TimelineViewModel;

abstract class TimelineViewModelBase with Store {

  final TimelineRemoteDataSources _dataSources = TimelineRemoteDataSourcesImpl();
  final DialogService _dialogService = DialogService();

  @observable
  var _timelines = ObservableList<Timeline>();

  @observable
  var _timeline = Observable<Timeline>(Timeline());

  @observable
  var _isLoading = Observable<bool>(false);

  @action
  Future<void> getAllTimeline(BuildContext context) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getAllTimeline();
      log(temp.toString());
      _timelines.clear();
      for(var i = 0; i < temp.length; i++){
        _timelines.add(temp[i]);
      }
      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> createTimeline(BuildContext context, {String? judul, String? isi}) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getAllTimeline();
      log(temp.toString());
      for(var i = 0; i < temp.length; i++){
        _timelines.add(temp[i]);
      }
      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> updateTimeline(BuildContext context) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getAllTimeline();
      log(temp.toString());
      for(var i = 0; i < temp.length; i++){
        _timelines.add(temp[i]);
      }
      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> deleteTimeline(BuildContext context, {String? id}) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.deleteTimeline(id: id);
      log(temp.toString());

      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> getTimeline(BuildContext context, {String? id}) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getTimeline(id: id);
      log(temp.toString());

      _isLoading.value = false;
    } catch (e){
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @computed
  Timeline get timeline => _timeline.value;

  @computed
  List<Timeline> get timelines => _timelines;

  @computed
  bool get isLoading => _isLoading.value;

}