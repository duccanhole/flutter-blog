import 'package:app/route/Home.dart';
import 'package:app/route/SignInPage.dart';
import 'package:flutter/material.dart';

import '../widget/ListDrawer.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do list app',
      theme: ThemeData(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.9),
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Color.fromRGBO(168, 179, 207, 1)))),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const IndexPage(),
      //   '/statistic': (context) => const Statistic()
      // },
      home: const SignInPage(),
    );
  }
}

class ControllView extends StatelessWidget {
  ControllView({super.key});
  Color boderColor = const Color.fromRGBO(28, 31, 38, 1);
  int currIndex = 0;
  onNavAction(String data) {
    print(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        shape: Border(
            bottom: BorderSide(
          color: boderColor,
          width: 4,
        )),
        elevation: 4,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: ListDrawer(onNavAction: onNavAction),
      ),
      body: IndexedStack(
        index: currIndex,
        children: const [Home(), Text("test")],
      ),
    );
  }
}
