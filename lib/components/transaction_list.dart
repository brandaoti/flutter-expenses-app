import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    // Build - lista de Transações
    return Column(
      children: transaction.map((tr) {
        return Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                height: 300,
                color: Colors.purple[200],
                child: Text('R\$ ${tr.value.toStringAsFixed(2)}'),
              ),
              Column(
                children: <Widget>[
                  Text('${tr.title}'),
                  Text('${tr.date}'),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
