
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget with PreferredSizeWidget{
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("To-do list"),
      automaticallyImplyLeading: false,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50);
}