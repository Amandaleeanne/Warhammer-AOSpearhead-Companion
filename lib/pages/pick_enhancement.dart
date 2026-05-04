import 'package:flutter/material.dart';
import 'package:warhammer/pages/pick_regiment.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:convert';
String dummy = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae auctor diam. Morbi ut tellus et elit tristique scelerisque. Proin eu urna mollis, varius ex id, rhoncus sem. Praesent euismod aliquam lectus ut vulputate. Nunc consectetur feugiat magna et pharetra. Vivamus in semper ipsum. Duis rutrum neque urna. Maecenas nulla quam, lobortis pretium arcu ac, ullamcorper laoreet eros. Aenean vehicula felis interdum, porta erat vitae, vehicula ligula. Vestibulum vestibulum feugiat purus, vel ultricies leo. Donec nec neque hendrerit, venenatis est vel, pharetra mauris. Suspendisse a ornare ex, sit amet pellentesque erat. Cras urna nisi, dapibus vitae eros id, vestibulum ultricies diam.";
class PickEnhancement extends StatelessWidget {
  final String searchResult;
  const PickEnhancement(this.searchResult, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Back"), backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Title text
              Expanded(
                child: Column(
                  children: [
                    Spacer(flex: 2,),
                     Text(textAlign: TextAlign.end,
                        "Pick Army Enhancement",
                         style: TextStyle(fontSize: 25.0),),
                    Spacer()
                  ],
                )
                ),

              //Select an ability
              Expanded(
                flex: 5,
                child: ListView( //after the card is complete need to make the list view builder to pull from the SQL database!
                  children: [
                    customCard("How often", "Get Ability Title Here", dummy, context),
                    customCard("How often", "Get Ability Title Here", dummy, context),
                    customCard("How often", "Get Ability Title Here", dummy, context),
                    customCard("How often", "Get Ability Title Here", dummy, context),
                    customCard("How often", "Get Ability Title Here", dummy, context),
                    customCard("How often", "Get Ability Title Here", dummy, context),
                  ],
                )
                )
            ],
          ),
        ),
      ),
    );
  }

///Building of the card asset, will be moved to the main stuff later
  Card customCard(String usage, String title, String description, BuildContext context) => Card(
    elevation: 5.0,
    
    // Populate data
    child: ListTile(
      onTap: () {
        //get the data of the ability to store and pass on
        Navigator.push(context, MaterialPageRoute(builder: (context) => PickRegiment(searchResult, "GETFROMDATABASE"))); //TODO: replace GETFROMDATABASE with the new selected result
      },
      title: Row(
        spacing: 10.0,
        children: [
          Spacer(), //vertical spacing
          Padding( //padding adds the horizontal spacing
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),),
          ),
          Spacer(flex: 4),
          Icon(Icons.abc_rounded)
        ],
      ),
      //Description stuff:
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(usage),
          Text(description),
        ],
      ),
    ),
  );


}