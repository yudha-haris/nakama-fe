import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/features/authentication/model/profile.dart';

abstract class AuthenticationRemoteDataSources {
  Future<Profile> login({String? username, String? password});
  Future<bool> register({String? username, String? password, String? name, String? phone, String? email});
}

class AuthenticationRemoteDataSourcesImpl implements AuthenticationRemoteDataSources {
  @override
  Future<Profile> login({String? username, String? password}) async {
    var url = Uri.https(Environment.baseUrl, Environment.loginUrl);
    var response = await http.post(url, body: {'username': username ?? '', 'password': password ?? ''});
    if(response.statusCode == 401){
      throw Error(statusCode: response.statusCode, message: "Password tidak sesuai");
    }
    var responseBody = await jsonDecode(response.body);
    return Profile.fromJson(responseBody['data']);
  }

  @override
  Future<bool> register({String? username, String? password, String? name, String? phone, String? email}) async {
    var url = Uri.http(Environment.baseUrl, Environment.loginUrl);
    var response = await http.post(url,
        body: {'username': username ?? '',
          'password': password ?? '',
          'email': email ?? '',
          'phone_number': phone ?? '',
          'name': name ?? '',
          'theme': false,
        }).timeout(const Duration(seconds: 10));
    if(response.statusCode == 401){
      throw Error(statusCode: response.statusCode, message: "Username sudah tersedia");
    } else if(response.statusCode == 200){
      return true;
    }
    return false;
  }

}