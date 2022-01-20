import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String Location;
  String? time;
  String flag;
  String url ;
  String? data1 ;
  bool? isDayTime;
  WorldTime({required this.Location  ,required this.flag ,required this.url});

  Future<void> getTime() async
  {
    try {
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data) ;
      DateTime now = DateTime.parse(data['utc_datetime']);

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      data1 = DateFormat.jm().format(now);
    } catch(e)
    {
      data1 = 'Error' ;
    }

  }

}