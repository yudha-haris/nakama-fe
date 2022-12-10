import 'package:flutter/material.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:mobx/mobx.dart';

part 'global_state.g.dart';

class GlobalState = GlobalStateBase with _$GlobalState;

abstract class GlobalStateBase with Store {
  final DialogService _dialogService = DialogService();

  @observable
  var _themeMode = Observable<ThemeMode>(ThemeMode.light);

  @observable
  var _isLoading = Observable<bool>(false);

  @action
  Future<void> switchTheme() async {
    if(_themeMode.value == ThemeMode.light){
      _themeMode.value = ThemeMode.dark;
    } else {
      _themeMode.value = ThemeMode.light;
    }
  }

  @computed
  ThemeMode get themeMode => _themeMode.value;

  @computed
  bool get isLoading => _isLoading.value;

}