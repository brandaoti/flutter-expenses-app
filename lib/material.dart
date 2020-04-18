import 'package:flutter/material.dart';
import './components/expenses_app.dart';

class TransactionMaterial extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    // Build Material
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Kreon',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Kreon',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle: TextStyle(
                fontFamily: 'CormorantGaramond',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Kreon',
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
        ),
      ),
      home: ExpensesApp(),
    );
  }
}
