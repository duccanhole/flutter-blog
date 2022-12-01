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
  int skip = 10;
  QuerySearch q = QuerySearch(sortBy: 'view');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts = PostApi().getList(q);
  }

  onPrev() {
    if (skip == 0) return;
    skip -= 10;
    q.skip = skip.toString();
    setState(() {
      posts = PostApi().getList(q);
    });
  }

  onNext() {
    skip += 10;
    q.skip = skip.toString();
    setState(() {
      posts = PostApi().getList(q);
    });
  }

  onFilter(String tagsValue) {
    if (tagsValue.isNotEmpty) {
      q.filterBy = tagsValue == "All" ? "" : tagsValue;
      setState(() {
        posts = PostApi().getList(q);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IPost>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListPostWidget(
                listData: snapshot.data ?? [],
                title: "Popular",
                onPrev: onPrev,
                onNext: onNext,
                onFilter: onFilter);
          }
          return const Center(
            child: Text("loading ...", style: TextStyle(color: Colors.white)),
          );
        });
  }
}
