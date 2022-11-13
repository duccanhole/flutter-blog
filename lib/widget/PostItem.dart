import 'dart:ffi';

import 'package:app/interface/Post.interface.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});
  final IPost post;

  final Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  final Color backGround = const Color.fromRGBO(0, 0, 0, 0.9);
  final Color boderColor = const Color.fromRGBO(28, 31, 38, 1);

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
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
                          onPressed: null,
                          icon: Icon(Icons.save_alt_outlined, color: textWord))
                    ],
                  ),
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: textWord)))),
                      child: Text('Read',
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
