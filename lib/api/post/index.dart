import 'dart:convert';

import 'package:app/api/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:app/interface/PostDetail.interface.dart';
import 'package:app/interface/User.interface.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuerySearch {
  String skip;
  String limit;
  String sortBy;
  String filterBy;
  QuerySearch(
      {this.limit = '10',
      this.skip = '0',
      this.sortBy = "view",
      this.filterBy = ""});
}

class PostApi {
  Future<List<IPost>> getList(QuerySearch q) async {
    final query = {
      "skip": q.skip,
      "limit": q.limit,
      "sortBy": q.sortBy,
      "filterBy": q.filterBy
    };
    final uri = Uri.https(rootUrl, "post", query);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List resData = jsonDecode(response.body)['results'];
      return resData.map((e) => IPost.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load from server');
    }
  }

  Future<IPostDetail> getPostDetail(String id) async {
    final uri = Uri.http(rootUrl, "post/$id");
    final res = await http.get(uri);
    if (res.statusCode == 200 || res.statusCode == 201) {
      final resData = json.decode(res.body)["results"];
      return IPostDetail(
          post: IPost.fromJson(resData),
          user: IUser.fromJson(resData["createdBy"]));
    } else {
      throw Exception("Error to fetch.");
    }
  }

  Future<http.Response?> createPost(
      String title, String subtitle, String tags, String link) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    String? token = prefs.getString("token");
    if (userId!.isNotEmpty && token!.isNotEmpty) {
      try {
        return http.post(Uri.http(rootUrl, "post/create"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'token': token
            },
            body: json.encode({
              'title': title,
              'subtitle': subtitle,
              'url': link,
              'tags': tags,
              'userId': userId
            }));
      } catch (e) {
        throw Exception(e);
      }
    }
    return null;
  }

  Future<http.Response?> updatePost(String id, Map data) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    String? token = prefs.getString("token");
    if (userId!.isNotEmpty && token!.isNotEmpty) {
      try {
        final res = await http.put(Uri.https(rootUrl, "post/$id"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'token': token
            },
            body: json.encode(data));
        return res;
      } catch (e) {
        throw Exception(e);
      }
    }
    return null;
  }
}
