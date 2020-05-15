import 'package:flutter/material.dart';

// import 'package:intl/intl.dart';

import 'adaptative_button.dart';
import 'adaptative_date_picker.dart';
import 'adaptative_form.dart';

class TransactionForm extends StatefulWidget {
  // Controladores
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  // Controladores
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  DateTime _showDate = DateTime.now();

  // Função enviar formulario
  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    //Validar formulario
    if (title.isEmpty || value <= 0) {
      return;
    }

    //Função pra add o titulo, valor e data
    widget.onSubmit(title, value, _showDate);
  }

  // Função ativar a data
  // _showDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2019),
  //     lastDate: DateTime.now(),
  //   ).then((datePicker) {
  //     setState(() {
  //       _showDate = datePicker;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // keyboards
    final keyboardText = TextInputType.text;
    final keyboardNumber = TextInputType.number;

    // implement build TextFormField
    return Card(
      elevation: 5,
      shadowColor: Colors.purpleAccent[100],
      margin: EdgeInsets.all(10),

      //
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            // Titulo
            SizedBox(height: 8),
            AdaptativeForm(
              label: 'Título',
              controller: titleController,
              keyboardType: keyboardText,
              onFieldSubmitted: _submitForm,
            ),

            // Valor
            SizedBox(height: 8),
            AdaptativeForm(
              label: 'Valor',
              controller: valueController,
              keyboardType: keyboardNumber,
              onFieldSubmitted: _submitForm,
            ),

            // FittedBox, vai adaptando o tamanho da linha
            SizedBox(height: 8),
            FittedBox(
              child: Card(
                elevation: 10,
                color: Colors.purpleAccent[50],
                shadowColor: Colors.purpleAccent[100],

                //
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Data: ',
                        style: Theme.of(context).textTheme.headline6,
                      ),

                      // Instanciar AdaptativeDatePicker
                      AdaptativeDatePicker(
                        showDate: _showDate,
                        onDateChanged: (newDate) {
                          setState(() {
                            _showDate = newDate;
                          });
                        },
                      ),

                      // Instanciando AdaptativeButton
                      AdaptativeButton(
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
