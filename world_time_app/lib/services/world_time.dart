
import 'dart:ffi';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime ({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {
    
    try {

    var address = Uri.https('worldtimeapi.org', '/api/timezone/$url');

    Response response = await get(address);
    Map data = jsonDecode(response.body);

    //   if (response.statusCode == 200) {
    //   Map data = jsonDecode(response.body);
    //   print(data);
    // } else {
    //   print('Request failed with status: ${response.statusCode}.');
    // }

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(datetime);
    // print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);
    isDaytime = now.hour > 6 && now.hour < 18 ;
    time = DateFormat.jm().format(now);

    }
    catch (e) {
      time = 'could not get time data';
    }

    
  }

}