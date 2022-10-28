import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home.dart';
import 'RegisterPage.dart';
import 'User.dart';

class SignInPage extends StatefulWidget{
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userName=TextEditingController();
  TextEditingController Password=TextEditingController();

  bool _isVisible=false;
  void updateStatus(){
    setState(() {
      _isVisible=!_isVisible;
    });
  }

  final GlobalKey<FormState>_formkey=GlobalKey();
  void _saveFrom(){
    final bool isValid=_formkey.currentState!.validate();
    if(isValid){
      if(kDebugMode){
        print("Got a valid input");
      }
    }
    //code check user from sever
    User user= new User(Username: "abcdef", Password: "123456789");

  }
  @override
  Widget build(BuildContext context) {
   return  Scaffold(

     body: Padding(
       padding:EdgeInsets.all(30),
       child: Center(
         child: Form(
           key: _formkey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,

             children: [
               Text("Login",
                   maxLines: 1,
                 style: TextStyle(
                   color: Colors.lightBlue,
                   fontSize: 100,
                   fontWeight: FontWeight.bold,

                 ),
               ),
               SizedBox(
                 height: 30,
               ),

               TextFormField(
                   decoration: const InputDecoration(
                     hintText: "  Enter User Name",
                     contentPadding: EdgeInsets.all(8),
                     border: OutlineInputBorder(),
                     icon: Icon(Icons.supervised_user_circle)
                   ),

               ),
               SizedBox(
                 height: 30,
               ),
               TextFormField(
                 // keyboardType: TextInputType.text,
                 obscureText: _isVisible?false:true,
                 // inputFormatters: [
                 //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|b\s"))
                 // ],
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(8),
                   hintText: "Enter Password",
                     suffixIcon: IconButton(
                       onPressed:() =>updateStatus(),
                       icon: Icon(_isVisible?Icons.visibility : Icons.visibility_off),
                     ),
                     border: OutlineInputBorder(),
                     icon: Icon(Icons.lock),
                 ),
                 // validator: (value){
                 //   if(value!=null && value.length<6){
                 //     return "Passwold must to  6 character";
                 //   }
                 //   return null;
                 // },
               ),
               SizedBox(
                 height: 50,
               ),

               SizedBox(
                 height: 50,
                 width: 100,
                 child: ElevatedButton(
                   onPressed: ()=> {
                     _saveFrom(),
                     HomePagetonextScreen(context),
                   },
                   child:Text("Login"),

                 ),
               ),
               SizedBox(
                 height: 50,
               ),
               SizedBox(
                 width: double.maxFinite,
                 child: ElevatedButton(
                     onPressed: ()=>RegisterPagetonextScreen(context),
                   style: ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll(Colors.white),

                   ),
                   child: Text("Create Account",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black),),
                 ),
               ),

             ],
           ),
         ),
       ),
     ),
   );
  }
  void RegisterPagetonextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
  }
  void HomePagetonextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
  }
}