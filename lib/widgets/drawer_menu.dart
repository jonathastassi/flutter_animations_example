import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Jonathas"),
            accountEmail: Text("jonathastassi@hotmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Perfil"),
          )
        ],
      ),
    );
  }
}
