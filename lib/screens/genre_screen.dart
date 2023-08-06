// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:games_api/api/api.dart';
import 'package:games_api/screens/all_games_screen.dart';
import 'package:games_api/screens/search_screen.dart';

import '../models/games_model.dart';

class Genre extends StatefulWidget {
  const Genre({Key? key}) : super(key: key);

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> with SingleTickerProviderStateMixin{

  List<dynamic> genres=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGenres();
    _controller = TabController(vsync: this, length: 19);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {
        _currentIndex = _controller.index;
      });
    }
  }

  Future<void> getGenres() async{
    genres=await APIService().fetchAllGenre();
    print(genres[_currentIndex]);
    setState(() {
      genres;
    });
  }

  late TabController _controller;
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 19,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Select Your Favourite Genre',
            style: TextStyle(fontSize: 26, color: Colors.black),
          ),

          actions: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(90 / 360),
            )
          ],

          //bottom bar to select genre
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            indicator: BoxDecoration(color: Colors.transparent),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: Colors.black26,
            labelColor: Colors.red,
            automaticIndicatorColorAdjustment: false,
            tabs: [
              Text('Action'),
              Text('indie'),
              Text('Adventure'),
              Text('RPG'),
              Text('Strategy'),
              Text('Shooter'),
              Text('Casual'),
              Text('Simulation'),
              Text('Puzzle'),
              Text('Arcade'),
              Text('Platformer'),
              Text('Massively Multiplayer'),
              Text('Racing'),
              Text('Sports'),
              Text('Fighting'),
              Text('Family'),
              Text('Board Games'),
              Text('Educational'),
              Text('Card'),
            ],
          ),
        ),
        body: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Image.network(genres[_currentIndex]['image_background'],fit: BoxFit.cover,),
                ),
                SizedBox(height: 10,),
                genres.length>0 ?CategoryGrid(games: (genres[_currentIndex]['games']),): Container()
              ],
            ),
          ),
        )


      ),
    );
  }
}
class CategoryGrid extends StatelessWidget {
  final List<dynamic> games;
  const CategoryGrid({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            children: [...games.map((games) => GameBox(games: Games.fromJson(games)))]
        ),
    );
  }
}

//use this is want ot use grid view with gridview.count

// shrinkWrap: true,
// crossAxisCount: 2,
// children: [...games.map((games) => GameBox(games: Games.fromJson(games)))]




class GameBox extends StatelessWidget {
  const GameBox({Key? key,required this.games}) : super(key: key);

  final Games games;
  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.videogame_asset),
        title: Text(games.Name.toString()),
        tileColor: Colors.blueGrey,
      ),

      //use this if want to use grid view w container
      // child: Container(
      //  // height: height*0.1,
      //
      //   width: 200,
      //   height: 70,
      //   //width: width*0.45,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       style: BorderStyle.solid,
      //       width: 2,
      //       color: Colors.black26,
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       //Text(" ID: ${games.id.toString()}"),
      //       Text(games.Name.toString(),
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //           //fontStyle: Fon
      //         ),
      //
      //       ),
      //       //Image.network(games.image,fit: BoxFit.cover,),
      //       Text(" Game ID: ${games.id}"),
      //     ],
      //   ),
      // ),
    );

  }
}