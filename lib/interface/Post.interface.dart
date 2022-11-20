import 'package:flutter/foundation.dart';

class IPost {
  String title;
  String subtile;
  String url;
  int view;
  String tags;
  String id;
  DateTime createdAt;
  IPost(
      {required this.title,
      this.subtile = "",
      required this.id,
      required this.url,
      required this.view,
      required this.tags,
      required this.createdAt});
  factory IPost.fromJson(Map<String, dynamic> res) {
    return IPost(
        id: res['_id'],
        title: res['title'],
        url: res['url'],
        view: res['view'],
        tags: res['tags'],
        createdAt: DateTime.parse(res['createdAt']));
  }
}
