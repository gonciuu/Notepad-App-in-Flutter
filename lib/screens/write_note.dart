import 'package:enotepad/constans/text.dart';
import 'package:flutter/material.dart';

class WriteNote extends StatefulWidget {
  @override
  _WriteNoteState createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  final descriptionFocus = FocusNode();
  final dateFocus = FocusNode();
  final timeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 50.0, 35.0, 35.0),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Add New Note",
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 28.0,
                            fontWeight: FontWeight.w700)),
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
                  height: 50.0,
                ),
                TextFormField(
                  cursorColor: Color.fromARGB(255, 15, 34, 102),
                  decoration: textFieldDecoration, //title]
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(descriptionFocus);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  cursorColor: Color.fromARGB(255, 15, 34, 102),
                  focusNode: descriptionFocus,
                  decoration: textFieldDecoration.copyWith(
                      hintText: "Write Here note description", //description
                      labelText: "Description"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(dateFocus);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 34, 102),
                        focusNode: dateFocus,
                        decoration: textFieldDecoration.copyWith(
                            hintText: "Write Here note date", //date
                            labelText: "Date"),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(timeFocus);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 15, 34, 102),
                      child: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 34, 102),
                        focusNode: timeFocus,
                        decoration: textFieldDecoration.copyWith(
                            hintText: "Write Here note time", //date
                            labelText: "Time"),
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 15, 34, 102),
                      child: IconButton(
                        icon: Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        color: Color.fromARGB(255, 15, 34, 102),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {},
                        child: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {},
                        child: Text("Business"),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {},
                        child: Text("Other"),
                      ),
                    )
                  ],
                ),
                Spacer(),
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
