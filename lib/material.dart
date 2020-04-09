import 'package:flutter/material.dart';
import './components/expenses_app.dart';

class TransactionMaterial extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    // Build Material
    return MaterialApp(
      home: ExpensesApp(),
    );
  }
}
