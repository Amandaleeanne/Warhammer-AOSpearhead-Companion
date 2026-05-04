import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:convert';

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
              Expanded(
                flex: 1,
                child: Text(textAlign: TextAlign.end,
                  "Pick Army Enhancement",
                  style: TextStyle(
                    fontSize: 25.0
                  ),
                  )
                ),
              Expanded(
                flex: 3,
                child: Container(child: Text("Sample")))
            ],
          ),
        ),
      ),
    );
  }
}