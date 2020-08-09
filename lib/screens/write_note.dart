import 'package:enotepad/constans/text.dart';
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
                    Text("Add New Note",
                        style:
                            TextStyle(color: Colors.grey[900], fontSize: 28.0)),
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 32.0,
                        color: Colors.grey[400],
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                TextFormField(
                  decoration: textFieldDecoration,//title
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textFieldDecoration.copyWith(
                    hintText: "Write Here note description",//description
                    labelText: "Description"
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textFieldDecoration.copyWith(
                      hintText: "Write Here note description",//description
                      labelText: "Description"
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textFieldDecoration.copyWith(
                      hintText: "Write Here note description",//description
                      labelText: "Description"
                  ),
                ),SizedBox(height: 60.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.symmetric(vertical: 19.0),
                        onPressed: () {},
                        color: Color.fromARGB(255, 15, 34, 102),
                        child: Text("Add Note",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0)),
                      ),
                    ),
                  ],
                )
              ],
            ))),
      ),
    );
  }
}
