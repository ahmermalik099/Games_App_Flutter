// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../api/api.dart';
import '../models/games_model.dart';


class SearchScreen extends StatefulWidget {

  String text='';

  SearchScreen({required this.text});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  //String searchText=text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        leading: BackButton(
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'RawGamers',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            FutureBuilder<List<Games>>(
                future: APIService().fetchAllGames(widget.text),
                builder: (context,snapshot){

                  if(snapshot.hasData){
                    List<Games> games=snapshot.data!;
                    return Column(
                      children: [
                        // TextField(
                        //   decoration: InputDecoration(
                        //     prefixIcon: Icon(Icons.search),
                        //     border: OutlineInputBorder(),
                        //     hintText: 'Search The Game',
                        //
                        //     suffixIcon: IconButton(
                        //       icon: Icon(Icons.send),
                        //       onPressed: (){},
                        //     ),
                        //   ),
                        //
                        //   style: TextStyle(
                        //
                        //   ),
                        // ),

                        ...games.map((games) => Column(
                          children: [
                            Container(
                              height: 400,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black26,
                                ),
                              ),
                              child: Column(
                                children: [
                                  //Text(" ID: ${games.id.toString()}"),
                                  Text(games.Name.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      //fontStyle: Fon
                                    ),

                                  ),
                                  SizedBox(
                                    child: Image.network(games.image),
                                    height: 300,
                                    width: double.infinity,
                                  ),
                                  Text(" Release Date: ${games.year}"),
                                ],
                              ),
                            )
                          ],
                        ),
                        ),
                      ],
                    );

                    //return Image.network(snapshot.data!['Poster']);
                    //return Text(movie.Language);
                    //return Text(movie.Title.toString());
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }

            ),

          ],
        ),
      ),
    );
  }
}
