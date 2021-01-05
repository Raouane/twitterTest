import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter/API/sharedPrefs.dart';
import 'package:twitter/constants.dart';
import 'package:twitter/pages/HomePage/homePage.dart';
import 'package:twitter/pages/RegisterPage/CustomTextField.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterPage'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hint: 'name',
              controller: name,
            ),
            CustomTextField(
              hint: 'email',
              controller: email,
            ),
            CustomTextField(
              hint: 'password',
              controller: password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () async {
                    registerAccount();
                  },
                  child: Text(
                    'Register',
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future registerAccount() async {
    // send data to api
    var response = await http.post(KREGISTER_URL, body: {
      "username": name.text,
      "email": email.text,
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
          builder: (context) => HomePage(),
        ),
      );
    } else {
      print('false*****************');
    }
  }
}
