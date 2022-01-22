import 'package:flutter/material.dart';
import 'package:weather_app/Screen/secondPage.dart';
import 'package:weather_app/service/dayFun.dart';

class CardItem extends StatelessWidget {
  final DateTime day;
  final String ImageUrl ;
  final String mainwheather ;
  final String maxdegre ;
  final String mindegre ;
  final Map weatherOfCertinDay ;

  CardItem({required this.day,required this.ImageUrl,required this.mainwheather,required this.maxdegre,required this.mindegre,required this.weatherOfCertinDay});

  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){ Navigator.of(context).pushNamed(SecondPage.id,arguments: weatherOfCertinDay);},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        color: Colors.grey,
        child: Column(
          children: [
           Text(theDayIs(day.weekday)),
           Text('${day.day}/${day.month}'),
            Image.network(ImageUrl),
            Text(mainwheather),
            Text('$maxdegre/$mindegre'),
          ],
        ),
      ),
    );
  }
}
