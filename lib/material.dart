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
        //primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orangeAccent[700],
        fontFamily: 'Kreon',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Kreon',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle2: TextStyle(
                fontFamily: 'CormorantGaramond',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
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
