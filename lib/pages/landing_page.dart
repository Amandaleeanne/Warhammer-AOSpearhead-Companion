import 'package:flutter/material.dart';
import 'package:warhammer/global_imports.dart';
import 'package:warhammer/pages/search_factions.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  //final db = Provider.of<UserDatabase>(context, listen: false); //Eventually..
  static const double NG_BUTTON_ELEVATION = 10;
  @override
//----------------Build UI-----------------------------------
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultBar(),
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Center(child: newGameButton(context)),
        ], //Stack Children end
      ),
    );
  }

//--------------------------Styling elements---------------------------------

  Row newGameButton(BuildContext context) 
  => Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    // 1. The Main "New Game" Button
    ElevatedButton(
      onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchFactions()),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: NG_BUTTON_ELEVATION,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20), // rounds only the left side
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.add_circle_outline, size: 24),
          SizedBox(width: 8),
          Text(
            'New Game',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),

    
    const SizedBox(width: 2), //for a visual gap, more flexable than a spacer

    newGameDropDown() 

  ],
);

String determineText() {
  try {
      return (GameSettings().isVsMode) ? 'New Single Game' : 'new VS Game';
  } catch (e) {
    return 'New Game';
  } 
}

PopupMenuButton<String> newGameDropDown() 
=>PopupMenuButton<String>(
    offset: Offset(-5, 58),
    elevation: NG_BUTTON_ELEVATION,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Colors.purple, width: 1)),
    constraints: const BoxConstraints(
    minWidth: 200, // Ensures it's at least this wide
  ),
    onSelected: (String value) {
      print("User selected: $value");
      if (value == 'Option 1') {
        // Do something for Option 1
      }
    },
    //Build options:
    itemBuilder: (BuildContext context) => [
      const PopupMenuItem<String>(
        value: 'Single Game',
        child: Text('Single Game'),
      ),
      const PopupMenuItem<String>(
        value: 'V.S Game',
        child: Text('V.S Game'),
      ),
    ],

    //Style what the button looks like:
    child: Material(
      color: Colors.deepPurple,
      elevation: NG_BUTTON_ELEVATION,
      borderRadius: const BorderRadius.horizontal(
        right: Radius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
          size: 24,
        ),
      ),
    ),
  );

  List<BoxShadow> subtleBoxShadow() =>
    [
      BoxShadow
      (
        color: Color.fromRGBO(0, 0, 0, 0.19),
        blurRadius: 20,
        spreadRadius: 0,
        offset: Offset(5, 10),
      ),
        BoxShadow
      (
        color: Color.fromRGBO(0, 0, 0, 0.23),
        blurRadius: 6,
        spreadRadius: 0,
        offset: Offset(5, 6),
      )
    ];

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