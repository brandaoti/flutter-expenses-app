import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // Controladores
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // implement build TextFormField
    return Container(
      height: 200,
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            // Titulo
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),

            SizedBox(height: 8),
            // Valor
            TextFormField(
              keyboardType: TextInputType.number,
              controller: valueController,
              decoration: InputDecoration(
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
                  onPressed: () {
                    print(titleController.text);
                    print(valueController.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
