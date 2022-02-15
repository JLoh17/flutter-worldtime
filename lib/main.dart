import 'package:flutter/material.dart';
import 'package:ninja03_worldtime/pages/home.dart'; // another method of importing
import 'package:ninja03_worldtime/pages/loading.dart'; // another method of importing
import 'package:ninja03_worldtime/pages/choose_location.dart'; // another method of importing

void main() => runApp(MaterialApp(
      initialRoute: '/', // this overrides the first screen
      routes: {
        '/': (context) => Loading(), // the first screen
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
