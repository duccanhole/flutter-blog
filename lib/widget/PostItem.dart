import 'package:app/interface/Post.interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  Color backGround = const Color.fromRGBO(0, 0, 0, 0.9);
  Color boderColor = const Color.fromRGBO(28, 31, 38, 1);

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }

  PostItem({super.key, required this.post});
  IPost post;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(width: 3, color: boderColor),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              ListTile(
                trailing: IconButton(
                  icon: Icon(
                    Icons.save_alt_outlined,
                    color: textWord,
                  ),
                  onPressed: () => null,
                ),
              ),
              Text(
                post.title,
                maxLines: 3,
                style: const TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "created at: ${formatDate(post.createdAt)}",
                style: TextStyle(fontSize: 16, color: textWord),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: textWord,
                      ),
                      onPressed: () => null,
                    ),
                    Text(post.view.toString(),
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
