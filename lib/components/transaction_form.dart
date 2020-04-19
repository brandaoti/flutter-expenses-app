import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((datePicker) {
      setState(() {
        _showDate = datePicker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // implement build TextFormField
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          // Titulo
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Título',
            ),
            //
            controller: titleController,
            onFieldSubmitted: (_) => _submitForm(),
          ),

          SizedBox(height: 8),
          // Valor
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Valor',
            ),
            //
            controller: valueController,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (_) => _submitForm(),
          ),

          // Container pra alinhar o ROW
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 5,
            ),
            // Linha pra controlar a mensagem de exibir a data
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Data:',
                    style: Theme.of(context).textTheme.title,
                  ),
                  // TODO: verificar como melhorar esse TestStyle
                  Text(
                    '${DateFormat(' dd MMM y').format(_showDate)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Kreon',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Linha pra organizar os botões.
                  Row(
                    children: <Widget>[
                      //Selecionar data
                      IconButton(
                        icon: Icon(
                          Icons.date_range,
                        ),
                        color: Colors.red,
                        iconSize: 50,
                        tooltip: 'Adicionar nova data?',
                        onPressed: _showDatePicker,
                      ),

                      // Add transações
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        color: Theme.of(context).primaryColor,
                        iconSize: 50,
                        tooltip: 'Adicionar nova transação?',
                        onPressed: _submitForm,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
