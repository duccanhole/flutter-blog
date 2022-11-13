import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nav {
  String? text;
  IconData? icon;

  Nav({this.text, this.icon});
}

class ListDrawer extends StatefulWidget {
  const ListDrawer({super.key, required this.onNavAction});
  final Function onNavAction;

  @override
  State<ListDrawer> createState() => ListDrawerSate();
}

class ListDrawerSate extends State<ListDrawer> {
  Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  late Future<String> userName;
  late Future<String> token;
  List<Nav> navigators = [
    Nav(text: "Post saved", icon: Icons.mark_as_unread),
    Nav(text: "Post posted", icon: Icons.file_upload)
  ];

  get builder => null;
  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userName") ?? "guest";
  }

  Future<String> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  String getCharFromName(String name) {
    List<String> nameArr = name.split(" ");
    String lastName = nameArr[nameArr.length - 1];
    return lastName[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName = getUserName();
    token = getUserToken();
    token.then((value) => {
          if (value == '')
            {
              setState(() {
                navigators.add(Nav(text: 'Sign in', icon: Icons.login));
              })
            }
          else
            {
              setState(() {
                navigators.add(Nav(text: 'Sign out', icon: Icons.logout));
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: FutureBuilder(
            future: userName,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              }
              return const Text("loading ...");
            },
          ),
          accountEmail: null,
          currentAccountPicture: CircleAvatar(
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 90,
              child: FutureBuilder(
                future: userName,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(getCharFromName(snapshot.data.toString()),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold));
                  }
                  return const Text("...",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold));
                }),
              ),
            ),
          ),
        ),
        ...navigators
            .map(
              (e) => ListTile(
                title: Text(e.text ?? "",
                    style: TextStyle(
                      color: textWord,
                    )),
                leading: Icon(
                  e.icon,
                  color: textWord,
                ),
                onTap: widget.onNavAction(e.text)
              ),
            )
            .toList()
      ],
    );
  }
}
