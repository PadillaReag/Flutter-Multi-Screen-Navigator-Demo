import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _isDarkMode = false; // State variable to track theme mode

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value; // Update the theme state
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
        actions: [
          Switch(
            value: _isDarkMode,
            onChanged: _toggleTheme,
          ),
        ],
      ),
      body: Container(
        width: screenWidth, // Set container width to screen width
        height: screenHeight, // Set container height to screen height
        color: _isDarkMode ? Colors.black : Colors.white, // Set background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is Screen 2',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Theme: ${_isDarkMode ? 'Dark Mode' : 'Light Mode'}',
              style: TextStyle(
                fontSize: 20,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
