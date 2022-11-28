import 'package:app/api/post/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/ListPost.dart';

class PostSavedPage extends StatefulWidget {
  const PostSavedPage({super.key});

  @override
  State<StatefulWidget> createState() => PostSavedState();
}

class PostSavedState extends State<PostSavedPage> {
  Future<List<IPost>>? posts;
  late Future<String> userId;
  QuerySearch q = QuerySearch();
  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId") ?? "";
  }

  onPrev() {}
  onNext() {}
  onFilter() {}
  @override
  void initState() {
    super.initState();
    userId = getUserId();
    userId.then((value) {
      if (value.isNotEmpty) {
        posts = PostApi().getListSaved(q, value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<IPost>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListPostWidget(
                listData: snapshot.data ?? [],
                title: "Post saved",
                onPrev: onPrev,
                onNext: onNext,
                onFilter: onFilter,
                isSaved: true);
          }
          return const Center(
            child: Text("loading ...", style: TextStyle(color: Colors.white)),
          );
        });
  }
}
