import 'package:warhammer/global_imports.dart';

class UnitViewContent extends StatefulWidget {
  const UnitViewContent({super.key});

  @override
  State<UnitViewContent> createState() => _UnitViewContentState();
}

class _UnitViewContentState extends State<UnitViewContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 8, // Number of units to display
      separatorBuilder: (context, index) => const SizedBox(height: 6),
      itemBuilder: (context, index) { //Builds each info card
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Unit Avatar Placeholder
           imageBuilder(70, 70, "assets/images/missingTexture.PNG"),
            const SizedBox(width: 16),
            
            // Unit Stats Columns
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unit name',
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _StatColumn(label: 'Move', value: '0"'),
                      _StatColumn(label: 'Health', value: '5'),
                      _StatColumn(label: 'Control', value: '2'),
                      _StatColumn(label: 'Save', value: '5+'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            
            // Action Weapons Icons Placeholder
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                children: [
                  imageBuilder(40, 40, "assets/images/missingTexture.PNG"),
                  SizedBox(height: 8),
                  imageBuilder(40, 40, "assets/images/missingTexture.PNG"),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  //Image builder
  Widget imageBuilder(double width, double height, String path) 
  => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[200], // Fallback background color while loading
          borderRadius: BorderRadius.circular(12), 
          image: DecorationImage(
            image: AssetImage(path), 
            fit: BoxFit.cover, 
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