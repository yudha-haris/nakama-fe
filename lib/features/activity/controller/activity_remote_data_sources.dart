import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';

import '../model/activity.dart';

abstract class ActivityRemoteDataSources {
  Future<List<Activity>> getHistory({String? username});
  Future<List<Activity>> getActivity({String? username});
  Future<bool> postActivity(
      {String? judul,
      String? isi,
      String? idPembuat,
      String? timestamp,
      String? categories});
  Future<bool> putActivity(
      {String? idActivity,
      String? judul,
      String? isi,
      String? idPembuat,
      String? timestamp,
      String? categories});
  Future<bool> deleteActivity({String? idActivity});
  Future<bool> finishActivitys({String? idActivity, String? timestamp});
}

class ActivityRemoteDataSourcesImpl implements ActivityRemoteDataSources {
  @override
  Future<List<Activity>> getActivity({String? username}) async {
    var url = Uri.https(Environment.baseUrl, Environment.getActivity);
    var response = await http.post(url, body: {'username': username});
    if (response.statusCode != 200) {
      throw Error(
          statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
    var responseBody = await jsonDecode(response.body);
    log(responseBody.toString());
    var rawList = responseBody['data'] as List;
    List<Activity> result = [];
    for (int i = 0; i < rawList.length; i++) {
      result.add(Activity.parseFromResponse(rawList[i]));
    }
    return result;
  }

  @override
  Future<bool> postActivity(
      {String? judul,
      String? isi,
      String? idPembuat,
      String? timestamp,
      String? categories}) async {
    var url = Uri.https(Environment.baseUrl, Environment.postActivity);
    var response = await http.post(url, body: {
      'judul': judul,
      'isi': isi,
      'username': idPembuat,
      'timestamp': timestamp,
      'categories': categories,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  @override
  Future<bool> putActivity(
      {String? idActivity,
      String? judul,
      String? isi,
      String? idPembuat,
      String? timestamp,
      String? categories}) async {
    var url = Uri.https(Environment.baseUrl, Environment.putActivity);
    var response = await http.post(url, body: {
      'id_activity': idActivity,
      'judul': judul,
      'isi': isi,
      'username': idPembuat,
      'timestamp': timestamp,
      'categories': categories
    });
    log(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  @override
  Future<bool> deleteActivity({String? idActivity}) async {
    var url = Uri.https(Environment.baseUrl, Environment.deleteActivity);
    var response = await http.post(url, body: {'id_activity': idActivity});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  @override
  Future<bool> finishActivitys({String? idActivity, String? timestamp}) async {
    var url = Uri.https(Environment.baseUrl, Environment.finishActivity);
    var response = await http
        .post(url, body: {'id_activity': idActivity, 'timestamp': timestamp});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  @override
  Future<List<Activity>> getHistory({String? username}) async {
    var url = Uri.https(Environment.baseUrl, Environment.getHistory);
    var response = await http.post(url, body: {'username': username});
    if (response.statusCode != 200) {
      throw Error(
          statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
    var responseBody = await jsonDecode(response.body);
    log(responseBody.toString());
    var rawList = responseBody['data'] as List;
    List<Activity> result = [];
    for (int i = 0; i < rawList.length; i++) {
      result.add(Activity.parseFromResponse(rawList[i]));
    }
    return result;
  }
}
