import 'package:flutter/material.dart';

class WriteNote extends StatefulWidget {
  @override
  _WriteNoteState createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 50.0, 35.0, 30.0),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[900],
                  size: 36.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Add new Note",
                  style: TextStyle(color: Colors.grey[900], fontSize: 28.0),
                ),
              ],
            ))),
      ),
    );
  }
}
