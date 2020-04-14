import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionChart extends StatelessWidget {
  // Lista de transações recentes
  final List<Transaction> recentTransaction;

  TransactionChart(this.recentTransaction);

  // Lista responsavel por controlar o grupo de transações
  List<Map<String, Object>> get groupTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      //Vai pecorrer as lista mais recente da transação dos valores
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      // Map retornado para o metodo groupTransaction
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    // implements build Transaction chart
    //groupTransaction;
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Row(
        children: groupTransaction.map((tr) {
          return Text('${tr['day']} : ${tr['value']}');
        }).toList(),
      ),
      color: Colors.purple[50],
    );
  }
}
