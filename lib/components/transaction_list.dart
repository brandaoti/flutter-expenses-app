import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  //Lista herdada do pai
  final List<Transaction> transaction;

  //Função herdada do pai para fazer exclusão
  final void Function(String) onRemove;

  TransactionList(this.transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    // Build - lista de Transações
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 50),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    color: Colors.purple,
                  ),
                ),
              ],
            )
          : ListView.builder(
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
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: TextStyle(fontSize: 12),
                    ),
                    // Responsavel por excluir as transações, get ID
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      color: Colors.red,
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
