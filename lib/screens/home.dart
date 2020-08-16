import 'package:enotepad/database/repository.dart';
import 'package:enotepad/models/note.dart';
import 'package:enotepad/screens/drawer.dart';
import 'package:flutter/material.dart';

import 'list_view/note_teplate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //all notes
  List<Note> listOfNotes = List<Note>();
  //search result notes
  List<Note> searchResult = List<Note>();

  Repository _repository = Repository();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getAllNotes();
  }

  final searchController = TextEditingController();


  //get all notes
  Future getAllNotes() async {
    searchController.clear();
    searchResult.clear();
    listOfNotes.clear();
    List<Map<String, dynamic>> notes = await _repository.getAllData('Notes');
    notes.forEach((mapNote) {
      setState(() {
        Note note = Note();
        listOfNotes.add(note.mapToNote(mapNote));
      });
    });
    setNotesListToSearchedList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: NotesDrawer(getAllNotes: (){
        getAllNotes();
      },),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 12.0, right: 12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey[900],
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      color: Colors.red[400],
                      iconSize: 32.0,
                    ),SizedBox(width: 70.0,),
                    Text(
                      "My Notes",
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900]),
                    ),SizedBox(width: 30.0,),
                    Flexible(
                      child: TextField(
                        controller: searchController,
                        cursorColor: Colors.grey[900],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey[900],
                              ),
                              onPressed: () {},
                              color: Colors.red[400],
                              iconSize: 32.0,
                            )),
                        onChanged: (str) => onSearchTextChanged(str),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      NoteTemplate(
                    note: searchResult[index],
                    getAllNotes: () {
                      getAllNotes();
                    },
                  ),
                  itemCount: searchResult.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 63.0,
        width: 63.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 15, 34, 102),
            onPressed: () async {
              await Navigator.pushNamed(context, "/write_note");
              getAllNotes();
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 38.0,
            ),
          ),
        ),
      ),
    );
  }

  //-----search in list-------
  onSearchTextChanged(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      setNotesListToSearchedList();
      return;
    }

    listOfNotes.forEach((userDetail) {
      if (userDetail.title.contains(text) || userDetail.description.contains(text))
        searchResult.add(userDetail);
    });

    setState(() {});
  }
  //============================


  //------set all notes values to searchedlist-------
  void setNotesListToSearchedList() => listOfNotes.forEach((note) =>setState(() =>searchResult.add(note)));



}
  //==========================
