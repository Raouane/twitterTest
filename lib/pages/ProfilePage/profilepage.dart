import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/API/Models/postModel.dart';

import 'package:twitter/API/Models/userModel.dart';
import 'package:twitter/API/fetchData.dart';
import 'package:twitter/API/sharedPrefs.dart';
import 'package:twitter/constants.dart';
import 'package:twitter/main.dart';

import '../MyHomePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String myId = prefs.getString('myId');
  final UserModel myuser = UserModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile Page"),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: fetchUserById(myId),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                        ),
                      );
                      break;

                    case ConnectionState.none:
                      return Center(
                        child: Text("Error in Connection"),
                      );
                      break;

                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                        ),
                      );
                      break;

                    case ConnectionState.done:
                      UserModel myuser = snapshot.data;

                      return headerProfileCard(myuser);
                      break;
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget headerProfileCard(UserModel myuser) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                API_BASE_URL + myuser.bannar,
                fit: BoxFit.cover,
              ),
            ),
            Transform.translate(
              offset: Offset(10, 110),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // start profile image
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 5),
                        image: DecorationImage(
                            image: NetworkImage(API_BASE_URL + myuser.image),
                            fit: BoxFit.cover)),
                  ),

                  //end profile image
                  // start button
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'edit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(10, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'raouane',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '@gmailcom',
                    style: TextStyle(fontSize: 15),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      SharedPrefs.saveToken('', '');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.logout),
                    label: Text(
                      'Logout',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Tweetcard(
                descriptions: 'test descriptions',
                image:
                    'https://images.unsplash.com/photo-1608717361478-c13da3009b2c?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8cVBZc0R6dkpPWWN8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
      ],
    );
  }
}

class Tweetcard extends StatelessWidget {
  final String image, descriptions;
  const Tweetcard({
    @required this.descriptions,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                //start profile image

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // end profile image

                //start profile title
                Wrap(
                  children: [Text(descriptions)],
                )
                // end profile title
              ],
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        // start tweet image
        Container(
          height: 300,
          width: 390,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //end tweet image
        // start comment tweet
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.black.withOpacity(.2)),
          child: Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: Icon(FontAwesomeIcons.heart),
              ),
              Text('10'),
              SizedBox(
                width: 80,
              ),
              FlatButton(
                onPressed: () {},
                child: Icon(FontAwesomeIcons.comment),
              ),
              Text('100  comments')
            ],
          ),
        ),
        //end comment tweet
      ],
    );
  }
}
