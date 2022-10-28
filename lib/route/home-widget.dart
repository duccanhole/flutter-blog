import 'package:app/route/SignInPage.dart';
import 'package:app/route/header-bar.dart';
import 'package:app/route/test-area.dart';
import 'package:flutter/material.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do list app',
      theme: ThemeData(primaryColor: Colors.pink, primarySwatch: Colors.blue),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const IndexPage(),
      //   '/statistic': (context) => const Statistic()
      // },
      home: const SignInPage(),
    );
  }
}
