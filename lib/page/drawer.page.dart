import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.blue]),
            ),
            child: Center(
                child: CircleAvatar(
              backgroundImage: AssetImage("image/profile.png"),
              radius: 80,
            )),
          ),
          ListTile(
            title: Text(
              'Accueil',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.blue,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _Deconnexion(context);
                },
                child: Text(
                  "Deconnexion",
                  style: TextStyle(fontSize: 22),
                )),
          )
        ],
      ),
    );
  }

  Future<void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/Authentification', (Route<dynamic> route) => false);
  }
}
