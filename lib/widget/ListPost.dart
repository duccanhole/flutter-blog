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
      required this.onFilter});
  final Function onPrev;
  final Function onNext;
  final Function onFilter;
  final String title;
  final List<IPost> listData;

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
        Text(widget.title, style: Theme.of(context).textTheme.headline1),
        SizedBox(
          width: 150,
          child: DropdownButtonFormField(
              value: tagsValue,
              style: const TextStyle(color: Colors.blueGrey),
              decoration: const InputDecoration(
                labelText: "Tags",
                labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(28, 31, 38, 1)),
                ),
                border: OutlineInputBorder(),
              ),
              items: tagsList
                  .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (String? value) {
                widget.onFilter(value);
              }),
        ),
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
