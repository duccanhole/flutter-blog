import 'package:flutter/foundation.dart';

class IPost {
  String title;
  String subtile;
  String url;
  int view;
  String tags;
  DateTime createdAt;
  IPost(
      {required this.title,
      this.subtile = "",
      required this.url,
      required this.view,
      required this.tags,
      required this.createdAt});
  factory IPost.fromJson(Map<String, dynamic> res) {
    return IPost(
        title: res['title'],
        url: res['url'],
        view: res['view'],
        tags: res['tags'],
        createdAt: res['createdAt']);
  }
}
