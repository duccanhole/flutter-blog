import 'package:app/api/post/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:app/interface/PostDetail.interface.dart';
import 'package:app/layout/LayoutWidget.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key, required this.post, this.canEdit = false});
  final IPost post;
  final bool canEdit;

  @override
  State<PostDetailPage> createState() => PostDetailPageState();
}

class PostDetailPageState extends State<PostDetailPage> {
  late Future<IPostDetail> postDetail;
  @override
  void initState() {
    // TODO: implement initState
    postDetail = PostApi().getPostDetail(widget.post.id);
    Map data = {
      "view": widget.post.view + 1,
    };
    PostApi().updatePost(widget.post.id, data);
  }

  String getCharFromName(String name) {
    List<String> nameArr = name.split(" ");
    if (nameArr.isEmpty) {
      return "?";
    }
    String lastName = nameArr[nameArr.length - 1];
    if (lastName.isEmpty) {
      return "?";
    }
    return lastName[0].toUpperCase();
  }

  String formatDate(DateTime date) {
    return 'create at ${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
        child: FutureBuilder<IPostDetail>(
      future: postDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          IPostDetail? postDetailData = snapshot.data;
          return Column(
            children: [
              ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child:
                          Text(getCharFromName(postDetailData!.user.userName))),
                  title: Text(postDetailData.user.userName,
                      style: Theme.of(context).textTheme.headline1),
                  subtitle: Text(formatDate(postDetailData.post.createdAt),
                      style: Theme.of(context).textTheme.subtitle1),
                  trailing: widget.canEdit
                      ? TextButton(
                          onPressed: (() {}),
                          child: const Icon(Icons.edit, color: Colors.blueGrey))
                      : null),
              Text(postDetailData.post.title,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 25,
              ),
              if (postDetailData.post.subtile.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    postDetailData.post.subtile,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("tags: #${postDetailData.post.tags}",
                      style: const TextStyle(
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: 12))),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.link), Text("Go to link")],
                    )),
              )
            ],
          );
        }
        return const Center(
          child: Text("loading ..."),
        );
      },
    ));
  }
}
