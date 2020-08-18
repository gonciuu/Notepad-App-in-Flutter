import 'package:enotepad/models/note.dart';
import 'package:enotepad/screens/list_view/note_teplate.dart';
import 'package:enotepad/screens/list_view/simple_note_template.dart';
import 'package:flutter/material.dart';

class NotesByCategory extends StatefulWidget {
  @override
  _NotesByCategoryState createState() => _NotesByCategoryState();
}

class _NotesByCategoryState extends State<NotesByCategory> {

  List<Note> listOfNotes = List<Note>();

  @override
  Widget build(BuildContext context) {

    //---------------------------make list of note from list of note map------------------------------
    if(listOfNotes.isEmpty) {
      List<Map<String, dynamic>> listOfMaps = ModalRoute.of(context).settings.arguments;
      listOfMaps.forEach((noteMap) {
        Note note = Note();
        listOfNotes.add(note.mapToNote(noteMap));
      });
      setState(() => listOfNotes.sort((note1,note2)=>note2.isStar.compareTo(note1.isStar)));
    }
    //=================================================================================================

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 34, 102),
        title: Text(
          "Business",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:5.0),
        child: ListView.builder(
          itemBuilder: (context, index) => SimpleNoteTemplate(note: listOfNotes[index]),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listOfNotes.length,
        ),
      ),
    );
  }
}
