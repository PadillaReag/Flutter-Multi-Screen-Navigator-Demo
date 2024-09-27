import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    final double? firstNumber = double.tryParse(_firstNumberController.text);
    final double? secondNumber = double.tryParse(_secondNumberController.text);

    if (firstNumber == null || secondNumber == null) {
      setState(() {
        _result = 'Please enter valid numbers';
      });
      return;
    }

    double calculationResult;

    switch (operation) {
      case 'add':
        calculationResult = firstNumber + secondNumber;
        _result = 'Result: $calculationResult';
        break;
      case 'subtract':
        calculationResult = firstNumber - secondNumber;
        _result = 'Result: $calculationResult';
        break;
      case 'multiply':
        calculationResult = firstNumber * secondNumber;
        _result = 'Result: $calculationResult';
        break;
      case 'divide':
        if (secondNumber == 0) {
          _result = 'Cannot divide by zero';
        } else {
          calculationResult = firstNumber / secondNumber;
          _result = 'Result: $calculationResult';
        }
        break;
      default:
        _result = 'Unknown operation';
    }

    setState(() {}); // Refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('subtract'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('multiply'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('divide'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
