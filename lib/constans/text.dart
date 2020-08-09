import 'package:flutter/material.dart';


const descriptionTxt =  TextStyle(color: Colors.grey, fontSize: 14.0);


const textFieldDecoration = InputDecoration(
    hintText: "Write Here note title",
    labelText:"Title",
    labelStyle: TextStyle(
        color: Color.fromARGB(255, 15, 34, 102)
    ),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(120, 15, 34, 102),width: 1.5)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 15, 34, 102),width: 1.5))
);


