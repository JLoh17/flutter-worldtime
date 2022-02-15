import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time = ''; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  // if we want to use await on a custom async function in "loading.dart' instance, we need to put Future
  Future<void> getTime() async {
    // Placeholder value until the function is complete, future is a temp placeholder value
    // make the request

    try {
      Response response = await get(
        Uri.http('worldtimeapi.org', '/api/timezone/$url'),
      );
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour >= 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      // print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
