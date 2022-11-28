import 'package:app/interface/Post.interface.dart';
import 'package:app/widget/PostItem.dart';
import 'package:flutter/material.dart';

class ListPostWidget extends StatefulWidget {
  const ListPostWidget(
      {super.key,
      this.title = "",
      required this.listData,
      required this.onPrev,
      required this.onNext,
      required this.onFilter,
      this.isSaved = false,
      this.canEdit = false});
  final Function onPrev, onNext, onFilter;
  final String title;
  final List<IPost> listData;
  final bool isSaved, canEdit;

  @override
  State<ListPostWidget> createState() => ListPostWidgetState();
}

class ListPostWidgetState extends State<ListPostWidget> {
  Color btnColor = const Color.fromRGBO(168, 179, 207, 1);
  List<String> tagsList = const [
    'All',
    'News',
    'Health - Beauty',
    'Education',
    'Sience - Technology',
    'Entertaiment',
    'Other'
  ];
  String tagsValue = "All";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.headline1),
            DropdownButton(
                value: tagsValue,
                items: tagsList
                    .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (String? value) {
                  tagsValue = value ?? "All";
                  widget.onFilter(value);
                }),
          ],
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.listData.length,
            itemBuilder: (context, index) => PostItem(
                post: widget.listData[index],
                isSaved: widget.isSaved,
                canEdit: widget.canEdit)),
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
