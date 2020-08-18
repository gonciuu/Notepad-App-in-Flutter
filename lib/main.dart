import 'package:enotepad/screens/edit_note.dart';
import 'package:enotepad/screens/home.dart';
import 'package:enotepad/screens/note_preview.dart';
import 'package:enotepad/screens/notes_by_category.dart';
import 'package:enotepad/screens/write_note.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      routes: {
        "/": (context) => Home(),
        "/write_note": (context) => WriteNote(),
        "/edit_note": (context) => EditNote(),
        "/note_preview": (context) => NotePreview(),
        "/notes_by_category": (context) => NotesByCategory(),
        },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      title: "E-Notepad",
      theme: ThemeData(fontFamily: 'SegoueUI'),
    ));
