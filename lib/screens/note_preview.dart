import 'package:enotepad/models/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class NotePreview extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> noteMap = ModalRoute.of(context).settings.arguments;
    Note note = Note();
    note = note.mapToNote(noteMap);
    print(note.description);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 32.0,
                    color: Colors.grey[900],
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 23.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Colors.grey[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 35.0, 0.0, 10.0),
                              child: Text(
                                note.title,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Divider(
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 10.0),
                              child: Text(
                                note.description,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 17.0,
                                    height: 1.6),
                                maxLines: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25.0, 25.0, 50.0, 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    note.date + ", " + note.time,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14.0
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        OMIcons.event,
                                        color: Colors.grey[400],
                                        size: 28.0,
                                      ),SizedBox(width: 15.0,),
                                      Icon(
                                        OMIcons.note,
                                        color: Colors.grey[400],
                                        size: 28.0,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            bottomNav
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  //--------------bottom navbar note events------------------
  final bottomNav =  Align(alignment: Alignment.centerRight, child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
      color: Colors.grey[300],
    ),
    padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(OMIcons.edit,color: Colors.grey[800],size: 36.0),
        Icon(OMIcons.star,color: Colors.amber,size: 36.0,),
        Icon(OMIcons.delete,color: Colors.grey[800],size: 36.0)
      ],
    ),
  ));

}





