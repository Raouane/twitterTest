import 'dart:convert';

import 'package:twitter/API/sharedPrefs.dart';
import 'package:twitter/constants.dart';
import 'package:flutter/material.dart';
import 'package:twitter/pages/BottomNavBar/bottomNavbar.dart';
import 'package:twitter/pages/HomePage/homePage.dart';
import 'package:twitter/pages/RegisterPage/CustomTextField.dart';
import 'package:twitter/pages/RegisterPage/register.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(hint: 'email', controller: email),
            CustomTextField(
              hint: 'password',
              controller: password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    loginAccount();
                  },
                  child: Text('Login'),
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 50,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('fogot passwowrd ?'),
                  color: Colors.amber,
                ),
              ],
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
              child: Text('dont have account?\ncreate account'),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Future loginAccount() async {
    // send data to api
    var response = await http.post(KLOGIN_URL, body: {
      // "username": password.text,
      "identifier": email.text,
      "password": password.text
    });
    if (response.statusCode == 200) {
      print('waaaaoouu****************');
      var body = jsonDecode(response.body);
      print(body['jwt']);
      var token = body['jwt'];
      var id = body['user']['id'];
      SharedPrefs.saveToken(token, id.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    } else {
      var body = jsonDecode(response.body);
      print(body);
      print('false*****************');
    }
  }
}
