import 'package:app/route/PostPage.dart';
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
  List post = [
    InfoPost(
        LinkofUser: "LinkofUser",
        HeadingPost: "Heading Post A",
        DateTimeUpdate: "Date Time Update A",
        ImagePost: "https://images3.alphacoders.com/100/thumbbig-1003152.webp"),
    InfoPost(
        LinkofUser: "LinkofUser",
        HeadingPost: "Heading Post B",
        DateTimeUpdate: "Date Time Update B",
        ImagePost: "https://images7.alphacoders.com/100/thumbbig-1004011.webp"),
    InfoPost(
        LinkofUser: "LinkofUser",
        HeadingPost: "Heading Post C",
        DateTimeUpdate: "Date Time Update C",
        ImagePost: "https://images6.alphacoders.com/123/thumbbig-1234255.webp"),
  ];
  @override
  // TODO: implement widget
  Widget Post(InfoPost post) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 360,
          decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(width: 3, color: boderColor),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://i.pinimg.com/564x/c7/3a/bd/c73abd9401a025ecc067cbda14baee6f.jpg",
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    ElevatedButton(
                        onPressed: () => null,
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        child: const Text(
                          "Read article",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: textWord,
                  ),
                  onPressed: () => null,
                ),
              ),
              Text(
                post.HeadingPost,
                maxLines: 3,
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                post.DateTimeUpdate,
                style: TextStyle(fontSize: 15, color: textWord),
              ),
              InkWell(
                child: Container(
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                          image: NetworkImage(post.ImagePost),
                          fit: BoxFit.cover)),
                ),
                onTap: () => PostPagetonextScreen(context(), post),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: textWord,
                      ),
                      onPressed: () => null,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.comment,
                        color: textWord,
                      ),
                      onPressed: () => null,
                    ),
                    IconButton(
                      icon: Icon(Icons.share, color: textWord),
                      onPressed: () => null,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
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
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("DUC-Sama"),
              accountEmail: const Text("lexuanduc147@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://i.pinimg.com/564x/c7/3a/bd/c73abd9401a025ecc067cbda14baee6f.jpg",
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://media.muanhatructuyen.vn/post/221/3/hinh-nen-may-trang-sao-ngo-nghinh.jpg"))),
            ),
            ListTile(
              title: Text("Popular",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.local_fire_department,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Most upvoted",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.file_upload_rounded,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Best discussions",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.chat,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Submit article",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.insert_link_outlined,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Reading historry",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.remove_red_eye_outlined,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Customize",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.settings,
                color: textWord,
              ),
              onTap: () => null,
            ),
            SizedBox(
              height: 150,
            ),
            ListTile(
              title: Text("Docs",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.text_snippet,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Changelog",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.price_change,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("Feedback",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.feedback,
                color: textWord,
              ),
              onTap: () => null,
            ),
            ListTile(
              title: Text("invite people",
                  style: TextStyle(
                    color: textWord,
                  )),
              leading: Icon(
                Icons.people,
                color: textWord,
              ),
              onTap: () => null,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            for (var i = 0; i < 3; i++) Post(post[i]),
          ],
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
