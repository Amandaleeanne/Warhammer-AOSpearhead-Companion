//this script takes anything saved from compiled spearhead and turns it into SQLite data. 
//the class that is created contains references to a bunch of ID's that the favorited spearhead has
//encoding only needs to be done once, otherwise the main function and effecianct needs to come from the decoding process. THough I am 
//not sure I can get better than O(n) though, which is okay

//when the second part of the script is called, the specific SQLite table is then reconvered and put into the compiledSearhead class.

//using ID's instead of the data allows for no duplication and only references the data :D


/**
 * Design of the SQLite userInfo database:
 * Will have a connection table that stores 10 of the most recently selected database (an id to a column from compiledSpearhead)
 * 
 * compiledSpearhead: 
 * spearheadName: TEXT (string) to the name of the spearhead 
 * Units: TEXT (string) of a bunch of csv ints is the ID to the units using JsonEncode
 * abilities: TEXT (string) of a bunch of csv ints each is the ID to the ability
 * regimentAbility: int ID to the CompiledSpearheadAbility (selectedRegimentAbility) 
 * enhancement: int ID to the CompiledSpearheadAbility (selectedRegimentAbility)
 * 
 */