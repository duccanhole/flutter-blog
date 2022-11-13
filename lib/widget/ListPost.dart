import 'package:app/interface/Post.interface.dart';
import 'package:app/widget/PostItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListPostWidget extends StatefulWidget {
  const ListPostWidget({super.key, this.title = "", required this.listData});
  final String title;
  final List<IPost> listData;

  @override
  State<ListPostWidget> createState() => ListPostWidgetState();
}

class ListPostWidgetState extends State<ListPostWidget> {
  @override
  Widget build(Object context) {
    return ListView(
      children: [
        Text(widget.title, style: TextStyle(color: Colors.white)),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.listData.length,
            itemBuilder: (context, index) =>
                PostItem(post: widget.listData[index])),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: null, child: Text("Previous")),
            ElevatedButton(onPressed: null, child: Text("Next"))
          ],
        )
      ],
    );
  }
}
