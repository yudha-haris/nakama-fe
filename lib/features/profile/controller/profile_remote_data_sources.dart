import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/features/authentication/model/profile.dart';

abstract class ProfileRemoteDataSources {
  Future<Profile> editProfile({String? username, String? password, String? name, String? phone, String? email});
}

class ProfileRemoteDataSourcesImpl implements ProfileRemoteDataSources {
  @override
  Future<Profile> editProfile({String? username, String? password, String? name, String? phone, String? email}) async {
    var url = Uri.http(Environment.baseUrl, Environment.editProfileUrl);
    var response = await http.post(url,
        body: {'username': username ?? '',
          'password': password ?? '',
          'email': email ?? '',
          'phone_number': phone ?? '',
          'name': name ?? '',
          'theme': false,
        });

    if(response.statusCode == 200){
      var url = Uri.http(Environment.baseUrl, Environment.loginUrl);
      var response = await http.post(url,
          body: {'username': username ?? '',
            'password': password ?? '',
          });
      var responseBody = await jsonDecode(response.body);
      return Profile.fromJson(responseBody['data']);
    }
    throw Error(statusCode: response.statusCode, message: "Password Tidak Sesuai");

  }
  
}