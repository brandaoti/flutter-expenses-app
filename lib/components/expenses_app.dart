import 'package:flutter/material.dart';
import 'dart:math';

import '../model/transaction.dart';

class ExpensesApp extends StatefulWidget {
  //
  @override
  _ExpensesAppState createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final _transaction = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de água',
      value: 33.33,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    // Implements Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              elevation: 5,
              color: Colors.green,
              child: Text('Gráfico', style: TextStyle(fontSize: 24)),
            ),
          ),
          // Exibindo lista de informações
          Column(
            children: _transaction.map((tr) {
              return Card(
                child: Text(tr.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
