import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 15,
                  bottom: 20,
                  right: 20,
                  top: 10), //apply padding to some sides only
              child: Text(
                "Inscription Page",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: txt_login,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular((10))),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: txt_password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular((10))),
                  hintText: 'Enter your Password',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  // Add your registration logic here
                  _onInscrire(context);
                },
                child: Text(
                  'Inscription',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                child: Text(
                  "J'ai deja un compte",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/Authentification');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      const snack = SnackBar(content: Text("You are connected Successfully!"));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.pushNamed(context, '/Home');
    } else {
      const snack =
          SnackBar(content: Text("Password or Email is not correct!"));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
  }
}
