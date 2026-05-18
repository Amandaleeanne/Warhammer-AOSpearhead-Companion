import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: CustomAppBar())));

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 250, // The maximum height ceiling
      ),
      child: Container(
        width: double.infinity, // Fills the full width of the screen
        decoration: const BoxDecoration(
          // Gradient overlay combined with background image
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black54, Colors.black45],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/MissingTexture256.png"), // Replace with your asset
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false, // Keeps padding tight around the top status bar
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // shrink-wraps vertically up to maxHeight
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Top Row: Back Button & Title ---
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Army Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Flexible spacer that grows, but won't exceed the ConstrainedBox
                const SizedBox(height: 40), 

                // --- Bottom Row: Action Buttons ---
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.star_border),
                        label: const Text(
                          'Favorite Configuration',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text(
                          'Save Game State',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}