import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  ExpenseTrackerState createState() => ExpenseTrackerState();
}

class ExpenseTrackerState extends State<ExpenseTracker> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _needsController = TextEditingController();
  final TextEditingController _wantsController = TextEditingController();

  double _income = 0;
  double _needs = 0;
  double _wants = 0;
  double _savings = 0;

  void _calculateSavings() {
    setState(() {
      _income = double.tryParse(_incomeController.text) ?? 0;
      _needs = double.tryParse(_needsController.text) ?? 0;
      _wants = double.tryParse(_wantsController.text) ?? 0;
      _savings = _income - (_needs + _wants);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Enter monthly income and expenses:'),
          TextField(
            controller: _incomeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Monthly Income'),
          ),
          TextField(
            controller: _needsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Monthly Needs'),
          ),
          TextField(
            controller: _wantsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Monthly Wants'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateSavings,
            child: const Text('Calculate Savings'),
          ),
          const SizedBox(height: 20),
          Text('Savings: \$$_savings', style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
