import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter/constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:twitter/main.dart';
import 'package:twitter/pages/BottomNavBar/bottomNavbar.dart';

class CreateTweet extends StatefulWidget {
  @override
  _CreateTweetState createState() => _CreateTweetState();
}

class _CreateTweetState extends State<CreateTweet> {
  TextEditingController tweetController = TextEditingController();
  Response response;
  final String myId = prefs.getString('myId');

  File image;
  final piker = ImagePicker();
  Future getImage() async {
    final filePiked = await piker.getImage(source: ImageSource.camera);
    setState(() {
      if (filePiked != null) {
        image = File(filePiked.path);
      } else {
        print('no file**********');
      }
    });
  }

  @override
  void dispose() {
    tweetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //start appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
              onPressed: () async {
                var headers = {
                  "Authorization": "Bearer " + prefs.get('token'),
                  "Accept": "application/json"
                };

                Dio dio = Dio();
                response = await dio.post(POSTS_URL,
                    data: await addPostData(image, tweetController.text),
                    options: Options(headers: headers));
                print(response.data);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBar(),
                  ),
                );
              },
              child: Container(
                // height: 25,
                // width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                child: Text(
                  'tweet',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
        leading: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavBar(),
              ),
            );
          },
          child: Icon(Icons.close),
        ),
      ),
      //end of appbar
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1513097847644-f00cfe868607?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZyZWUlMjBwZW9wbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 100,
                width: 300,
                child: TextFormField(
                  controller: tweetController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'enter your message'),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: getImage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('choose image'),
                SizedBox(
                  width: 80,
                ),
                Icon(
                  Icons.image,
                  size: 50,
                ),
              ],
            ),
          ),
          image == null
              ? Container()
              : Container(
                  height: 200,
                  width: 200,
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
                )
        ],
      ),
    );
  }

  Future<FormData> addPostData(File image, String tweetDescriptions) async {
    var formdata = FormData();
    formdata.fields.add(MapEntry("data",
        '{"descriptions":"$tweetDescriptions","users_permissions_user":"$myId"}'));
    print(formdata);
    if (image != null) {
      formdata.files.add(MapEntry("files.image",
          await MultipartFile.fromFile(image.path, filename: "tweet.png")));
    }
    return formdata;
  }

  // Future<FormData> addPostData(File image, String tweetDescription) async {
  //   var formData = FormData();
  //   formData.fields
  //       .add(MapEntry("data", '{"description":"$tweetDescription" }'));
  //   if (_image != null) {
  //     formData.files.add(MapEntry("files.image",
  //         await MultipartFile.fromFile(image.path, filename: "tweet.png")));
  //   }

  //   return formData;
  // }
}
