import 'package:enotepad/screens/home.dart';
import 'package:enotepad/screens/note_preview.dart';
import 'package:enotepad/screens/write_note.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      routes: {
        "/": (context) => Home(),
        "/write_note": (context) => WriteNote(),
        "/note_preview": (context) => NotePreview(),
        },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      title: "E-Notepad",
      theme: ThemeData(fontFamily: 'SegoueUI'),
    ));
