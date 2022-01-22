import 'package:flutter/material.dart';

class RowWidgetWithPadding extends StatelessWidget {
  final double screenHeight ;
  final double screenwidth  ;
  final Widget firstwidget  ;
  final Widget secondwidget ;



  const RowWidgetWithPadding({ required this.screenHeight,required this.screenwidth,required this.firstwidget,required this.secondwidget}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal:0.01*screenwidth,
        vertical: 0.01*screenHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstwidget,
          secondwidget
        ],

      ),
    );
  }
}
