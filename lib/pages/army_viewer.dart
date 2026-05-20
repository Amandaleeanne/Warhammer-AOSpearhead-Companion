import 'package:warhammer/global_imports.dart';
import 'package:warhammer/programming_utils/common/phase_view.dart';
import 'package:warhammer/programming_utils/common/unit_view.dart';
import 'package:warhammer/programming_utils/dartDB/compiledSpearhead.dart';

enum ViewType {unit, phase} //represents the different views
enum PhaseType{hero, move, ranged, charge, fight, endOfTurn}

class ArmyViewer extends StatefulWidget {
  final String spearheadName;
  final int enhancementPick;
  final int regimentPick;
  const ArmyViewer(this.spearheadName, this.enhancementPick, this.regimentPick, {super.key});
  @override
  State<ArmyViewer> createState() => _ArmyViewerState();
}

class _ArmyViewerState extends State<ArmyViewer> {
  // --- Class specific stuff ----------

  ViewType _currentView = ViewType.unit;
  
  // Local synchronous state variables
  ActiveSpearhead? _spearheadData;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  ///Allows for regular initalization plus cuztom database connectivity
  void initState() { // __init__
    super.initState();
    _loadSpearheadData();
  }

  ///handles and starts async fetch
  Future<void> _loadSpearheadData() async {
    try {
      final data = await Provider.of<WarhammerDatabase>(context, listen: false)
          .getActiveSpearhead(
            spearheadName: widget.spearheadName, 
            enhancementAbilityId: widget.enhancementPick, 
            regimentAbilityId: widget.regimentPick,
          );

      if (mounted) {
        setState(() {
          _spearheadData = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    }
  }

  // ------- Start creating UI ------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( //NOTE: Change to Listview for an automatic safe area
        children: [      
          _customAppBar(context),
          SizedBox(height: 8),
          //ViewSwitching
          _buildViewToggle(),    
          SizedBox(height: 8),
          
          //Contitional loadout branching based on state of data
          if (_isLoading) //Is it loading? Make a progress bar
            Expanded(
              child: Column(
              children: [
                  _buildLoadingCarouselPlaceholder(),
                  Expanded(child: Center(child: CircularProgressIndicator())),
                ],
              ),
            )
          else if (_hasError || _spearheadData == null) // Oh no an error!
            Expanded(child: Center(child: Text('Error loading army viewer data')))

          else ...[ //No more waiting needed, build needed data.
            _buildPersistentCarousel(_spearheadData!),
            SizedBox(height: 8),
            _buildAnimatedContentView(_spearheadData!),
          ],
        ],
      ),
    );
  }

  ///---------------Custom App Bar + Helpers--------------

  ConstrainedBox _customAppBar(BuildContext context) 
  => ConstrainedBox(
        constraints:  BoxConstraints(maxHeight: 250),
        child: Container(
          width: double.infinity,
          decoration: _customAppBarBackgroundImage(),
          //Front content + moves it out of the way of mobile OS stuff.
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor:  Color.fromARGB(255, 152, 120, 161),
                    child: IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: Icon((Icons.arrow_back_ios_new)),
                      color: Colors.white,
                    ),
                  ),
                  _backButtonAndTitle(context, widget.spearheadName.capitalize()),
                  _actionButtons(),
                ],
              ),
            ),
          ),
        ),
      );

  BoxDecoration _customAppBarBackgroundImage()
  => BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black54, Colors.black45],
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/MissingTexture256.png"),
              fit: BoxFit.cover,
            ),
          );

  Widget _backButtonAndTitle(BuildContext context, String name) 
  => Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
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
  

  Row _actionButtons() => Row(
        children: [
          _buildButton(icon: Icons.star_border, label: 'Save Configuration'),
          SizedBox(width: 12),
          _buildButton(icon: Icons.add_circle_outline, label: 'Save Game State'), //TODO: Edit this for later vs modes
        ],
      );

// ------------------ Unit View / Phase view chip builder ---------------------
    // Toggle widget + Handler:
    Widget _buildViewToggle() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(4),
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

    // ----- Individual toggle chip styling -----
    Widget _toggleButton({required String title,required IconData icon, required bool isSelected, required VoidCallback onTap}) 
    =>Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ?  Color(0xFF5A5568) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSelected) ...[
                  Icon(icon, color: Colors.white, size: 16),
                  SizedBox(width: 6),
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
    

/// ----------------------- Carousel Helpers -------------------

    Widget _buildLoadingCarouselPlaceholder() 
    => Container(
        height: 140,
        width: double.infinity,
        color: Colors.grey[100],
        child: Center(child: LinearProgressIndicator()),
      );

    Widget _buildPersistentCarousel(ActiveSpearhead db) 
    => Container(
        height: 140,
        width: double.infinity,
        color: Colors.grey[100], 
        child: Center(child: Text(" ")),
      );

/// ----------- Content Views & Transitions ------------------

    Widget _buildAnimatedContentView(ActiveSpearhead db) 
    => Expanded(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          reverseDuration: Duration(milliseconds: 200),
          switchInCurve: Curves.easeInOutCubic,
          switchOutCurve: Curves.easeInCubic,
          layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                ...previousChildren,
                ?currentChild,
              ],
            );
          },
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.97, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          child: _currentView == ViewType.unit 
              ? _buildUnitViewContent(db) 
              : _buildPhaseViewContent(db),
        ),
      );

  /// ---------------- Individual Unit Cards ------------------------
  Widget _buildUnitViewContent(ActiveSpearhead db) 
  => UnitViewContent(db: db, key: ValueKey('UnitView'));

  /// --------------------- Phase View -----------------------
  Widget _buildPhaseViewContent(ActiveSpearhead db) 
  => PhaseViewContent(db: db, key: ValueKey('PhaseView'));

}