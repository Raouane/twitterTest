import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/API/Models/postModel.dart';

import 'package:twitter/API/fetchData.dart';
import 'package:twitter/pages/Create%20tweet/createtweet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchData _fetchData = FetchData();
  List<Postmodel> post = [];
  @override
  void initState() {
    super.initState();
    // _fetchData.fetchPosts().then((value) {
    //   post.addAll(value);
    //   print(value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTweet(),
            ),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.red[400],
      ),
      appBar: AppBar(
        title: Icon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
          size: 35,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.auto_awesome),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: _fetchData.fetchPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Postmodel> posts = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case ConnectionState.none:
                          return Center(
                            child: Text('erreur connection'),
                          );
                          break;
                        case ConnectionState.active:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case ConnectionState.done:
                          return Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  itemCount: posts.length,
                                  itemBuilder: (context, index) => Tweetcard(
                                      descriptions: posts[index].descriptions,
                                      image: posts[index].image)),
                            ),
                          );
                          break;
                      }
                    } else if (snapshot.hasError) {
                      return Text('nodata**********');
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Tweetcard extends StatelessWidget {
  final String image, descriptions, profileimage;
  const Tweetcard({
    Key key,
    @required this.descriptions,
    @required this.image,
    this.profileimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Text(' mohamedraouane mohamedraouane mohamedraouane mohamed'),
            Column(
              children: [
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
                Wrap(
                  children: [Text(descriptions)],
                )
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Container(
                height: 60,
                child: Wrap(
                  children: [Text(descriptions)],
                )),
          ],
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
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
      ],
    );
  }
}
