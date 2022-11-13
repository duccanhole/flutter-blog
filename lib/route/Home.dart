import 'package:app/api/post/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:app/widget/ListPost.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<IPost>> posts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts = PostApi().getList(QuerySearch());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IPost>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListPostWidget(listData: snapshot.data ?? [], title: "Home");
          }
          return const Text("loading ...", style: TextStyle(color: Colors.white));
        });
  }
}
