import 'package:flutter/material.dart';
// Note: Ensure this path matches your move to the 'lib' folder!
import 'package:warhammer/assets/dartDB/spearhead_database.dart'; 
import 'package:warhammer/pages/pick_enhancement.dart';

class SearchFactions extends StatefulWidget {
  final WarhammerDatabase db;
  const SearchFactions({super.key, required this.db});

  @override
  State<SearchFactions> createState() => _SearchFactionsState();
}

class _SearchFactionsState extends State<SearchFactions> {
  final SearchController _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Back"), backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Column( // Stack was unnecessary here unless adding background art
          children: [
            search(_controller),
          ],
        ),
      ),
    );
  }

  SearchAnchor search(SearchController controller) => SearchAnchor(
        viewBuilder: (suggestions) => ListView(children: suggestions.toList()),
        builder: (BuildContext context, controller) => searchBar(controller),
        suggestionsBuilder: (BuildContext context, controller) async {
          // Handle empty input to prevent searching for '%%'
          if (controller.text.isEmpty) {
            return const [ListTile(title: Text('Start typing to find a Spearhead...'))];
          }

          final String searchTerm = '%${controller.text}%';

          // Use widget.db to access the database from the State class instead of direct acsess
          final List<SearchSpearheadsResult> results = 
              await widget.db.searchSpearheads(searchTerm).get();

          if (results.isEmpty) {
            return const [ListTile(title: Text('No Spearheads found'))];
          }

          return results.map((result) => ListTile(
                leading: const Icon(Icons.shield),
                title: Text(result.s.name),
                subtitle: Text(result.armyName),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  controller.closeView(result.s.name);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PickEnhancement(result.s.name)),
                  );
                },
              )).toList();
        },
      );

  Padding searchBar(SearchController controller) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchBar(
          elevation: WidgetStateProperty.all(2.0),
          controller: controller,
          hintText: "Search For Spearheads",
          leading: paddedIcon(const Icon(Icons.search)),
          trailing: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => controller.clear(),
            )
          ],
          onTap: () {
            controller.openView();
          },
        ),
      );

  Padding paddedIcon(Icon icon) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      );
}