import 'dart:math';

import 'package:flutter/material.dart';

class HomeExpansionTile extends StatefulWidget {
  @override
  _HomeExpansionTileState createState() => _HomeExpansionTileState();

  final String summary;
  final String detailedSummary;
  HomeExpansionTile({this.summary, this.detailedSummary});
}

class _HomeExpansionTileState extends State<HomeExpansionTile> {

  static IconData expand = Icons.expand_more;
  static IconData compress = Icons.expand_less;
  IconData selectedIcon = expand;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ExpansionTile(
          title: Text(this.widget.summary),
          trailing: Icon(selectedIcon),
          onExpansionChanged: (value) {
            setState(() {
              value ? selectedIcon = compress : selectedIcon = expand;
            });
          },
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
              child: Text(
                this.widget.detailedSummary,
                style: TextStyle(
                  fontSize: 15.0,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
