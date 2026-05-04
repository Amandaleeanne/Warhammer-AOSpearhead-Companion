import 'package:flutter/material.dart';
import 'package:warhammer/assets/dartDB/spearhead_database.dart';
import 'package:warhammer/pages/search_factions.dart';

class LandingPage extends StatelessWidget {
  final WarhammerDatabase db;
  const LandingPage({super.key, required this.db});

  @override
  //Main body
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultBar(),
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
            //New Game button
            Center(
            child: GestureDetector(
              //Functionality
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFactions(db : db))),
              //Look and feel
              child: Container(
                decoration: BoxDecoration( 
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(25),
                boxShadow: subtleBoxShadow()
                ),
                padding: EdgeInsets.all(25),
                child: Text("New Game", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
          ),

        ], //Stack Children end
      )
    );

  }

  //Styling elements
  List<BoxShadow> subtleBoxShadow(){
    return [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.19),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(5, 10),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.23),
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: Offset(5, 6),
                      )
                    ];
  }
  AppBar defaultBar()
    =>AppBar(
        title: Text(
          "Warhammer MVP",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
           ),
          ),
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.black,
        elevation: 4,
        centerTitle: true,
      );

}