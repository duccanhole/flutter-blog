import 'package:app/api/index.dart';
import 'package:http/http.dart' as http;

class PostApi {
  Future getList() async{
    return await http.get(Uri.parse(rootUrl));
  }
}