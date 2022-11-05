import 'dart:convert';

import 'package:app/api/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:http/http.dart' as http;

class QuerySearch {
  String skip;
  String limit;
  String sortBy;
  QuerySearch({this.limit = '10', this.skip = '0', this.sortBy = ""});
}

class PostApi {
  Future<List<IPost>> getList(QuerySearch q) async {
    final query = {"skip": q.skip, "limit": q.limit, "sortBy": q.sortBy};
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
}
