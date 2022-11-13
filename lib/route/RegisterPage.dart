import 'package:app/api/User/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  String errorTextUsername = '';
  String errorTextPassword = '';
  String errorTextRePassword = '';
  bool loading = false;
  void checkUsername(String s) {
    if (s.isEmpty) {
      errorTextUsername = "Invalid or empty username.";
    } else {
      if (s.length < 6 || s.length > 15) {
        errorTextUsername = "Username should be between 6-15 characters.";
      } else {
        errorTextUsername = '';
      }
    }
  }

  void checkPassword(String s) {
    if (s.isEmpty) {
      errorTextPassword = "Password cannot be empty.";
    } else {
      if (s.length < 8 || s.length > 16) {
        errorTextPassword = "Your password must be between 8-16 characters";
      } else {
        errorTextPassword = '';
      }
    }
  }

  void registerUser() async {
    if (errorTextUsername == '' &&
        errorTextPassword == '' &&
        errorTextRePassword == '') {
      setState(() {
        loading = true;
      });
      Response res = await UserApi()
          .register(usernameController.text, passwordController.text);
      setState(() {
        loading = false;
      });
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context())
            .showSnackBar(const SnackBar(content: Text("Success!!!")));
        Navigator.pop(context());
      } else {
        ScaffoldMessenger.of(context())
            .showSnackBar(const SnackBar(content: Text("Error to register")));
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
              const Text(
                "Registration",
                maxLines: 1,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: usernameController,
                onChanged: (value) {
                  setState(() {
                    checkUsername(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: "Username",
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  errorText:
                      errorTextUsername.isEmpty ? null : errorTextUsername,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    checkPassword(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  errorText:
                      errorTextPassword.isEmpty ? null : errorTextPassword,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: rePasswordController,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    if (value != passwordController.text) {
                      errorTextRePassword = "Passwords do not match.";
                    } else {
                      errorTextRePassword = '';
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: "Re-Enter Password",
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  errorText:
                      errorTextRePassword.isEmpty ? null : errorTextRePassword,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: loading ? null : registerUser,
                  child: const Text("Register Now"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
