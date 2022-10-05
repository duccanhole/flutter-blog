import 'package:app/route/footer-bar.dart';
import 'package:app/route/header-bar.dart';
import 'package:app/route/statistic.dart';
import 'package:app/route/test-area.dart';
import 'package:flutter/material.dart';

import 'index.dart';

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
      home: const DScaffold(),
    );
  }
}

class DScaffold extends StatefulWidget {
  const DScaffold({super.key});

  @override
  State<StatefulWidget> createState() => DScaffoldState();
}

class DScaffoldState extends State<DScaffold> {
  int currIndex = 0;
  navigateRoute(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      body: IndexedStack(
        index: currIndex,
        children: const [IndexPage(), Statistic(), TestArea()],
      ),
      bottomNavigationBar:
          FooterBar(navigateRoute: navigateRoute, index: currIndex),
    );
  }
}
