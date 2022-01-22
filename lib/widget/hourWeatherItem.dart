import 'package:flutter/material.dart';
class HourWeatherItem extends StatelessWidget {
  final String imageUrl ;
  final DateTime hour ;
  final String mainweather ;
  final String temp ;

  const HourWeatherItem({required this.imageUrl,required this.hour,required this.mainweather,required this.temp}) ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text('${hour.hour}.${mainweather}'),
      trailing: Text(temp),
    );
  }
}
