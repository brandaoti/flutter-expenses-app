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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          //color: Colors.green,
          height: 400,
          child: transaction.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Container(
                      height: constraints.maxHeight * 0.05,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            'Nenhuma despesa registrada!',
                            style: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .headline6,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height:
                          constraints.maxHeight - (constraints.maxHeight * 0.1),
                      child: Image.asset(
                        'assets/images/waiting.png',
                        color: Theme.of(context).accentColor,
                        //scale: 2,
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
                      color: Colors.purpleAccent[50],
                      shadowColor: Colors.purpleAccent[100],
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                      //
                      child: ListTile(
                        leading: CircleAvatar(
                          //backgroundColor: Theme.of(context).accentColor,
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
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(
                          DateFormat('yMMMMEEEEd').format(tr.date),
                          style: TextStyle(fontSize: 12),
                        ),
                        // Responsavel por excluir as transações, get ID
                        trailing: IconButton(
                          icon: Icon(Icons.delete_forever),
                          color: Colors.red[600],
                          onPressed: () => onRemove(tr.id),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
