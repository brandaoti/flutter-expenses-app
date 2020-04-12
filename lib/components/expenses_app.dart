import 'package:flutter/material.dart';
import 'dart:math';

import '../model/transaction.dart';
import './transaction_list.dart';
import './transaction_form.dart';

class ExpensesApp extends StatefulWidget {
  //
  @override
  _ExpensesAppState createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  // List
  final _transaction = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de água',
      value: 33.33,
      date: DateTime.now(),
    ),
    // add novas informações pra testar a lista;
  ];

  @override
  Widget build(BuildContext context) {
    // Implements Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            // Exibindo formulario de texto
            TransactionForm(),
            // Exibindo lista de informações
            TransactionList(_transaction),
          ],
        ),
      ),
    );
  }
}
