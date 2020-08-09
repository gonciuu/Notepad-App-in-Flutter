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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Add New Note",style: TextStyle(color: Colors.grey[900],fontSize: 28.0)),
                    IconButton(
                      icon: Icon(Icons.clear,size: 32.0, color: Colors.grey[400],),
                      onPressed: () {

                      },
                    )
                  ],
                ),
                FlatButton(
                  onPressed: () {  },
                  color: Colors.,
                  child: Text("Add Note"),
                )
              ],
            ))),
      ),
    );
  }
}
