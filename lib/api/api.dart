import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/games_model.dart';


class APIService {

  //api call JSON covert(serilization) will get all data
  Future<List<Games>> getGames(page) async {

    try{
     // final response = await http.get(Uri.parse("https://api.rawg.io/api/games?page_size=40&key=de1bff7eb87b492aa96ba11091453d13"));
      final response = await http.get(Uri.parse("https://api.rawg.io/api/games?page_size=40&page=${page}&key=de1bff7eb87b492aa96ba11091453d13"));
      // print(response.toString());
      // print('hhh');
      if(response.statusCode == 200) {

        final result = jsonDecode(response.body);
        //print(result.toString());
        Iterable list = result["results"];
        return list.map((game) => Games.fromJson(game)).toList();
      } else {
        throw Exception("Failed to load movies!");
      }
    }
    catch(e){
      print(e.toString());
    }
    return [];
  }


  //fetch data through search


  Future<List<Games>> fetchAllGames(text) async {
    try{
      final response = await http.get(Uri.parse("https://api.rawg.io/api/games?page_size=50&search=${text}&key=de1bff7eb87b492aa96ba11091453d13"));
      // print(response.toString());
      // print('hhh');
      if(response.statusCode == 200) {

        final result = jsonDecode(response.body);
        //print(result.toString());
        Iterable list = result["results"];
        return list.map((game) => Games.fromJson(game)).toList();
      } else {
        throw Exception("Failed To Load Games!");
      }
    }
    catch(e){
      print(e.toString());
    }
    return [];


  }

  Future<List<dynamic>> fetchAllGenre() async {
    try{
      final response = await http.get(Uri.parse("https://api.rawg.io/api/genres?key=de1bff7eb87b492aa96ba11091453d13"));
      // print(response.toString());
      // print('hhh');
      if(response.statusCode == 200) {

        final result = jsonDecode(response.body);
        //print(result.toString());
        List<dynamic> actionGames = result['results'];
       // print(actionGames);
        return actionGames;
        //return Games.fromJson(actionGames);
        //return actionGames.map((game) => Games.fromJson(game)).toList();
      } else {
        throw Exception("Failed To Load Games!");
      }
    }
    catch(e){
      print(e.toString());
    }
    return [];

  }

}