import 'package:app/widget/test.dart';
import 'package:flutter/cupertino.dart';

class TestArea extends StatefulWidget {
  const TestArea({super.key});

  @override
  State<StatefulWidget> createState() => TestAreaState();
}

class TestAreaState extends State<TestArea> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TestWidget(),
    );
  }
}
