import 'package:app/interface/Post.interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostEditPage extends StatefulWidget {
  const PostEditPage({super.key, this.isEdit = false});
  final bool isEdit;

  @override
  State<PostEditPage> createState() => PostEditPageState();
}

class PostEditPageState extends State<PostEditPage> {
  final formKey = GlobalKey<FormState>();
  List<String> tagsList = const [
    'News',
    'Health - Beauty',
    'Education',
    'Sience - Technology',
    'Entertaiment',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
              child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.blueGrey),
                        decoration: const InputDecoration(
                          labelText: "Title*",
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueGrey),
                        decoration: const InputDecoration(
                          labelText: "Subtitle",
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueGrey),
                        decoration: const InputDecoration(
                          labelText: "Link",
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              labelText: "Tags",
                              labelStyle: TextStyle(color: Colors.blueGrey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                              ),
                              border: OutlineInputBorder()),
                          isExpanded: true,
                          items: tagsList
                              .map<DropdownMenuItem<String>>((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: ((value) {})),
                      Row(
                        children: [
                          
                        ],
                      )
                    ],
                  )),
            ],
          )),
        ));
  }
}
