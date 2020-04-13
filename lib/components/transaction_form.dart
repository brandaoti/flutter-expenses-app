import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // Controladores
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  //
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return AlertDialog(
        title: Text('Campo vazio'),
      );
    }

    onSubmit(title, value);
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
            controller: titleController,
            onFieldSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Título',
            ),
          ),

          SizedBox(height: 8),
          // Valor
          TextFormField(
            keyboardType: TextInputType.number,
            controller: valueController,
            onFieldSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Valor',
            ),
          ),
          // Implementando Botão
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Nova Transação?'),
                textColor: Colors.green,
                onPressed: _submitForm,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
