import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  final TextEditingController _controller = TextEditingController();
  List<String> _submittedTexts = [];

  void _addText() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _submittedTexts.add(_controller.text); // Add text to the list
        _controller.clear(); // Clear the input field
      });
    }
  }

  void _deleteText(int index) {
    setState(() {
      _submittedTexts.removeAt(index); // Remove text from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addText,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _submittedTexts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_submittedTexts[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteText(index), // Call delete function
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
