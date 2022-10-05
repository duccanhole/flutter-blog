import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({super.key, required this.navigateRoute, required this.index});

  final Function navigateRoute;
  final int index;

  @override
  State<StatefulWidget> createState() => FooterBarState();
}

class FooterBarState extends State<FooterBar> {

  // navigateRoute(int index) {
  //   Navigator.of(context).pushNamed(routes[index]);
  //   setState(() {
  //     currIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.area_chart), label: "Statistic"),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: "Test area(beta)")
        ],
        currentIndex: widget.index,
        selectedItemColor: Colors.white70,
        backgroundColor: Colors.black38,
        onTap: (value) {
          widget.navigateRoute(value);
        });
  }
}
