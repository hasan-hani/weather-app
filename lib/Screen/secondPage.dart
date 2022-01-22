import 'package:flutter/material.dart';
import 'package:weather_app/widget/rowWidgetWithPadding.dart';

import '../service/dayFun.dart';

class SecondPage extends StatelessWidget {
  static String id='SecondPage' ;
  @override
  Widget build(BuildContext context) {
    Map weathermap=ModalRoute.of(context)!.settings.arguments as Map ;
    DateTime _today=DateTime.fromMillisecondsSinceEpoch((weathermap['dt'])*1000)  ;
    double _height=MediaQuery.of(context).size.height ;
    double _width=MediaQuery.of(context).size.width ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            RowWidgetWithPadding(
              screenHeight: _height,
              screenwidth: _width,
              firstwidget: Text('Dubai',style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),),
              secondwidget: Text('${theDayIs(_today.weekday)} ${_today.day}/${_today.month}/${_today.year}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal)),
            ),
            RowWidgetWithPadding(
              screenHeight: _height,
              screenwidth: _width,
              firstwidget:  Text((weathermap['weather'][0]["main"]).toString(),style: TextStyle(fontSize: 24),),
              secondwidget:  Text('${(weathermap['temp']['max']-273).toStringAsFixed(0)}/${(weathermap['temp']['min']-273).toStringAsFixed(0)}',style: TextStyle(fontSize: 24),),
            ),
            RowWidgetWithPadding(
              screenHeight: _height,
              screenwidth: _width,
              firstwidget: Image.network('http://openweathermap.org/img/wn/${weathermap['weather'][0]['icon']}@2x.png'),
              secondwidget:   Text((weathermap['temp']['day']-273).toStringAsFixed(0),style: TextStyle(fontSize: 200,fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      ),
    );
  }
}
