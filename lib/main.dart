import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_location.dart';
import 'package:world_time/Pages/home.dart';
import 'package:world_time/Pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/loading',
  routes: {
    '/home' : (context)=> Home() ,
    '/loading' : (context) => Loading() ,
    '/choose_location' : (context) => Location() ,
  },
));
