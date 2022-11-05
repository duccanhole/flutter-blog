import 'package:app/api/post/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:app/route/PostPage.dart';
import 'package:app/widget/ListDrawer.dart';
import 'package:app/widget/PostItem.dart';
import 'package:flutter/material.dart';

import 'InfoPost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  Color backGround = const Color.fromRGBO(0, 0, 0, 0.9);
  Color boderColor = const Color.fromRGBO(28, 31, 38, 1);

  TextEditingController headingCotroller = TextEditingController();
  List<IPost> posts = [
    IPost(
        title: "test1",
        url: "",
        view: 0,
        tags: "#funny",
        createdAt: DateTime.now())
  ];
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    await new PostApi().getList(new QuerySearch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textWord),
          ),
        ),
        backgroundColor: backGround,
        shape: Border(
            bottom: BorderSide(
          color: boderColor,
          width: 4,
        )),
        elevation: 4,
      ),
      drawer: Drawer(
        backgroundColor: backGround,
        child: ListDrawer(),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: posts.map((e) => PossItem(post: e)).toList(),
        ),
      ),
    );
  }

  void PostPagetonextScreen(BuildContext context, InfoPost post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostPage(
          LinkofUser: post.LinkofUser,
          ImagePost: post.ImagePost,
          DateTimeUpdate: post.DateTimeUpdate,
          HeadingPost: post.HeadingPost,
        ),
      ),
    );
  }
}
