import 'package:flutter/material.dart';
import 'package:weather_app/modal/card.dart';
import 'package:weather_app/modal/hourweather.dart';
import 'package:weather_app/service/api_Fun.dart';
import 'package:weather_app/widget/cardItem.dart';
import 'package:weather_app/widget/hourWeatherItem.dart';
import 'package:weather_app/widget/rowWidgetWithPadding.dart';

import '../service/dayFun.dart';
class PortrayFirstPage extends StatelessWidget {
  final double _height ;
  final double _width ;
  final PageController pc ;

  const PortrayFirstPage( this._height, this._width, this.pc) ;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getweatherdata(),
      builder: (context, snapshot) {
        DateTime _today=DateTime.fromMillisecondsSinceEpoch((snapshot.data as Map)["current"]["dt"]*1000) ;
        List<DayCard> daycardlist=[];
        for(int i=1 ;i<6;i++){
          daycardlist.add(
              DayCard(
                  day: DateTime.fromMillisecondsSinceEpoch(((snapshot.data! as Map)['daily'][i]['dt'])*1000),
                  ImageUrl: 'http://openweathermap.org/img/wn/${((snapshot.data! as Map)['daily'][i]['weather'][0]["icon"].toString())}@2x.png',
                  mainwheather: ((snapshot.data! as Map)['daily'][i]['weather'][0]['main']).toString(),
                  maxdegre: ((snapshot.data! as Map)['daily'][i]['temp']['max']-273).toStringAsFixed(0),
                  mindegre: ((snapshot.data! as Map)['daily'][i]['temp']['min']-273).toStringAsFixed(0),
                  weatherOfCertinDay:(snapshot.data! as Map)['daily'][i]
              )

          ) ;
        }
        List<hourWeather> listhourweather=[];
        for(int i=0;i<48;i++){
          if(DateTime.fromMillisecondsSinceEpoch(((snapshot.data! as Map)['hourly'][i]['dt'])*1000).day==_today.day){
            listhourweather.add(hourWeather(
              imageUrl: 'http://openweathermap.org/img/wn/${((snapshot.data! as Map)['hourly'][i]['weather'][0]["icon"].toString())}@2x.png',
              hour: DateTime.fromMillisecondsSinceEpoch(((snapshot.data! as Map)['hourly'][i]['dt'])*1000),
              mainweather: ((snapshot.data! as Map)['hourly'][i]['weather'][0]['main']).toString(),

              temp: ((snapshot.data! as Map)['hourly'][i]['temp']-273).toStringAsFixed(0),
            ));
          }
        }
        return SafeArea(
          child: Scaffold(
            body: snapshot.data==null? Center(child:Text('wait network')):SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowWidgetWithPadding(
                      screenHeight: _height,
                      screenwidth: _width,
                      firstwidget: Text('Dubai',style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),),
                      secondwidget:Text('${theDayIs(_today.weekday)} ${_today.day}/${_today.month}/${_today.year}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal))),
                  RowWidgetWithPadding(
                    screenHeight: _height,
                    screenwidth: _width,
                    firstwidget: Text(((snapshot.data! as Map)['current']['weather'][0]["main"]).toString(),style: TextStyle(fontSize: 24),),
                    secondwidget: Text('${((snapshot.data! as Map)['daily'][0]['temp']['max']-273).toStringAsFixed(0)}/${((snapshot.data! as Map)['daily'][0]['temp']['min']-273).toStringAsFixed(0)}',style: TextStyle(fontSize: 24),),),
                  RowWidgetWithPadding(
                    screenHeight: _height,
                    screenwidth: _width,
                    firstwidget: Image.network('http://openweathermap.org/img/wn/${((snapshot.data! as Map)['current']['weather'][0]["icon"]).toString()}@2x.png'),
                    secondwidget:Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(((snapshot.data! as Map)['current']['temp']-273).toStringAsFixed(0),style: TextStyle(fontSize: 200,fontWeight: FontWeight.bold)),
                        ) ,
                        Positioned(child: Text('oc',style: TextStyle(fontSize: 24),),
                          right: 0,
                          top: 50,)
                      ],

                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 0.01*_width,
                      vertical: 0.01*_height,
                    ),
                    child: Text('5-day Forecast',style: TextStyle(fontSize: 24),),
                  ),
                  Container(
                    height: 300,
                    child: PageView(
                      controller: pc,
                      children: daycardlist.map((daycard) =>
                          CardItem(day: daycard.day,
                            ImageUrl: daycard.ImageUrl,
                            mainwheather: daycard.mainwheather,
                            maxdegre: daycard.maxdegre,
                            mindegre: daycard.mindegre,
                            weatherOfCertinDay:daycard.weatherOfCertinDay ,
                          )).toList(),
                    ),
                  ),
                  Container(
                    height: 600,
                    child: ListView(
                      children: listhourweather.map((hourweather) =>
                          HourWeatherItem(imageUrl: hourweather.imageUrl,
                              hour: hourweather.hour,
                              mainweather: hourweather.mainweather,
                              temp: hourweather.temp)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },) ;
  }
}
