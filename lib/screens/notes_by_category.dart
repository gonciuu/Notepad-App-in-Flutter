import 'package:enotepad/models/note.dart';
import 'package:enotepad/screens/list_view/note_teplate.dart';
import 'package:flutter/material.dart';

class NotesByCategory extends StatefulWidget {
  @override
  _NotesByCategoryState createState() => _NotesByCategoryState();
}

class _NotesByCategoryState extends State<NotesByCategory> {

  List<Note> listOfNotes = List<Note>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 34, 102),
        title: Text(
          "Business",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => NoteTemplate(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 6,
      ),
    );
  }
}
