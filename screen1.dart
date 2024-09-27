import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Reduce the image size by 50 pixels
    final double imageWidth = screenWidth; // Original width
    final double imageHeight = screenHeight - 50; // Original height minus 50 pixels

    return Scaffold(
      body: Center(
        child: Image.network(
          'https://i.imgur.com/OfCLJKt.png', // Direct image URL
          width: imageWidth,  // Set image width to screen width
          height: imageHeight, // Set image height to screen height minus 50
          fit: BoxFit.cover, // Ensure the image covers the available space
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Failed to load image.',
              style: TextStyle(color: Colors.red, fontSize: 18),
            );
          },
        ),
      ),
    );
  }
}
