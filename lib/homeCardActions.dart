import 'package:flutter/material.dart';
import 'package:foodology/commentPage.dart';

class HomeCardActions extends StatefulWidget {
  @override
  _HomeCardActionsState createState() => _HomeCardActionsState();
}

class _HomeCardActionsState extends State<HomeCardActions> {

  static IconData favoriteUnselected = Icons.favorite_border;
  static IconData favoriteSelected = Icons.favorite;
  IconData favoriteIcon = favoriteUnselected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            child: Icon(favoriteIcon, size: 30.0,), onTap: () {
              setState(() {
                favoriteIcon == favoriteSelected ? favoriteIcon = favoriteUnselected : favoriteIcon = favoriteSelected;
              });
            },
          ),
          GestureDetector(
            child: Icon(Icons.comment, size: 30.0,), onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommentPage()),
              );
            },
          ),
          Icon(Icons.share, size: 30.0,),
        ],
      )
    );
  }
}
