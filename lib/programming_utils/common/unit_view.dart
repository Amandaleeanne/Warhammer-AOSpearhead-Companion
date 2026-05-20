import 'package:warhammer/global_imports.dart';
import 'package:warhammer/programming_utils/dartDB/compiledSpearhead.dart';

class UnitViewContent extends StatefulWidget {
  final ActiveSpearhead db;
  const UnitViewContent({required this.db, super.key});

  @override
  State<UnitViewContent> createState() => _UnitViewContentState();
}

class _UnitViewContentState extends State<UnitViewContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.db.units.length, // Number of units to display
      separatorBuilder: (context, index) => const SizedBox(height: 6),
      itemBuilder: (context, index) { //Builds each info card
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Unit Avatar Placeholder
           _imageBuilder(70, 70, "assets/images/missingTexture.PNG", 16), //TODO: replace with correct image (gotta make it tho)
            const SizedBox(width: 16),
            
            // Unit Stats Columns
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.db.units[index].name.capitalize(),
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatColumn(label: 'Move', value: '${widget.db.units[index].move}"'),
                      _StatColumn(label: 'Health', value: '${widget.db.units[index].health}'),
                      _StatColumn(label: 'Control', value: '${widget.db.units[index].control}'),
                      _StatColumn(label: 'Save', value: '${widget.db.units[index].save}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            
            // Action Weapons Icons Placeholder -> need to dynamically update based on if there is a weapon or one
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: _determineIcons(index)
            ),
          ],
        );
      },
    );
  }

  Widget _determineIcons(int index)
  {
    ActiveUnit currUnit = widget.db.units[index];
    if (currUnit.hasRangedWeapon && currUnit.hasMeleeWeapon)
    {
      return _drawMeleeAndRangedIcons();
    } else if (currUnit.hasRangedWeapon && !currUnit.hasMeleeWeapon)
    {
      return _drawRangedIcon();
    }else if(!currUnit.hasRangedWeapon && currUnit.hasMeleeWeapon)
    {
      return _drawMeleeIcon();
    }
    return Column(children: [Text("ERROR!")],); //uh oh completed with an error!

  }

  Widget _drawRangedIcon()
  =>_imageBuilder(40, 40, "assets/images/bow.png", 1); //TODO: replace with ranged icon

  Widget _drawMeleeIcon()
  =>_imageBuilder(40, 40, "assets/images/swordBlank.png", 1); //TODO: replace with ranged icon

  Column _drawMeleeAndRangedIcons()
  =>Column(
        children: [
          _drawMeleeIcon(),
          SizedBox(height: 8),
          _drawRangedIcon()
        ]
      );

  //Image builder
  Widget _imageBuilder(double width, double height, String path, double radius) 
  => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent, // Fallback background color while loading
          borderRadius: BorderRadius.circular(radius), 
          image: DecorationImage(
            image: AssetImage(path), 
            fit: BoxFit.scaleDown, 
          ),
        ),
      );
}

// Small helper widget for the stat layout columns
class _StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}