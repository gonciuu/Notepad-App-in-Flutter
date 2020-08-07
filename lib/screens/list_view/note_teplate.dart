import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ListTile(
            title: Text(
              "Note Sample Title",
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
                "Note Sample Subtitle here",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0,
                    color: Colors.grey[500]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey[600],
        )
      ],
    );
  }
}
