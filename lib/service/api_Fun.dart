
import 'dart:convert';

import 'package:http/http.dart' as http;
getweatherdata() async {
  //var url='https://api.openweathermap.org/data/2.5/onecall?lat=33.510414&lon=36.278336&&appid=d982268529c13ce285426c259c65eb93'; Damascus api
  var url = 'https://api.openweathermap.org/data/2.5/onecall?lat=25.266666&lon=55.316666&&appid=d982268529c13ce285426c259c65eb93'; //Dubai api
  var respons = await http.get(Uri.parse(url));
  Map weathercase = jsonDecode(respons.body);


  return weathercase;
}