import 'dart:convert';

import 'package:app/api/User/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../interface/User.interface.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   TextEditingController username_controller=TextEditingController();
   TextEditingController password_controller=TextEditingController();
   TextEditingController re_password_controller=TextEditingController();
   String errorTextUsername='';
   String errorTextPassword='';
   String errorTextRe_password='';
   bool loading=false;
   void checkUsername( String s){
     if(s.isEmpty)  errorTextUsername="Invalid or empty username.";
     else{
       if(s.length<6||s.length>15) errorTextUsername="Username should be between 6-15 characters.";
       else{
         errorTextUsername='';
       }
     }
   }
   void checkPassword( String s){
     if(s.isEmpty)  errorTextPassword="Password cannot be empty.";
     else{
       if(s.length<8||s.length>16) errorTextPassword="Your password must be between 8-16 characters";
       else{
         errorTextPassword='';
       }
     }
   }
   void RegisterUser() async{
     if(errorTextUsername=='' && errorTextPassword==''&&errorTextRe_password==''){
       setState(() {
         loading = true;
       });
       Response res = await UserApi().register(username_controller.text, password_controller.text);
       setState(() {
         loading = false;
       });
       if(res.statusCode==200){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success!!!")));
         Navigator.pop(context);
       }
       else {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error to register")));
         RegisterPage();
       }
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Registration",
                maxLines: 1,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),

              TextFormField(
                controller: username_controller,
                onChanged: (value){
                  setState(() {
                    checkUsername(value);
                  });
                },
                decoration:  InputDecoration(
                  hintText:  "Username",
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(

                  ),
                    errorText: errorTextUsername.isEmpty ? null :errorTextUsername,
                ),

              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: password_controller,
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    checkPassword(value);
                  });
                },
                decoration:  InputDecoration(
                    hintText:  "Password",
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                    ),
                  errorText: errorTextPassword.isEmpty ? null :errorTextPassword,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: re_password_controller,
                obscureText:true,
                onChanged: (value){
                  setState(() {
                   if(value!=password_controller.text) errorTextRe_password="Passwords do not match.";
                   else errorTextRe_password='';
                  });
                },
                decoration:  InputDecoration(
                    hintText:  "Re-Enter Password",
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                    ),
                  errorText: errorTextRe_password.isEmpty ? null :errorTextRe_password,


                ),

              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: loading? null: RegisterUser,
                  child:Text("Register Now"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}