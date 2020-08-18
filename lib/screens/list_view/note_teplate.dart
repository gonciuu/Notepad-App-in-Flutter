import 'package:enotepad/database/repository.dart';
import 'package:enotepad/models/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class NoteTemplate extends StatefulWidget {

  final Note note;//note to template
  final Function getAllNotes;//refresh state
  NoteTemplate({this.note,this.getAllNotes});

  @override
  _NoteTemplateState createState() => _NoteTemplateState();
}

class _NoteTemplateState extends State<NoteTemplate> {
  final repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
          child: ListTile(
            onTap: ()async{
              await Navigator.pushNamed(context,"/note_preview",arguments: widget.note.noteToMap());
              widget.getAllNotes();
            },
            title: Text(
              widget.note.title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.grey[900]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                widget.note.description,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0,
                    color: Colors.grey[500]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    widget.note.isStar == 0 ? GestureDetector(
                      child: Icon(
                        Icons.star_border,
                        color: Colors.grey[700],
                        size: 26.0,
                      ),
                      onTap: (){
                        //star note
                        setState(() => widget.note.isStar = 1);
                        repository.updateData("Notes", widget.note.noteToMap());
                      },
                    ) : GestureDetector(
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 26.0,
                      ),
                      onTap: (){
                        //unstar note
                        setState(() => widget.note.isStar = 0);
                        repository.updateData("Notes", widget.note.noteToMap());
                      },
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    GestureDetector(child: Icon(Icons.more_vert, color: Colors.grey[900], size: 28.0),onTapDown: (TapDownDetails details) {
                      _showPopup(context,details.globalPosition);
                    },),
                  ],
                ),
                SizedBox(
                  height: 11.0,
                ),
                Text(
                  widget.note.date +', ' + widget.note.time,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey[300],
        )
      ],
    );
  }

//----------------------------Show popup action menu on pressed icon ---------------------------------

  void _showPopup(BuildContext context,Offset offset) async {
    var selected = await showMenu(context: context, position: RelativeRect.fromLTRB(offset.dx,offset.dy,0,0), items:[
      PopupMenuItem(child: Row(
        children: <Widget>[
          Text('Delete',style: TextStyle(
            fontWeight: FontWeight.w600,color: Colors.grey[900],fontSize: 16.0
          ),),SizedBox(width: 5.0,),
          Icon(OMIcons.delete,color: Colors.grey[900],size: 25.0,)
        ],
      ),value: 'delete'),
      PopupMenuItem(child: Row(
        children: <Widget>[
          Text('Edit',style: TextStyle(
              fontWeight: FontWeight.w600,color: Colors.grey[900],fontSize: 16.0
          ),),SizedBox(width: 23.0,),
          Icon(OMIcons.edit,color: Colors.grey[900],size: 25.0,)
        ],
      ),value: 'edit')

    ]);
    popUpMenuItemSelectedAction(selected,context);
  }

  //====================================================================================================

  //------------------------get popup menu item selected and make action to that-----------------------------
   Future popUpMenuItemSelectedAction(dynamic selected,BuildContext context) async{
    if(selected == 'delete'){
      await repository.deleteData('Notes', widget.note.id);
      widget.getAllNotes();
      //get delete note and tun get all notes method again
    }else if(selected == 'edit'){
      //go to edit note screen
      await Navigator.pushNamed(context, "/edit_note",arguments: widget.note.noteToMap());
      widget.getAllNotes();
    }
  }
  //==========================================================================================================
}
