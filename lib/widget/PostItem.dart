import 'package:app/interface/Post.interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PossItem extends StatelessWidget {
  Color textWord = const Color.fromRGBO(168, 179, 207, 1);
  Color backGround = const Color.fromRGBO(0, 0, 0, 0.9);
  Color boderColor = const Color.fromRGBO(28, 31, 38, 1);

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }

  PossItem({super.key, required this.post});
  IPost post;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 360,
          decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(width: 3, color: boderColor),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://i.pinimg.com/564x/c7/3a/bd/c73abd9401a025ecc067cbda14baee6f.jpg",
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    ElevatedButton(
                        onPressed: () => null,
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        child: const Text(
                          "Read article",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.save_alt_outlined,
                    color: textWord,
                  ),
                  onPressed: () => null,
                ),
              ),
              Text(
                post.title,
                maxLines: 3,
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "created at: ${formatDate(post.createdAt)}",
                style: TextStyle(fontSize: 15, color: textWord),
              ),
              InkWell(
                child: Container(
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    // image: DecorationImage(
                    //     image: NetworkImage(post.ImagePost),
                    //     fit: BoxFit.cover)
                  ),
                ),
                onTap: () => null,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: textWord,
                      ),
                      onPressed: () => null,
                    ),
                    Text(post.view.toString(),
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
