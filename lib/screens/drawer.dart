import 'package:flutter/material.dart';

class NotesDrawer extends StatefulWidget {
  @override
  _NotesDrawerState createState() => _NotesDrawerState();
}

class _NotesDrawerState extends State<NotesDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Notepad", style: TextStyle(fontSize: 18.0)),
                accountEmail: Text(
                  "Your notepad app",
                  style: TextStyle(fontSize: 15.0),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("img/avatar.png"),
                ),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 15, 34, 102))),
            SizedBox(
              height: 15.0,
            ),
            ListTile(
              title: Text(
                "Add new note",
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              leading: Icon(
                Icons.note_add,
                size: 28.0,
                color: Colors.grey[900],
              ),
            ),
            Divider(
              color: Colors.grey[200],
            ),
            ListTile(
              title: Text(
                "Business",
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              leading: Icon(
                Icons.business_center,
                size: 28.0,
                color: Colors.grey[900],
              ),
            ),
            ListTile(
              title: Text(
                "Make a Contract",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                "Make a contract with my parents",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              title: Text(
                "Buy new car",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                "Buy new mercedes car to my business",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              leading: Icon(
                Icons.home,
                size: 28.0,
                color: Colors.grey[900],
              ),
            ),
            ListTile(
              title: Text(
                "Veccuming in room",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                "Veccuming in my and my brother room",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              title: Text(
                "Clean glasses",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                "Clean glasses in kitchen and living room",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),),
            ListTile(
              title: Text(
                "Other",
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              leading: Icon(
                Icons.accessibility_new,
                size: 28.0,
                color: Colors.grey[900],
              ),
            ),
            ListTile(
              title: Text(
                "Buy new Keyboard",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                "Buy new wireless keyboard to my computer",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              title: Text(
                "Make homework",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                "make Math homework on tomorrow",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),),
          ],
        ),
      ),
    );
  }
}
