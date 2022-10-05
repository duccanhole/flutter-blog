import 'dart:io';

import 'package:app/widget/webview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Rules {
  String? required(String val) {
    if (val.isEmpty) return "required";
    return null;
  }

  String? minLength(String val, int length) {
    if (val.length <= length) return "min length is $length";
    return null;
  }

  String? maxLength(String val, int length) {
    if (val.length > length) return "max length is $length";
    return null;
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => TestWidgetState();
}

class TestWidgetState extends State<StatefulWidget> {
  final textField1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textField1,
          onSubmitted: (value) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WebviewWidget(url: value)));
          },
        )
      ],
    );
  }
}
