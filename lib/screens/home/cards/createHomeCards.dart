import 'package:flutter/material.dart';
import 'package:foodology/models/recipe.dart';
import 'package:foodology/models/userData.dart';
import 'package:foodology/screens/home/cards/homeCard.dart';
import 'package:foodology/services/database.dart';

class CreateHomeCards extends StatefulWidget {
  CreateHomeCards({Key key}) : super(key: key);

  @override
  _CreateHomeCardsState createState() => _CreateHomeCardsState();
}

class _CreateHomeCardsState extends State<CreateHomeCards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: StreamBuilder<UserData>(
          stream: DatabaseService().userData(),
          builder: (context, userDataSnap) {
            if(userDataSnap.data == null) return CircularProgressIndicator();
            var count = userDataSnap.data.private.recommendedRecipes.length;
            Map<String, dynamic> map = userDataSnap.data.private.recommendedRecipes;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: count,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                String key = map.keys.elementAt(index);
                var countList = List.from(map[key]).length;
                return ListView.builder(
                    itemCount: countList,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int recipeIndex) {
                      return StreamBuilder(
                        stream: DatabaseService().recipe(map[key][recipeIndex]),
                        builder: (context, AsyncSnapshot<Recipe> recipeDataSnap) {
                          if(recipeDataSnap.data == null) return CircularProgressIndicator();
                          return StreamBuilder(
                            stream: DatabaseService().publicUserInfo(key),
                            builder: (context, AsyncSnapshot<PublicInfo> publicInfoSnap) {
                              if(publicInfoSnap.data == null) return CircularProgressIndicator();
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                                child: (
                                    HomeCard(
                                      title: recipeDataSnap.data.title,
                                      author: publicInfoSnap.data.name,
                                      authorRating: publicInfoSnap.data.authorRating.toString() + " / 10.0",
                                      recipeRating: recipeDataSnap.data.recipeRating.toString() + " / 10.0",
                                      authorImage: publicInfoSnap.data.profilePicture,
                                      links: recipeDataSnap.data.images,
                                      summary: recipeDataSnap.data.summary,
                                      detailedSummary: recipeDataSnap.data.detailedSummary,
                                      likes: recipeDataSnap.data.likes,
                                      dislikes: recipeDataSnap.data.dislikes,
                                    )
                                ),);
                            },
                          );
                        },
                      );}
                );
              },
            );
          },
        )
    );
  }
}