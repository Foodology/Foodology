import 'package:flutter/material.dart';
import 'package:foodology/homeCard.dart';
import 'package:foodology/models/recipe.dart';
import 'package:foodology/models/userInfo.dart';
import 'package:foodology/services/database.dart';
import 'package:provider/provider.dart';

class CreateHomeCards extends StatefulWidget {
  CreateHomeCards({Key key}) : super(key: key);

  @override
  _CreateHomeCardsState createState() => _CreateHomeCardsState();
}

class _CreateHomeCardsState extends State<CreateHomeCards> {

  var links = [
    'https://www.gordonramsayrestaurants.com/assets/Uploads/_resampled/CroppedFocusedImage108081050-50-bsk-burger-recipe.jpg',
    'https://hips.hearstapps.com/esquireuk.cdnds.net/17/12/1024x660/gallery-1490119234-heston-burger.png?resize=480:*',
    'https://cdn.vox-cdn.com/thumbor/8La1AvcjQuLFHi-TzDuH4vgrBq0=/0x0:1280x868/1200x900/filters:focal(538x332:742x536):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62269647/Green_chile_cheeseburger_at_Mesa_Grill.6.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRjwFdAZnvYUF_jJ8Oft9TIZ8fFewZkpjvwCBd1lQzpeUDgvin&usqp=CAU',
    'https://media.lasvegasmagazine.com/media/img/photos/2017/08/23/Nosh_Gordon_Ramsay_Burger_LD_t1024.jpg?b3f067808e872500b33dd7ef4ee517933144b05a'
  ];

  @override
  Widget build(BuildContext context) {

    final rs = Provider.of<List<Recipe>>(context) ?? [];

    return Center(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
        itemCount: rs.length,
        itemBuilder: (BuildContext context, int index) {
          Recipe r = rs[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
            child: (
                HomeCard(
                  title: r.data.title,
                  author: r.data.author,
                  authorRating: r.data.authorRating.toString() + " / 10.0",
                  recipeRating: r.data.recipeRating.toString() + " / 10.0",
                  authorImage: "https://cdn1.i-scmp.com/sites/default/files/styles/768x768/public/2014/09/18/ramsay-a.jpg?itok=eFz31vqq",
                  links: links,
                  summary: r.data.summary,
                  detailedSummary: r.data.detailedSummary,
                )
            ),
          );
        },
      ),
    );
  }
}