import 'package:enotepad/constans/text.dart';
import 'package:enotepad/database/repository.dart';
import 'package:enotepad/models/note.dart';
import 'package:flutter/material.dart';

class WriteNote extends StatefulWidget {
  @override
  _WriteNoteState createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  //-------go to next formfield on enter clicked----------
  final descriptionFocus = FocusNode();
  final dateFocus = FocusNode();
  final timeFocus = FocusNode();

  //===================================================

  //-----------button colors-----------------
  Color homeButtonColor = Color.fromARGB(255, 15, 34, 102);
  Color homeButtonTextColor = Colors.white;
  Color businessButtonColor = Colors.grey[200];
  Color businessButtonTextColor = Colors.grey[900];
  Color otherButtonColor = Colors.grey[200];
  Color otherButtonTextColor = Colors.grey[900];

  //==========================================

  //--------------------handle textfields text------------------------
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String category = 'home';
  //===================================================================


  //---repo---
  Repository _repository = Repository();


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
                  decoration: textFieldDecoration,
                  //title]
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(descriptionFocus);
                  },
                  controller: this.titleController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: this.descriptionController,
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
                        controller: this.dateController,
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
                        controller: this.timeController,
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
                  height: 35.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        color: homeButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          setColor("home");
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(color: homeButtonTextColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        color: businessButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          setColor("business");
                        },
                        child: Text(
                          "Business",
                          style: TextStyle(color: businessButtonTextColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        color: otherButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          setColor("other");
                        },
                        child: Text(
                          "Other",
                          style: TextStyle(color: otherButtonTextColor),
                        ),
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
                        onPressed: () async {
                          Note note = Note(
                              title: titleController.text,
                              description: descriptionController.text,
                              date: dateController.text,
                              time: timeController.text,
                              isStar: 0,
                              category: category);
                          int result = await _repository.insertData("Notes", note.noteToMap());
                          print(result);
                        },
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

  void setColor(String bt) {
    setState(() {
      homeButtonColor = Colors.grey[200];
      homeButtonTextColor = Colors.grey[900];
      businessButtonColor = Colors.grey[200];
      businessButtonTextColor = Colors.grey[900];
      otherButtonColor = Colors.grey[200];
      otherButtonTextColor = Colors.grey[900];

      switch (bt) {
        case "home":
          homeButtonColor = Color.fromARGB(255, 15, 34, 102);
          homeButtonTextColor = Colors.white;
          break;
        case "business":
          businessButtonColor = Color.fromARGB(255, 15, 34, 102);
          businessButtonTextColor = Colors.white;

          break;
        case "other":
          otherButtonColor = Color.fromARGB(255, 15, 34, 102);
          otherButtonTextColor = Colors.white;
          break;
      }
      category = bt;
    });
  }
}
