import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/home/view/presentation/home_page.dart';
import 'package:ingatkan/features/kategori/controller/kategori_remote_data_sources.dart';
import 'package:ingatkan/features/kategori/model/kategori.dart';
import 'package:ingatkan/services/dialog_service.dart';
import 'package:ingatkan/services/navigator_service.dart';
import 'package:mobx/mobx.dart';


part 'view_model.g.dart';

class KategoriViewModel = KategoriViewModelBase with _$ActivityViewModel;

abstract class KategoriViewModelBase with Store {
  final KategoriRemoteDataSources _dataSources =
  KategoriRemoteDataSourcesImpl();
  final DialogService _dialogService = DialogService();

  @observable
  var _categories = ObservableList<Kategori>();

  @observable
  var _kategori = Observable<Kategori>(Kategori());

  @observable
  var _isLoading = Observable<bool>(false);


  @computed
  Kategori get kategori => _kategori.value;

  @computed
  List<Kategori> get categories => _categories;

  @computed
  bool get isLoading => _isLoading.value;

  @action
  Future<void> getKategori(
      BuildContext context,
      {String? username})
  async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.getKategori(username: username);
      log(temp.toString());
      _categories.clear();
      for (var i = 0; i < temp.length; i++) {
        _categories.add(temp[i]);
      }
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      if (e is Error) {
        if (e.statusCode == 401) {
          _dialogService.networkError(context);
        }
      }
      log(e.toString());
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> updateKategori(
      BuildContext context,
      {
        String? judul,
        String? username,
        String? idKategori
      }) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.updateKategori(
        idKategori: idKategori,
        judul: judul,
        username: ProfileData.data.username,
      );
      _isLoading.value = false;
      if (temp) {
        NavigatorService.pushReplacement(context, route: HomePage());
      } else {
        _dialogService.networkError(context);
      }
    } catch (e) {
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> addKategori(
      BuildContext context,
      {
        String? judul,
        String? idKategori,
      }) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.addKategori(
        judul: judul,
        username: ProfileData.data.username,
        idKategori: idKategori,
      );
      _isLoading.value = false;
      if (temp) {
        NavigatorService.pushReplacement(context, route: HomePage());
      } else {
        _dialogService.networkError(context);
      }
    } catch (e) {
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

  @action
  Future<void> deleteKategori(
      BuildContext context,
      {
        String? idKategori
      }) async {
    try {
      _isLoading.value = true;
      var temp = await _dataSources.deleteKategori(
        idKategori: idKategori,
      );
      _isLoading.value = false;
      if (temp) {
        NavigatorService.pushReplacement(context, route: HomePage());
      } else {
        _dialogService.networkError(context);
      }
    } catch (e) {
      _isLoading.value = false;
      _dialogService.networkError(context);
    }
  }

}
