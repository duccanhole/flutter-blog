import 'package:flutter/material.dart';

class PostPage extends StatefulWidget{
   String LinkofUser;
   String HeadingPost;
   String DateTimeUpdate;
   String ImagePost;
  PostPage({
    required this.LinkofUser,
    required this.HeadingPost,
    required this.DateTimeUpdate,
    required this.ImagePost,
});
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("POST"),
      ),
      body:Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Text("${widget.HeadingPost}",maxLines: 3,style: TextStyle(fontSize: 30),textAlign: TextAlign.left),
              SizedBox(
                height: 20,
              ),
              Text("${widget.DateTimeUpdate}",style: TextStyle(fontSize: 15),),
              SizedBox(
                height: 20,
              ),
              Container(

                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                        image: NetworkImage("${widget.ImagePost}"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_upward),onPressed: ()=>null,),
                    IconButton(icon: Icon(Icons.comment),onPressed: ()=>null,),
                    IconButton(icon:  Icon(Icons.share),onPressed: ()=>null,),
                  ],
                ),
              )

            ],
          ),
        ),
      ) ,
    );
  }
}