import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ingatkan/core/constants/environment.dart';
import 'package:ingatkan/core/error/error.dart';
import 'package:ingatkan/core/global/profile_data.dart';
import 'package:ingatkan/features/authentication/model/profile.dart';

abstract class ProfileRemoteDataSources {
  Future<Profile> editProfile({String? username, String? password, String? name, String? phone, String? email});
  Future<void> editTheme({String? id = '0', String? username});
}

class ProfileRemoteDataSourcesImpl implements ProfileRemoteDataSources {
  @override
  Future<Profile> editProfile({String? username, String? password, String? name, String? phone, String? email}) async {
    var url = Uri.https(Environment.baseUrl, Environment.editProfileUrl);
    var response = await http.post(url,
        body: {'username': username ?? '',
          'password': password ?? '',
          'email': email ?? '',
          'phone_number': phone ?? '',
          'name': name ?? '',
        }).timeout(const Duration(seconds: 10));

    if(response.statusCode == 200){
      log('status kode 200');
      var url = Uri.https(Environment.baseUrl, Environment.loginUrl);
      var response = await http.post(url,
          body: {'username': username ?? '',
            'password': password ?? '',
          });
      var responseBody = await jsonDecode(response.body);
      return Profile.fromJson(responseBody['data']);
    } else {
      throw Error(statusCode: response.statusCode, message: "Password Tidak Sesuai");
    }

  }

  @override
  Future<void> editTheme({String? id = '0', String? username}) async {
    var url = Uri.https(Environment.baseUrl, Environment.editTheme);
    var response = await http.post(url,
        body: {'username': username ?? '',
          'theme': id,
        }).timeout(const Duration(seconds: 10));
    log(response.body.toString());
  }
}