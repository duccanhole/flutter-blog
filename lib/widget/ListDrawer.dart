import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nav {
  String? text;
  IconData? icon;

  Nav({this.text, this.icon});
}

class ListDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListDrawerSate();
}

class ListDrawerSate extends State<ListDrawer> {
  Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  List<Nav> navigators = [Nav(text: "Post saved", icon: Icons.mark_as_unread), Nav(text: "Post posted", icon: Icons.file_upload)];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("DUC-Sama"),
          accountEmail: const Text("lexuanduc147@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://i.pinimg.com/564x/c7/3a/bd/c73abd9401a025ecc067cbda14baee6f.jpg",
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
          ),
          decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://media.muanhatructuyen.vn/post/221/3/hinh-nen-may-trang-sao-ngo-nghinh.jpg"))),
        ),
        ...navigators.map(
          (e) => ListTile(
            title: Text(e.text ?? "",
                style: TextStyle(
                  color: textWord,
                )),
            leading: Icon(
              e.icon,
              color: textWord,
            ),
            onTap: () => null,
          ),
        ).toList()
      ],
    );
  }
}
