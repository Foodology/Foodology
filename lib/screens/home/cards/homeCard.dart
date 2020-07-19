import 'package:flutter/material.dart';
import 'package:foodology/screens/home/cards/homeCardActions.dart';
import 'package:foodology/screens/home/cards/homeExpansionTile.dart';

class HomeCard extends StatefulWidget {
  @override
  _HomeCardState createState() => _HomeCardState();

  final String author;
  final String title;
  final String authorRating;
  final String recipeRating;
  final String authorImage;
  final List<String> links;
  final String summary;
  final String detailedSummary;

  HomeCard({
    this.author,
    this.title,
    this.authorRating,
    this.recipeRating,
    this.authorImage,
    this.links,
    this.summary,
    this.detailedSummary
  });
}

class _HomeCardState extends State<HomeCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(this.widget.authorImage)
              ),
              title: Text(this.widget.title, style: TextStyle(fontSize: 20, letterSpacing: 1.0),),
              subtitle: Text(this.widget.author),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(this.widget.authorRating),
                  Text(this.widget.recipeRating)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              height: 100.0,
              child: Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: this.widget.links.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                      width: 100.0,
                      child: Image.network(this.widget.links[index], width: 200.0, height: 100.0, fit: BoxFit.fitHeight),
                    );
                  },
                ),
              ),
            ), HomeExpansionTile(
              summary: this.widget.summary,
              detailedSummary: this.widget.detailedSummary,
            ),
            SizedBox(height: 10.0,),
            HomeCardActions(),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}
