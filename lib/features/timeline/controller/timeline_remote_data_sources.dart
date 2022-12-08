import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/features/timeline/model/timeline.dart';

abstract class TimelineRemoteDataSources {
  Future<List<Timeline>> getAllTimeline();
  Future<Timeline> getTimeline({String? id});
  Future<bool> createTimeline({String? username, String? judul, String? isi});
  Future<bool> updateTimeline({String? id, String? judul, String? isi});
  Future<bool> deleteTimeline({String? id, String? judul});
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
  Future<bool> createTimeline({String? username, String? judul, String? isi}) async {
    var url = Uri.https(Environment.baseUrl, Environment.createTimeline);
    var response = await http.post(url, body:
    {'username': username ?? '',
    'judul' : judul ?? '',
    'isi': isi ?? '',
    });

    if(response.statusCode == 200){
      return true;
    } else {
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
  }

  @override
  Future<bool> deleteTimeline({String? id, String? judul}) async {
    var url = Uri.https(Environment.baseUrl, Environment.deleteTimeline);
    var response = await http.post(url, body: {
      "id_timeline": id ?? '',
      "judul": judul ?? '',
    });
    if(response.statusCode == 200){
      return true;
    } else {
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
  }

  @override
  Future<Timeline> getTimeline({String? id}) async {
    var url = Uri.https(Environment.baseUrl, Environment.getTimeline);
    var response = await http.post(url, body: {"id_timeline": id ?? ''});

    if(response.statusCode != 200){
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
    var responseBody = await jsonDecode(response.body);
    var rawList = responseBody['data'] as List;
    log('get timeline dts');
    log(rawList.toString());
    Timeline timeline = Timeline.parseFromResponse(rawList);
    log(timeline.writer.toString());
    return timeline;
  }

  @override
  Future<bool> updateTimeline({String? id, String? judul, String? isi}) async {
    // TODO: implement updateTimeline
    var url = Uri.https(Environment.baseUrl, Environment.updateTimeline);
    var response = await http.post(url, body: {
      "id_timeline": id ?? '',
      "judul": judul ?? '',
      "isi": isi ?? '',
    });
    if(response.statusCode == 200){
      return true;
    } else {
      throw Error(statusCode: response.statusCode, message: 'Jaringan bermasalah');
    }
  }

}