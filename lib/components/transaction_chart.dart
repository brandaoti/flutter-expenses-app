import 'package:expenses_app/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import './chart_bar.dart';

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

      // Map retornado para o metodo groupTransaction
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  // vai retornar um Future, pegando o valor do elemento anterior
  double get _weekTotalvalue {
    return groupTransaction.fold(0.0, (value, element) {
      return value + element['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // implements build Transaction chart
    return Card(
      elevation: 15,
      color: Colors.purple[50],
      shadowColor: Colors.purpleAccent[100],
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

      //
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: groupTransaction.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                percentage: _weekTotalvalue == 0
                    ? 0
                    : (tr['value'] as double) / _weekTotalvalue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
