import 'package:flutter/material.dart';
import 'dart:math';

import '../model/transaction.dart';
import './transaction_list.dart';

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
    ),
    // add novas informações pra testar a lista;
    // TODO: Será removido em breve.
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de água',
      value: 33.33,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 81.33,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de gas',
      value: 79.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de internet',
      value: 64.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de celular',
      value: 19.99,
      date: DateTime.now(),
    ),
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
          TransactionList(_transaction),
          // Exibindo formulario de texto
          Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                SizedBox(height: 8),
                // Titulo
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),

                SizedBox(height: 8),
                // Valor
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Valor',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
