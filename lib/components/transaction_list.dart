import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    // Build - lista de Transações
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (context, index) {
          final tr = transaction[index];

          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(
                      "R\$ ${tr.value.toStringAsFixed(2)}",
                    ),
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
                style: TextStyle(fontSize: 12),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                color: Colors.red,
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
