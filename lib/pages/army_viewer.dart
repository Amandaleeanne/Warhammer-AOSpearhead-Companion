import 'package:warhammer/global_imports.dart';
import 'package:warhammer/programming_utils/common/phase_view.dart';
import 'package:warhammer/programming_utils/common/unit_view.dart';

enum ViewType {unit, phase} //represents the different views
enum PhaseType{hero, move, ranged, charge, fight, endOfTurn}

class ArmyViewer extends StatefulWidget {
  final String spearheadName;
  final String enhancementPick;
  final String regimentPick;
  const ArmyViewer(this.spearheadName, this.enhancementPick, this.regimentPick, {super.key});
  @override
  State<ArmyViewer> createState() => _ArmyViewerState();
}

class _ArmyViewerState extends State<ArmyViewer> {
  ViewType _currentView = ViewType.unit;

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<WarhammerDatabase>(context, listen: false);
    //TODO: build the SQL Query to get data associated with pick and cache as a queryable table
    // final spearheadData = <USE widget.spearheadName,widget.enhancementPick, widget.regimentPick TO BUILD OUT ALL DATA NEEDED TO QUERY AND GET DATA NEEDED AND STORED>

    //return the UI
    return Scaffold(
      body: Column( //Change to Listview for an automatic safe area
        children: [      
          customAppBar(context),
          const SizedBox(height: 8),
          //ViewSwitching
            _buildViewToggle(),    
            const SizedBox(height: 8),
            _buildPersistentCarousel(),
        
            // --- BLUE CIRCLE: The Dynamic Content Area ---
            // Expanded ensures it fills the rest of the screen and updates dynamically.
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _currentView == ViewType.unit
                    ? _buildUnitViewContent()
                    : _buildPhaseViewContent(),
              ),
            ),
        ],
      ),
    );
  }

  ///---------------Custom App Bar + Helpers--------------

  ConstrainedBox customAppBar(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 250),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black54, Colors.black45],
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/MissingTexture256.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 152, 120, 161),
                    child: IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: Icon((Icons.arrow_back_ios_new)),
                      color: Colors.white,
                    ),
                  ),
                  backButtonAndTitle(context, widget.spearheadName.capitalize()),
                  actionButtons(),
                ],
              ),
            ),
          ),
        ),
      );

  Row backButtonAndTitle(BuildContext context, String name) 
  => Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black54,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  //TODO: Change this up to accept a function for the third argument to put into the onPressed
  Widget _buildButton({required IconData icon, required String label}) 
    => Expanded(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: Icon(icon),
        label: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
        onPressed: () {},
      ),
    );
  

  Row actionButtons() => Row(
        children: [
          _buildButton(icon: Icons.star_border, label: 'Save Configuration'),
          const SizedBox(width: 12),
          _buildButton(icon: Icons.add_circle_outline, label: 'Save Game State'), //TODO: Edit this for later vs modes
        ],
      );

// ------------------ Unit View / Phase view chip builder ---------------------
    // Toggle widget + Handler:
    Widget _buildViewToggle() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _toggleButton(
              title: 'Unit View',
              icon: Icons.check,
              isSelected: _currentView == ViewType.unit,
              onTap: () => setState(() => _currentView = ViewType.unit),
            ),
            _toggleButton(
              title: 'Phase View',
              icon: Icons.check,
              isSelected: _currentView == ViewType.phase,
              onTap: () => setState(() => _currentView = ViewType.phase),
            ),
          ],
        ),
      );
    }
    // The individual toggle chip styling
    Widget _toggleButton({required String title,required IconData icon, required bool isSelected, required VoidCallback onTap}) 
    =>Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF5A5568) : Colors.transparent, // Dark slate color from your image
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSelected) ...[
                  Icon(icon, color: Colors.white, size: 16),
                  const SizedBox(width: 6),
                ],
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    
                  ),
                ),
              ],
            ),
          ),
        ),
    );
    

/// ----------------------- Carosuel -------------------
  /// TODO: replace placeholder with actual carosel
    Widget _buildPersistentCarousel() {
      return Container(
        height: 140,
        width: double.infinity,
        color: Colors.grey[100], 
        child: const Center(
          child: Text(
            "Persistent Carousel Placeholder",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }
/// ------------------Unit View -------------------
  /// ---------------- Unit List ------------------------
    Widget _buildUnitViewContent() 
    => const UnitViewContent(
    key: ValueKey('UnitView'), // Keeps the main AnimatedSwitcher happy
  );

/// --------------------- Phase View -----------------------
/// 
  Widget _buildPhaseViewContent() 
  => const PhaseViewContent(
    key: ValueKey('PhaseView'), // Keeps the main AnimatedSwitcher happy
  );

}