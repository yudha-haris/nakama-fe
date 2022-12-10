import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/features/kategori/model/kategori.dart';

abstract class KategoriRemoteDataSources {

  Future<bool> addKategori(
      {String? idKategori,
        String? judul,
        String? username,
      });

  Future<bool> deleteKategori(
      {String? idKategori,
      });

  Future<bool> updateKategori(
      {String? idKategori,
        String? judul,
        String? username,
      });

  Future<List<Kategori>> getKategori(
      {
        String? username,
      });
}

class KategoriRemoteDataSourcesImpl implements KategoriRemoteDataSources {

  @override
  Future<bool> addKategori({
    String? idKategori,
    String? judul,
    String? username,
  }) async {
    var url = Uri.https(Environment.baseUrl, Environment.createKategori);
    var response = await http.post(url, body: {
      'id_kategori': idKategori,
      'judul': judul,
      'username': username,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error(message: response.body.toString());
    }
  }

  @override
  Future<bool> deleteKategori({String? idKategori}) async {
    var url = Uri.https(Environment.baseUrl, Environment.deleteKategori);
    var response = await http.post(url, body: {'id_kategori': idKategori});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  @override
  Future<bool> updateKategori({
    String? idKategori,
    String? judul,
    String? username,
  }) async {
    var url = Uri.https(Environment.baseUrl, Environment.updateKategori);
    var response = await http.post(url, body: {
      'id_kategori': idKategori,
      'judul': judul,
      'username': username,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  @override
  Future<List<Kategori>> getKategori({String? username}) async {
    var url = Uri.https(Environment.baseUrl, Environment.getAllKategori);
    var response = await http.post(url, body: {'username': username});
    log(response.body.toString());
    if (response.statusCode != 200) {
      throw Error(
          statusCode: response.statusCode, message: response.body.toString());
    }
    var responseBody = await jsonDecode(response.body);
    var rawList = responseBody['data'] as List;
    List<Kategori> result = [];
    for (int i = 0; i < rawList.length; i++) {
      result.add(Kategori.parseFromResponse(rawList[i]));
    }
    return result;
  }
}