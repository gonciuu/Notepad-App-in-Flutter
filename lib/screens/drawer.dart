import 'package:enotepad/database/repository.dart';
import 'package:enotepad/models/note.dart';
import 'package:flutter/material.dart';

class NotesDrawer extends StatefulWidget {
  final Function getAllNotes;
  NotesDrawer({this.getAllNotes});
  @override
  _NotesDrawerState createState() => _NotesDrawerState();
}

class _NotesDrawerState extends State<NotesDrawer> {

  final Repository _repository = Repository();

  //----------list of notes by category-----------
  List<Note> _listOfBusinessNotes = List<Note>();
  List<Note> _listOfHomeNotes = List<Note>();
  List<Note> _listOfOtherNotes = List<Note>();
  //==============================================

  @override
  void initState() {
    super.initState();
    getAllNotes();
  }


  //-----------get all notes and add it to good list-------------
  Future getAllNotes() async{
    _listOfBusinessNotes.clear();
    _listOfHomeNotes.clear();
    _listOfOtherNotes.clear();
    List<Map<String,dynamic>> mapList= await _repository.getAllData("Notes");
    mapList.forEach((noteMap) =>
      setState(() {
        Note note = Note();
        note = note.mapToNote(noteMap);
        switch(note.category){
          case "home": _listOfHomeNotes.add(note);break;
          case "business":_listOfBusinessNotes.add(note);break;
          case "other":_listOfOtherNotes.add(note);break;
        }
      }));
  }
  //==============================================================


  //------------------add new note on listtile clicked and get all notes after that--------------------
  Future addNewNote(BuildContext context) async{
    await Navigator.pushNamed(context,"/write_note");
    Navigator.pop(context);
    widget.getAllNotes();
  }
  //===================================================================================================

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
              height: 7.0,
            ),
            ListTile(
              onTap: () async{
                await addNewNote(context);
              },
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
              color: Colors.grey[400],
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
              onTap:(){
                Navigator.pushNamed(context, "/notes_by_category");
              } ,
            ),
            for(Note note in _listOfBusinessNotes) ListTile(
              title: Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                note.description,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ), Divider(
              color: Colors.grey[400],
            ),
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
            for(Note note in _listOfHomeNotes)ListTile(
              title: Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
                note.description,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ), Divider(
              color: Colors.grey[400],
            ),
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
            for(Note note in _listOfOtherNotes)ListTile(
              title: Text(
               note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
              ),
              subtitle: Text(
               note.description,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
