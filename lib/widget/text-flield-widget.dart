import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, this.emitTask});

  final emitTask;
  @override
  State<TextFieldWidget> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  final textController = TextEditingController();
  void submit(String value) {
    widget.emitTask(value);
    textController.text = '';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: const EdgeInsets.only(bottom: 5),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Enter new task'),
          onSubmitted:(value) => submit(value),       
        ));
  }
}
