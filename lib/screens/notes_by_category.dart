import 'package:enotepad/models/note.dart';
import 'package:flutter/material.dart';


class NotesByCategory extends StatefulWidget {
  @override
  _NotesByCategoryState createState() => _NotesByCategoryState();
}

class _NotesByCategoryState extends State<NotesByCategory> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 15, 34, 102),
        title: Text("Business",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

