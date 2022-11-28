import 'package:app/api/post/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:app/route/PostDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostItem extends StatelessWidget {
  const PostItem(
      {super.key,
      required this.post,
      this.isSaved = false,
      this.canEdit = false});
  final IPost post;
  final bool isSaved;
  final bool canEdit;

  final Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  final Color backGround = const Color.fromRGBO(0, 0, 0, 0.9);
  final Color boderColor = const Color.fromRGBO(28, 31, 38, 1);

  viewDetail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PostDetailPage(post: post, canEdit: canEdit)));
  }

  showDialogMessage(String message, BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: ((context) => AlertDialog(
              title: const Text("Alert"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ],
            )));
  }

  onSave(BuildContext context, String postId) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? userId = prefs.getString("userId");
    if (token!.isEmpty || userId!.isEmpty) {
      return showDialogMessage("Please login.", context);
    }
    if (isSaved) {
      Response? res = await PostApi().unsavePost(userId, postId);
      if (res!.statusCode == 200 || res.statusCode == 201) {
        showDialogMessage("Post is unsaved.", context);
      }
    } else {
      Map data = {
        "userId": userId,
        "postId": postId,
      };
      Response? res = await PostApi().savePost(data);
      if (res!.statusCode == 200 || res.statusCode == 201) {
        showDialogMessage("Post is saved.", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(width: 3, color: boderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(post.title,
                    style: Theme.of(context).textTheme.headline1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('#${post.tags}',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye, color: textWord),
                      Text(
                        post.view.toString(),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      IconButton(
                          onPressed: () {
                            onSave(context, post.id);
                          },
                          icon: Icon(
                              isSaved ? Icons.close : Icons.save_alt_outlined,
                              color: textWord)),
                      Text(
                        isSaved ? 'Unsave' : 'Save',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        viewDetail(context);
                      },
                      child: Text("Read",
                          style: Theme.of(context).textTheme.subtitle1))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
