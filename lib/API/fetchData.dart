import 'dart:convert';

import 'package:twitter/API/Models/meModel.dart';
import 'package:twitter/API/Models/postModel.dart';
import 'package:http/http.dart' as http;
import 'package:twitter/API/Models/userModel.dart';
import 'package:twitter/constants.dart';
import 'package:twitter/main.dart';

// static Future<List<Postmodel>> fetchPostsOld() async {
//   var headers = {"Authorization": "Bearer" + prefs.get('token')};
//   http.Response response = await http.get(POSTS_URL, headers: headers);
//   print(response);
//   print('okok');

//   if (response.statusCode == 200) {
//     print(response.body);
//     var body = jsonDecode(response.body).cast<Map<String, dynamic>>();
//     return body.map<Postmodel>((item) => Postmodel.fromJson(item)).toList();
//     // List<Postmodel> posts = [];
//     // for (var post in body) {
//     // posts.add(Postmodel.fromJson(post));
//     // print(response.body);
//   } else {
//     throw Exception('nogood*********');
//   }
// }

Future<List<Postmodel>> fetchPosts() async {
  var headers = {
    "Authorization": "Bearer " + prefs.get('token'),
    "Accept": "application/json"
  };
  http.Response response = await http.get(POSTS_URL, headers: headers);
  //print(response.body);

  print(response.statusCode);
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print(body);
    List<Postmodel> newposts = [];

    for (var postone in body) {
      newposts.add(Postmodel.fromJson(postone));
      print(newposts);
    }

    return newposts;
  } else {
    print(response.statusCode);
  }
  return null;
}

Future<MeModel> fetchMyAcount() async {
  var headers = {
    "Authorization": "Bearer " + prefs.get('token'),
    "Accept": "application/json"
  };
  http.Response response = await http.get(MYACCOUNT_URL, headers: headers);

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);

    MeModel.fromJson(body);
  }
  return null;
}

Future<UserModel> fetchUserById(String id) async {
  var headers = {
    "Authorization": "Bearer " + prefs.get('token'),
    "Accept": "application/json"
  };

  http.Response response = await http.get(USERS_URL + id, headers: headers);

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);

    return UserModel.fromJson(body);
  }
  return null;
}
