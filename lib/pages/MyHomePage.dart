import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/pages/LoginPage/login.dart';
import 'package:twitter/pages/RegisterPage/register.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'twitter',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: 150,
              child: Text(
                'raouane  see whats happening in the body right now mohamed',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '     Login\n to twitter',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Icon(Icons.forward),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Create a new\n    account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.1)),
                          child: Icon(Icons.forward),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
