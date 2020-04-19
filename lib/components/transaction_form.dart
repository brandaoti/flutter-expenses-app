import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  // Controladores
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  // Função enviar formulario
  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    //Validar formulario
    if (title.isEmpty || value <= 0) {
      return;
    }

    //Função pra add o titulo, valor e data
    widget.onSubmit(title, value);
  }

  // Função ativar a data
  _showDatePicker() {
    showDatePicker(
      context: null,
      initialDate: null,
      firstDate: null,
      lastDate: null,
    );
  }

  List<bool> iSelected;

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

          // Responsavel pela data
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Nenhuma data selecionada!',
                  style: Theme.of(context).textTheme.subtitle,
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
                      onPressed: () {},
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
        ],
      ),
    );
  }
}
