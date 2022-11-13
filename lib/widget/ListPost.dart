import 'package:app/interface/Post.interface.dart';
import 'package:app/widget/PostItem.dart';
import 'package:flutter/material.dart';

class ListPostWidget extends StatefulWidget {
  const ListPostWidget(
      {super.key,
      this.title = "",
      required this.listData,
      required this.onPrev,
      required this.onNext});
  final Function onPrev;
  final Function onNext;
  final String title;
  final List<IPost> listData;

  @override
  State<ListPostWidget> createState() => ListPostWidgetState();
}

class ListPostWidgetState extends State<ListPostWidget> {
  Color btnColor = const Color.fromRGBO(168, 179, 207, 1);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(15),
            child: Text(widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 20))),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.listData.length,
            itemBuilder: (context, index) =>
                PostItem(post: widget.listData[index])),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: (() {
                  widget.onPrev();
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).backgroundColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: btnColor)))),
                child: Text(
                  "Previous",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            ElevatedButton(
                onPressed: (() {
                  widget.onNext();
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).backgroundColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: btnColor)))),
                child: Text(
                  "Next",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          ],
        )
      ],
    );
  }
}
