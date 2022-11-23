import 'dart:convert';

import 'package:app/api/user/index.dart';
import 'package:app/route/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'RegisterPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isVisible = false;
  bool loading = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _saveFrom() async {
    if (userName.text == '' || password.text == '') return;
    setState(() {
      loading = true;
    });
    Response res = await UserApi().login(userName.text, password.text);
    setState(() {
      loading = false;
    });
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", json.decode(res.body)['results']['token']);
      await prefs.setString(
          "userName", json.decode(res.body)['results']['userName']);
      await prefs.setString(
          "userId", json.decode(res.body)['results']['userId']);
      homePagetonextScreen(context());
    } else {
      String message = jsonDecode(res.body)['message'];
      ScaffoldMessenger.of(context())
          .showSnackBar(SnackBar(content: Text(message)));
    }
    //code check user from sever
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Login",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: userName,
                  decoration: const InputDecoration(
                      hintText: "  Enter User Name",
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.supervised_user_circle)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: password,
                  // keyboardType: TextInputType.text,
                  obscureText: _isVisible ? false : true,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|b\s"))
                  // ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText: "Enter Password",
                    suffixIcon: IconButton(
                      onPressed: () => updateStatus(),
                      icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: const OutlineInputBorder(),
                    icon: const Icon(Icons.lock),
                  ),
                  // validator: (value){
                  //   if(value!=null && value.length<6){
                  //     return "Passwold must to  6 character";
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: loading ? null : _saveFrom,
                    child: const Text("Login"),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Don't have account yet?")),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => registerPagetonextScreen(context),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerPagetonextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  void homePagetonextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ControllView()));
  }
}
