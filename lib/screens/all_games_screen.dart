// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:games_api/api/api.dart';
import 'package:games_api/screens/search_screen.dart';

import '../models/games_model.dart';

class AllGames extends StatefulWidget {
  const AllGames({Key? key}) : super(key: key);

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {

  int pageNumber=1;
  String search='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(

          children: [
            TextField(

              onChanged: (value)=>search=value,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Search The Game',

                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(text: search,)));
                  },
                ),
              ),

              style: TextStyle(

              ),
            ),
            GameFutue(page: pageNumber,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(

                    ),
                    onPressed: () {
                      if(pageNumber>1)
                        {
                          pageNumber=pageNumber-1;
                          setState(() {
                            GameFutue(page: pageNumber,);
                          });
                        }

                    },
                    child: Text('Previous'),
                  ),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      pageNumber=pageNumber+1;
                      setState(() {
                        GameFutue(page: pageNumber,);
                      });
                    },
                    child: Text('Next'),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}


//after grid view
class GameFutue extends StatelessWidget {
  int page;
  GameFutue({required this.page});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Games>>(
        future: APIService().getGames(page),
        builder: (context,snapshot){

          if(snapshot.hasData){
            List<Games> movies=snapshot.data!;
            return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [...movies.map((games) => GameBox(games: games))]
            );
            //return Image.network(snapshot.data!['Poster']);
            //return Text(movie.Language);
            //return Text(movie.Title.toString());
          }
          else{
            return LinearProgressIndicator();
          }
        }

    )
    ;
  }
}



//before making grid view

// class GameFuture extends StatelessWidget {
//   const GameFuture({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Games>>(
//         future: APIService().getGames(),
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             List<Games> movies=snapshot.data!;
//             return Column(
//               children: [
//
//                 ...movies.map((games) => Column(
//                   children: [
//                     Container(
//                       height: 400,
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           style: BorderStyle.solid,
//                           width: 2,
//                           color: Colors.black26,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           //Text(" ID: ${games.id.toString()}"),
//                           Text(games.Name.toString(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30,
//                               //fontStyle: Fon
//                             ),
//
//                           ),
//                           SizedBox(
//                             child: Image.network(games.image),
//                             height: 300,
//                             width: double.infinity,
//                           ),
//                           Text(" Release Date: ${games.year}"),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 ),
//               ],
//             );
//
//           }
//           else{
//             return Text('No data');
//           }
//         }
//
//     );
//   }
// }


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
      child: Container(
        height: height*0.7,
        width: width*0.5,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            style: BorderStyle.solid,
            width: 2,
            color: Colors.black26,
          ),
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //Text(" ID: ${games.id.toString()}"),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(games.Name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  //fontStyle: Fon
                ),

              ),
            ),
            Image.network(games.image,fit: BoxFit.cover,),
            Text(" Release Date: ${games.year}"),
          ],
        ),
      ),
    );

  }
}
