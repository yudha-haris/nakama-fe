import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';

import '../model/activity.dart';

abstract class ActivityRemoteDataSources {
  Future<List<Activity>> getHistory({String? username});
  Future<List<Activity>> getActivity({String? username});
}

class ActivityRemoteDataSourcesImpl implements ActivityRemoteDataSources {
  @override
  Future<List<Activity>> getActivity({String? username}) async {
    var url = Uri.https(Environment.baseUrl, Environment.getActivity);
    var response = await http.post(url, body: {'username' : username});
    if(response.statusCode != 200){
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
    var responseBody = await jsonDecode(response.body);
    log(responseBody.toString());
    var rawList = responseBody['data'] as List;
    List<Activity> result = [];
    for(int i = 0; i < rawList.length; i++){
      result.add(Activity.parseFromResponse(rawList[i]));
    }
    return result;
  }

  @override
  Future<List<Activity>> getHistory({String? username}) async {
    var url = Uri.https(Environment.baseUrl, Environment.getHistory);
    var response = await http.post(url, body: {'username' : username});
    if(response.statusCode != 200){
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
    var responseBody = await jsonDecode(response.body);
    log(responseBody.toString());
    var rawList = responseBody['data'] as List;
    List<Activity> result = [];
    for(int i = 0; i < rawList.length; i++){
      result.add(Activity.parseFromResponse(rawList[i]));
    }
    return result;
  }
  
}