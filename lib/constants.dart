import 'package:flutter/material.dart';
// colors application

final kprimarycolor = Colors.blue;
final ksecondcolor = Colors.white;
final kdarkcolor = Colors.black;
final klightcolor = Colors.yellow;

// api connection
// ignore: non_constant_identifier_names
final API_BASE_URL = 'http://10.0.2.2:1337';
// ignore: non_constant_identifier_names
final KREGISTER_URL = API_BASE_URL + '/auth/local/register';
// ignore: non_constant_identifier_names
final KLOGIN_URL = API_BASE_URL + '/auth/local/';
// ignore: non_constant_identifier_names
final POSTS_URL = API_BASE_URL + '/posts';
final MYACCOUNT_URL = API_BASE_URL + '/users/me';
final USERS_URL = API_BASE_URL + '/users/';
