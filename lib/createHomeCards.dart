import 'package:flutter/material.dart';
import 'package:foodology/homeCard.dart';
import 'package:foodology/models/recipe.dart';
import 'package:foodology/models/userData.dart';
import 'package:foodology/services/database.dart';

class CreateHomeCards extends StatefulWidget {
  CreateHomeCards({Key key}) : super(key: key);

  @override
  _CreateHomeCardsState createState() => _CreateHomeCardsState();
}

class _CreateHomeCardsState extends State<CreateHomeCards> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder<UserData>(
          stream: DatabaseService().userData(),
          builder: (context, snap) {
            if(snap.data == null) return CircularProgressIndicator();
            var count = snap.data.private.recommendedRecipes.length;
            Map<String, dynamic> map = snap.data.private.recommendedRecipes;
            return ListView.builder(
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                String key = map.keys.elementAt(index);
                return StreamBuilder(
                  stream: DatabaseService().recipe(map[key]),
                  builder: (context, AsyncSnapshot<Recipe> snap2) {
                    if(snap2.data == null) return CircularProgressIndicator();
                    return StreamBuilder(
                      stream: DatabaseService().publicUserInfo(key),
                      builder: (context, AsyncSnapshot<PublicInfo> snap3) {
                        if(snap3.data == null) return CircularProgressIndicator();
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                          child: (
                              HomeCard(
                                title: snap2.data.title,
                                author: snap3.data.name,
                                authorRating: snap3.data.authorRating.toString() + " / 10.0",
                                recipeRating: snap2.data.recipeRating.toString() + " / 10.0",
                                authorImage: snap3.data.profilePicture,
                                links: snap2.data.images,
                                summary: snap2.data.summary,
                                detailedSummary: snap2.data.detailedSummary,
                              )
                          ),);
                      },
                    );
                  },
                );
              },
            );
          },
        )
    );
  }
}