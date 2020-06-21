import 'package:flutter/material.dart';
import 'package:foodology/homeCard.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var links = [
    'https://www.gordonramsayrestaurants.com/assets/Uploads/_resampled/CroppedFocusedImage108081050-50-bsk-burger-recipe.jpg',
    'https://hips.hearstapps.com/esquireuk.cdnds.net/17/12/1024x660/gallery-1490119234-heston-burger.png?resize=480:*',
    'https://cdn.vox-cdn.com/thumbor/8La1AvcjQuLFHi-TzDuH4vgrBq0=/0x0:1280x868/1200x900/filters:focal(538x332:742x536):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62269647/Green_chile_cheeseburger_at_Mesa_Grill.6.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRjwFdAZnvYUF_jJ8Oft9TIZ8fFewZkpjvwCBd1lQzpeUDgvin&usqp=CAU',
    'https://media.lasvegasmagazine.com/media/img/photos/2017/08/23/Nosh_Gordon_Ramsay_Burger_LD_t1024.jpg?b3f067808e872500b33dd7ef4ee517933144b05a'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          children: <Widget>[
            HomeCard(
              title: "Ultimate Burger Recipe",
              author: "Gordon Ramsay",
              authorRating: "8.4 / 10.0",
              recipeRating: "9.5 / 10.0",
              authorImage: "https://cdn1.i-scmp.com/sites/default/files/styles/768x768/public/2014/09/18/ramsay-a.jpg?itok=eFz31vqq",
              links: links,
              summary: "This is a recipe called Ultimate Burger Recipe by Gordon Ramsay",
              detailedSummary: "Gordon Ramsay knows the kind of magic every burger needs. \"The secret is in the blend,\" Ramsay says. The celebrity chef, popular for his harsh criticism on shows like \"Hell's Kitchen\" and \"MasterChef,\" invited \"GMA\" into his Calabasas, California, mansion to show viewers how to put together the perfect burger. Ramsay calls his favorite burger the \"F-word,\" and he serves it at his burger restaurant inside Planet Hollywood in Las Vegas.",
            ),
            SizedBox(height: 20.0,),
            HomeCard(
              title: "Ultimate Burger Recipe",
              author: "Gordon Ramsay",
              authorRating: "8.4 / 10.0",
              recipeRating: "9.5 / 10.0",
              authorImage: "https://cdn1.i-scmp.com/sites/default/files/styles/768x768/public/2014/09/18/ramsay-a.jpg?itok=eFz31vqq",
              links: links,
              summary: "This is a recipe called Ultimate Burger Recipe by Gordon Ramsay",
              detailedSummary: "Gordon Ramsay knows the kind of magic every burger needs. \"The secret is in the blend,\" Ramsay says. The celebrity chef, popular for his harsh criticism on shows like \"Hell's Kitchen\" and \"MasterChef,\" invited \"GMA\" into his Calabasas, California, mansion to show viewers how to put together the perfect burger. Ramsay calls his favorite burger the \"F-word,\" and he serves it at his burger restaurant inside Planet Hollywood in Las Vegas.",
            ),
          ]
      ),
    );
  }
}