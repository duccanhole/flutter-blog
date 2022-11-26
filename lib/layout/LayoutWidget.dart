import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
