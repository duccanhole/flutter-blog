
import 'package:app/interface/Post.interface.dart';
import 'package:app/interface/User.interface.dart';

class IPostDetail {
  final IPost post;
  final IUser user;
  IPostDetail({ required this.post, required this.user});
}