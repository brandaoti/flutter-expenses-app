import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'dart:io';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime showDate;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker({
    this.showDate,
    this.onDateChanged,
  });

  // Função pra mostrar data
  _showDatePicker(BuildContext context) {
    // Aqui é esperado um callback future
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),

      // Registra o callback, e retorna quando estiver completo,
    ).then((datePicker) {
      if (datePicker == null) {
        return;
      }

      onDateChanged(datePicker);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Color
    final Color color = Colors.deepOrange;

    // implement build DatePicker for IOS And ANDROID
    return Platform.isIOS
        ? Container(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            child: Row(
              children: <Widget>[
                Text(
                  showDate == null
                      ? 'Nenhuma data selecionada!'
                      : '${DateFormat('yMMMMEEEEd').format(showDate)}',
                  style: TextStyle(
                    //fontFamily: 'CormorantGaramond',
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.date_range),
                  color: color,
                  iconSize: 50,
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
