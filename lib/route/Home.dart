
import 'package:flutter/material.dart';

import 'InfoPost.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List post=[
    InfoPost(LinkofUser: "LinkofUser", HeadingPost: "Heading Post A", DateTimeUpdate: "Date Time Update A",
        ImagePost: "https://images3.alphacoders.com/100/thumbbig-1003152.webp"),
    InfoPost(LinkofUser: "LinkofUser", HeadingPost: "Heading Post B", DateTimeUpdate: "Date Time Update B",
        ImagePost: "https://images7.alphacoders.com/100/thumbbig-1004011.webp"),
    InfoPost(LinkofUser: "LinkofUser", HeadingPost: "Heading Post C", DateTimeUpdate: "Date Time Update C",
        ImagePost: "https://images6.alphacoders.com/123/thumbbig-1234255.webp"),
  ];
  @override
  // TODO: implement widget
  Widget Post(InfoPost post){
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 360,
          decoration: BoxDecoration(
            color: Colors.cyanAccent,
            border: Border.all(
              width: 3,
              color: Colors.white54
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20)
            )
          ),
          child: Column(
            children: [
              ListTile(
                leading:CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://i.pinimg.com/564x/c7/3a/bd/c73abd9401a025ecc067cbda14baee6f.jpg",
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ) ,
                title:  Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    ElevatedButton(
                          onPressed: ()=> null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.white)
                          ),
                          child: Text("Read article" ,style: TextStyle(color: Colors.black),)
                      ),
                  ],

                ),
                trailing: IconButton(icon: Icon(Icons.more_vert),onPressed:()=> null,),
                
              ),
              Text(post.HeadingPost,style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),
              SizedBox(
                height: 20,
              ),
              Text(post.DateTimeUpdate,style: TextStyle(fontSize: 15),),

              InkWell(
                child: Container(
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                      image: NetworkImage(post.ImagePost),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                onTap: ()=>null,
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
        SizedBox(
          height: 20,
        )
      ],
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      ),
      drawer: Drawer(
        child: ListView(
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
                  image:DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://media.muanhatructuyen.vn/post/221/3/hinh-nen-may-trang-sao-ngo-nghinh.jpg")
                  )
              ),
            ),
            ListTile(
              title: const Text("Popular"),
              leading: const Icon(Icons.local_fire_department),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Most upvoted"),
              leading: const Icon(Icons.file_upload_rounded),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Best discussions"),
              leading: const Icon(Icons.chat),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Submit article"),
              leading: const Icon(Icons.insert_link_outlined),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Reading historry"),
              leading: const Icon(Icons.remove_red_eye_outlined),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Customize"),
              leading: const Icon(Icons.settings),
              onTap: ()=> null,
            ),
            SizedBox(
              height:150 ,
            ),

            ListTile(
              title: const Text("Docs"),
              leading: const Icon(Icons.text_snippet),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Changelog"),
              leading: const Icon(Icons.price_change),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("Feedback"),
              leading: const Icon(Icons.feedback),
              onTap: ()=> null,
            ),
            ListTile(
              title: const Text("invite people"),
              leading: const Icon(Icons.people),
              onTap: ()=> null,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            for(var i=0;i<3;i++) Post(post[i]),
          ],
        ),
      ),
    );
  }
}