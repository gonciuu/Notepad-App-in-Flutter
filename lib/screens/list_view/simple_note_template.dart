
import 'package:enotepad/database/repository.dart';
import 'package:enotepad/models/note.dart';
import 'package:flutter/material.dart';

class SimpleNoteTemplate extends StatefulWidget {
  final Note note;
  SimpleNoteTemplate({this.note});
  @override
  _SimpleNoteTemplateState createState() => _SimpleNoteTemplateState();
}

class _SimpleNoteTemplateState extends State<SimpleNoteTemplate> {

  final Repository _repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
          child: ListTile(
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
                widget.note.isStar == 0 ? GestureDetector(
                  onTap: (){
                    setState(()=>widget.note.isStar=1);
                    _repository.updateData("Notes", widget.note.noteToMap());
                  },
                  child: Icon(
                    Icons.star_border,
                    color: Colors.grey[700],
                    size: 28.0,
                  ),
                ):GestureDetector(
                  onTap: (){
                    setState(()=>widget.note.isStar=0);
                    _repository.updateData("Notes", widget.note.noteToMap());
                  },
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 28.0,
                  ),
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
}