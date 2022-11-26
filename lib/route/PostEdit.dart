import 'dart:convert';
import 'dart:ui';

import 'package:app/api/post/index.dart';
import 'package:app/interface/Post.interface.dart';
import 'package:app/layout/LayoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostEditPage extends StatefulWidget {
  const PostEditPage(
      {super.key,
      this.isEdit = false,
      this.id = '',
      this.title = '',
      this.subtitle = '',
      this.url = '',
      this.tags = ''});
  final bool isEdit;
  final String id, title, subtitle, url, tags;

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
  InputDecoration inputStyle(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blueGrey),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey),
      ),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController postTitle = TextEditingController(text: widget.title),
        postSubtitle = TextEditingController(text: widget.subtitle),
        postUrl = TextEditingController(text: widget.url);
    String postTags = widget.tags == '' ? "Other" : widget.tags;
    bool loading = false;

    bool checkRequire(String value) {
      return !(value.trim() == "");
    }

    bool checkUrl(String value) {
      return Uri.parse(value).isAbsolute;
    }

    void goBack() {
      Navigator.pop(context);
    }

    void showMessage(String mess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mess)));
    }

    void onSave() async {
      if (formKey.currentState!.validate()) {
        setState(() {
          loading = true;
        });
        Response? res = await PostApi().createPost(
            postTitle.text, postSubtitle.text, postTags, postUrl.text);
        if (res!.statusCode >= 200 && res.statusCode <= 299) {
          showMessage("Success");
          goBack();
        } else {
          showMessage("Error, please try again.");
        }
        setState(() {
          loading = false;
        });
      }
    }

    return LayoutWidget(
        child: Center(
            child: Column(
      children: [
        Text(widget.isEdit ? 'Edit post' : 'Create Post',
            style: const TextStyle(color: Colors.blueGrey, fontSize: 24)),
        const SizedBox(height: 15),
        Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: postTitle,
                  style: const TextStyle(color: Colors.blueGrey),
                  decoration: inputStyle('Title*'),
                  validator: (value) {
                    if (!checkRequire(value!)) return 'Required';
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: postSubtitle,
                  style: const TextStyle(color: Colors.blueGrey),
                  decoration: inputStyle('Subtitle'),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: postUrl,
                  style: const TextStyle(color: Colors.blueGrey),
                  decoration: inputStyle('Link*'),
                  validator: (value) {
                    if (!checkRequire(value!)) return 'Required';
                    if (!checkUrl(value)) return 'Link is invalid';
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                    value: postTags,
                    style: const TextStyle(color: Colors.blueGrey),
                    decoration: inputStyle('Tags*'),
                    isExpanded: true,
                    items: tagsList
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (String? value) {
                      postTags = value!.toString();
                    }),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey)),
                        onPressed: goBack,
                        child: const Text('Cancel')),
                    Row(
                      children: [
                        if (widget.isEdit)
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.red)),
                              onPressed: () {},
                              child: const Text('Delete')),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => widget.isEdit
                                        ? Colors.blue
                                        : Colors.green)),
                            onPressed: loading ? null : onSave,
                            child: Text(widget.isEdit ? 'Save' : 'Create'))
                      ],
                    )
                  ],
                )
              ],
            )),
      ],
    )));
  }
}
