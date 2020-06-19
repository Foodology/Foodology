import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  HomeCard({Key key}) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {

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
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                  backgroundImage: NetworkImage('https://cdn1.i-scmp.com/sites/default/files/styles/768x768/public/2014/09/18/ramsay-a.jpg?itok=eFz31vqq')
              ),
              title: Text('Ultimate Burger Recipe', style: TextStyle(fontSize: 20, letterSpacing: 1.0),),
              subtitle: Text('Gordon Ramsay'),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('8.4/10.0'),
                  Text('9.5/10.0')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              height: 100.0,
              child: Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: links.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                      width: 100.0,
                      child: Image.network(links[index], width: 200.0, height: 100.0, fit: BoxFit.fitHeight),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}