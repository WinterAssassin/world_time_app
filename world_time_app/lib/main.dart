import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(BuildContext context) => const Loading(),
      '/home' :(BuildContext context) => const Home(),
      '/location' :(BuildContext context) => const ChooseLocation()
    },
  )
  );
}

