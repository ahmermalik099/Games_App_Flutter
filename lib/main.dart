// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:games_api/screens/genre_screen.dart';
import 'package:games_api/screens/all_games_screen.dart';
import 'package:games_api/screens/profile_screen.dart';
import 'package:games_api/screens/search_screen.dart';
import 'package:games_api/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

String apiKey = 'de1bff7eb87b492aa96ba11091453d13';
String api =
    'https://api.rawg.io/api/games?page_size=100&key=de1bff7eb87b492aa96ba11091453d13';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gayman laso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayOneShotAnimation(),
    );
  }
}



//grid format
//get text in search =>Done
//genre api query
//fav option

//to do

//add genre screens


//native splash screen
// //app icon