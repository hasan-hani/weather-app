import 'package:flutter/material.dart';
import 'package:weather_app/Screen/landscapeFirstPage.dart';
import 'package:weather_app/Screen/portrayFirstPage.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  static String id='FirstPage' ;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  PageController pc =PageController(
       initialPage: 2,
      viewportFraction: 0.25);
  @override
  Widget build(BuildContext context) {
    double _height=MediaQuery.of(context).size.height ;
    double _width=MediaQuery.of(context).size.width ;
    
    return MediaQuery.of(context).orientation==Orientation.portrait? 
    PortrayFirstPage(_height, _width, pc):LandscapFirstPage(_height, _width, pc) ;
  }
}
