import 'package:app/route/Home.dart';
import 'package:app/route/PostEdit.dart';
import 'package:app/route/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              headline1: TextStyle(
                  color: Color.fromRGBO(168, 179, 207, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              subtitle1: TextStyle(
                  color: Color.fromRGBO(168, 179, 207, 1), fontSize: 14),
              bodyText1: TextStyle(
                  color: Color.fromRGBO(168, 179, 207, 1), fontSize: 16))),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const IndexPage(),
      //   '/statistic': (context) => const Statistic()
      // },
      home: const ControllView(),
    );
  }
}

class ControllView extends StatefulWidget {
  const ControllView({super.key});

  @override
  State<StatefulWidget> createState() => ControllViewState();
}

class ControllViewState extends State<ControllView> {
  Color boderColor = const Color.fromRGBO(28, 31, 38, 1);
  int currIndex = 0;
  onNavAction(String data) async {
    switch (data) {
      case 'Sign in':
      case 'Sign out':
        logOut();
        break;
      case 'Create post':
        createPost();
        break;
      default:
    }
  }

  createPost() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    if (token == "") {
      return showDialog(
          context: context(),
          barrierDismissible: true,
          builder: ((context) => AlertDialog(
                title: const Text("Alert"),
                content: const Text("Please login to continue."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              )));
    } else {
      Navigator.of(context())
          .push(MaterialPageRoute(builder: (context) => const PostEditPage()));
    }
  }

  logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "");
    prefs.setString("userName", "guest");
    prefs.setString("userId", "");
    Navigator.of(context())
        .push(MaterialPageRoute(builder: (context) => const SignInPage()));
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
        children: const [Home()],
      ),
    );
  }
}
