import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class NotePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
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
                  margin: EdgeInsets.only(top: 25.0),
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
                                "Sample note title",
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
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rhoncus finibus finibus. Maecenas dictum, orci ut dapibus elementum, nisl ipsum lacinia lacus, in viverra dolor velit non dui. Maecenas ac mauris vel ex accumsan tempor et sit amet metus. Integer porttitor vel enim nec interdum. Cras venenatis, ex et laoreet egestas, ligula lectus blandit ex, eu placerat urna urna et felis. Vestibulum sit amet dignissim ligula. Aliquam efficitur libero ac ante lacinia scelerisque.",
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
                                    "Oct 27,2019, 9:05",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14.0
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.event_note,
                                        color: Colors.grey[400],
                                        size: 28.0,
                                      ),SizedBox(width: 15.0,),
                                      Icon(
                                        Icons.rate_review,
                                        color: Colors.grey[400],
                                        size: 28.0,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Align(alignment: Alignment.centerRight, child: Container(
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
                            )),

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
}
