import 'package:flutter/material.dart';
import 'dart:math';

import '../model/transaction.dart';
import './transaction_list.dart';
import './transaction_form.dart';
import './transaction_chart.dart';

class ExpensesApp extends StatefulWidget {
  //
  @override
  _ExpensesAppState createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  // List TODO: Remover
  final List<Transaction> _transaction = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 68.91,
      date: DateTime.now(),
    ),
  ];

  bool _showChart = true;

  // chamar no Transactonform
  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transaction.add(newTransaction);
    });

    // Fechar o _showModalForm
    Navigator.of(context).pop();
  }

  _showModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  // Vai pegar a lista recentes, antes e depois
  List<Transaction> get _recentTransaction {
    return _transaction.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  // É tratado pelo Id da transação e remove o item.
  _removeTransaction(String id) {
    setState(() {
      return _transaction.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Responsavel por ocultar/exibir grafico
    final showSwitch = Switch(
      value: _showChart,
      onChanged: (newValue) {
        setState(() {
          _showChart = newValue;
        });
      },
    );

    // Armazena a construção do appBar
    final appBar = AppBar(
      centerTitle: true,
      leading: showSwitch,
      title: Text('Despesas Pessoais'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          tooltip: 'Adicionar Transações!',
          iconSize: 30,
          onPressed: () => _showModalForm(context),
        ),
      ],
    );

    // Responsavel pela altura do app
    final avaliableHeight =
        (mediaQuery.size.height - appBar.preferredSize.height) -
            mediaQuery.padding.top;

    // Armazena a construção do body
    final pageBody = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Exibindo Gráficos
          if (_showChart)
            Container(
              height: avaliableHeight * 0.25,
              child: TransactionChart(_recentTransaction),
            ),

          // Exibindo lista de informações
          Container(
            height: avaliableHeight * (_showChart ? 0.75 : 1),
            child: TransactionList(_transaction, _removeTransaction),
          ),
        ],
      ),
    );

    // Implements Scaffold
    return Scaffold(
      appBar: appBar,
      body: pageBody,
    );
  }
}
