
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.only(top:18.0,left: 12.0,right: 12.0),
         child: Column(
           children: <Widget>[
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 IconButton(
                   icon: Icon(Icons.menu, color: Colors.grey[900],), onPressed: () {},color: Colors.red[400],iconSize: 32.0,
                 ),
                 Text(
                   "My Notes",style: TextStyle(
                   fontSize: 28.0,
                   fontWeight: FontWeight.w700,
                   color: Colors.grey[900]
                 ),
                 ),
                 IconButton(
                   icon: Icon(Icons.search, color: Colors.grey[900],), onPressed: () {},color: Colors.red[400],iconSize: 32.0,
                 ),
               ],
             ),
             SizedBox(height: 30.0,),
             ListView(
               
             )
           ],
         ),
       ),
     ),
    );
  }
}
