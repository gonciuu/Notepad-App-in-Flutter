import 'package:enotepad/database/repository.dart';
import 'package:enotepad/models/note.dart';
import 'package:enotepad/screens/drawer.dart';
import 'package:flutter/material.dart';

import 'list_view/note_teplate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<Note> listOfNotes = List<Note>();
  Repository _repository = Repository();

  final _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();
    getAllNotes();
  }

  Future getAllNotes() async{
    listOfNotes.clear();
    List<Map<String,dynamic>> notes = await _repository.getAllData('Notes');
    notes.forEach((mapNote) {
      setState(() {
        Note note = Note();
        listOfNotes.add(note.mapToNote(mapNote));
      });});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NotesDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 12.0, right: 12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey[900],
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      color: Colors.red[400],
                      iconSize: 32.0,
                    ),
                    Text(
                      "My Notes",
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900]),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey[900],
                      ),
                      onPressed: () {},
                      color: Colors.red[400],
                      iconSize: 32.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      NoteTemplate(note: listOfNotes[index],getAllNotes: (){
                        getAllNotes();
                      },),
                  itemCount: listOfNotes.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 63.0,
        width: 63.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 15, 34, 102),
            onPressed: () async {
              await Navigator.pushNamed(context, "/write_note");
              getAllNotes();
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 38.0,
            ),
          ),
        ),
      ),
    );
  }
}
