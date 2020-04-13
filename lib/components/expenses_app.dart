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
  final List<Transaction> _transaction = [];

  // chamar no Transactonform
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransaction);
    });
  }

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
            TransactionForm(_addTransaction),
            // Exibindo lista de informações
            TransactionList(_transaction),
          ],
        ),
      ),
    );
  }
}
