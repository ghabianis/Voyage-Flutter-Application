import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/authentication.page.dart';
import 'package:flutter_application_1/page/home.page.dart';
import 'package:flutter_application_1/page/inscription.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/Home': (context) => HomePage(),
    '/Inscription': (context) => InscriptionPage(),
    '/Authentification': (context) => AuthenticationPage()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool conn = snapshot.data?.getBool('connecte') ?? false;
                if (conn) return HomePage();
              }
              return AuthenticationPage();
            }));
  }
}
