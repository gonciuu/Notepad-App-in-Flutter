import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.star_border,
                      color: Colors.grey[700],
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Icon(Icons.more_vert, color: Colors.grey[900], size: 28.0),
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Text(
                  "Oct 27,2019, 9:05",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13.0),
                )
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
