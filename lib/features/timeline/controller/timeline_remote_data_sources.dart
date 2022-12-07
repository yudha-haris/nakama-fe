import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/features/timeline/model/timeline.dart';

abstract class TimelineRemoteDataSources {
  Future<List<Timeline>> getAllTimeline();
  Future<Timeline> getTimeline({String? id});
  Future<bool> createTimeline({String? judul, String? isi});
  Future<bool> updateTimeline({String? id, String? judul, String? isi});
  Future<bool> deleteTimeline({String? id});
}

class TimelineRemoteDataSourcesImpl implements TimelineRemoteDataSources {
  @override
  Future<List<Timeline>> getAllTimeline() async {
    var url = Uri.https(Environment.baseUrl, Environment.getAllTimelines);
    var response = await http.get(url);
    if(response.statusCode != 200){
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
    var responseBody = await jsonDecode(response.body);
    log(responseBody.toString());
    var rawList = responseBody['data'] as List;
    List<Timeline> result = [];
    for(int i = 0; i < rawList.length; i++){
      result.add(Timeline.parseFromResponse(rawList[i]));
    }

    return result;
  }

  @override
  Future<bool> createTimeline({String? judul, String? isi}) async {
    var url = Uri.https(Environment.baseUrl, Environment.createTimeline);
    var response = await http.post(url);
    // TODO: implement createTimeline
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTimeline({String? id}) async {
    // TODO: implement deleteTimeline
    throw UnimplementedError();
  }

  @override
  Future<Timeline> getTimeline({String? id}) async {
    // TODO: implement getTimeline
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTimeline({String? id, String? judul, String? isi}) {
    // TODO: implement updateTimeline
    throw UnimplementedError();
  }

}