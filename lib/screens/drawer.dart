import 'package:flutter/material.dart';

class NotesDrawer extends StatefulWidget {
  @override
  _NotesDrawerState createState() => _NotesDrawerState();
}

class _NotesDrawerState extends State<NotesDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Notepad",style: TextStyle(fontSize: 20.0)),
              accountEmail: Text("Your notepad app",style: TextStyle(fontSize: 15.0),),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    AssetImage("img/avatar.png"),
              ),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 15, 34, 102))),
        ],
      ),
    );
  }
}
