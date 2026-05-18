import 'package:warhammer/global_imports.dart';

enum PhaseSubView { hero, move, ranged, charge, fight, endOfTurn }

class PhaseViewContent extends StatefulWidget {
  const PhaseViewContent({super.key});

  @override
  State<PhaseViewContent> createState() => _PhaseViewContentState();
}

class _PhaseViewContentState extends State<PhaseViewContent> {
  PhaseSubView _currentSubView = PhaseSubView.hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- SECONDARY TOGGLE: Unified Container (Same look & feel) ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.all(4), // Inner padding around the selection pills
            decoration: BoxDecoration(
              color: Colors.grey[200], // Unified background container
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                _segmentedTab('Hero', PhaseSubView.hero),
                _segmentedTab('Move', PhaseSubView.move),
                _segmentedTab('Ranged', PhaseSubView.ranged),
                _segmentedTab('Charge', PhaseSubView.charge),
                _segmentedTab('Fight', PhaseSubView.fight),
                _segmentedTab('End', PhaseSubView.endOfTurn)
              ],
            ),
          ),
        ),

        // --- SUB-VIEW CONTENT AREA ---
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _buildSubViewBody(),
          ),
        ),
      ],
    );
  }

  // Helper widget to build a unified segment item
  Widget _segmentedTab(String label, PhaseSubView viewType) {
    final bool isSelected = _currentSubView == viewType;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentSubView = viewType;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // When selected, it gets the dark theme color pill background
            color: isSelected ? const Color(0xFF5A5568) : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 13, // Slightly smaller to comfortably fit 6 items across the screen
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubViewBody() {
    switch (_currentSubView) {
      case PhaseSubView.hero:
        return const Center(key: ValueKey('hero'), child: Text('Hero Phase Controls'));
      case PhaseSubView.move:
        return const Center(key: ValueKey('move'), child: Text('Movement Grid/Tools'));
      case PhaseSubView.ranged:
        return const Center(key: ValueKey('ranged'), child: Text('Ranged Combat Tools'));
      case PhaseSubView.charge:
        return const Center(key: ValueKey('charge'), child: Text('Charge Rules & Distance'));
      case PhaseSubView.fight:
        return const Center(key: ValueKey('fight'), child: Text('Melee Phase Dashboard'));
      case PhaseSubView.endOfTurn:
        return const Center(key: ValueKey('fight'), child: Text('End Of turn shennanigans'));
    }
  }
}