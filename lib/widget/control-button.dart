import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatefulWidget {
  const ControlButton(
      {Key? key, required this.hideTaskDone, required this.showAll})
      : super(key: key);

  final Function hideTaskDone;
  final Function showAll;

  @override
  State<ControlButton> createState() => ControlButtonState();
}

class ControlButtonState extends State<ControlButton> {
  List arr = [1, 1, 23, 333];
  @override
  Widget build(BuildContext context) {
    return Visibility(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => widget.hideTaskDone(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: const Text('Hide task done'),
        ),
        ElevatedButton(
          onPressed: () => widget.showAll(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          child: const Text('Show all'),
        ),
        ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
            child: const Text("Remove all"))
      ],
    ));
  }
}
