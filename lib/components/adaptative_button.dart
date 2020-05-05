import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  //final String label;
  final Function onPressed;

  AdaptativeButton({
    //this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // implement build Button for IOS and ANDROID
    return Platform.isIOS
        ? CupertinoButton(
            child: Icon(Icons.add_circle),
            onPressed: onPressed,
          )
        :
        // Add Transações
        IconButton(
            icon: Icon(Icons.add_circle),
            color: Theme.of(context).primaryColor,
            tooltip: 'Adicionar nova transação?',
            iconSize: 60,
            onPressed: onPressed,
          );
  }
}
