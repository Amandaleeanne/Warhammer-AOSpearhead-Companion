import 'package:flutter/material.dart';
import 'package:warhammer/assets/dartDB/spearhead_database.dart';

///Empty non-constructed class that contains a bunch of common methods
class CommonUtils {

  Padding paddedIcon(Icon icon){
  return Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            );
}

  Card abilityViewer(WarhammerDatabase db){
    return Card(

    ); //TODO: fill out container!
  }
}

///This class takes all of the configurations and allows for an easy callback to the data to a sql method.
class ConfiguartionBuilder{
  final String spearheadName;
  final String enhancementName;
  final String regimentAbility;

  const ConfiguartionBuilder(WarhammerDatabase db, {required this.spearheadName, required this.enhancementName, required this.regimentAbility});


}