import 'package:warhammer/global_imports.dart';
import 'package:warhammer/pages/pick_enhancement.dart';

class SearchFactions extends StatefulWidget {
  const SearchFactions({super.key});

  @override
  State<SearchFactions> createState() => _SearchFactionsState();
}

class _SearchFactionsState extends State<SearchFactions> {
  final SearchController _controller = SearchController();
//------------------------Build UI----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(),
      body: Center(
        child: SafeArea(
          child: Column( // Stack was unnecessary here unless adding background art
            children: [
              Spacer(),
              search(_controller),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
//----------------Styling elements---------------------

//-------------App bar---------------------
  AppBar bar()
    =>AppBar
    (
        leading: IconButton(onPressed: () => Navigator.maybePop(context), icon: Icon(Icons.arrow_back_ios_new), ),
        title: const Text(
          textAlign: TextAlign.start,
          "Back",
          style: TextStyle(
            fontSize: 15,
            color: Colors.deepPurpleAccent
          ),
        ), 
        backgroundColor: Colors.transparent
    );

// --------------------------- Search Controls -----------------------------------
  SearchAnchor search(SearchController controller) => SearchAnchor(
        viewBuilder: (suggestions) => ListView(children: suggestions.toList()),
        builder: (BuildContext context, controller) => searchBar(controller),
        suggestionsBuilder: (BuildContext context, controller) async {
          // Handle empty input to prevent searching for '%%'
          if (controller.text.isEmpty) {
            return const [ListTile(title: Text('Start typing to find a Spearhead...'))];
          }

          final String searchTerm = '%${controller.text}%';
          final db = Provider.of<WarhammerDatabase>(context, listen: false);
          final List<SearchSpearheadsResult> results =
              await db.searchSpearheads(searchTerm).get();
          if (results.isEmpty) {
            return const [ListTile(title: Text('No Spearheads found'))];
          }

          return results.map((result) => ListTile(
                leading: const Icon(Icons.shield),
                title: Text(result.s.name),
                subtitle: Text(result.armyName),
                trailing: IconButton(
                  onPressed: () {
                    controller.closeView(result.s.name);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PickEnhancement(result.s.name)),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
                onTap: () {
                  controller.closeView(result.s.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PickEnhancement(result.s.name)),
                  );
                },
              )).toList();
        },
      );
  ///Helps stylize the SearchController
  Padding searchBar(SearchController controller) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchBar(
          elevation: WidgetStateProperty.all(2.0),
          controller: controller,
          hintText: "Search For Spearheads",
          leading: CommonUtils.paddedIcon(icon: Icon(Icons.search)),
          trailing: [
            IconButton
            (
              icon: const Icon(Icons.close),
              onPressed: () => controller.clear(),
            )
          ],
          onTap: () {
            controller.openView();
          },
        ),
      );


}

