import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';

import 'package:flutter/services.dart';

class AdaptativeForm extends StatelessWidget {
  //
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final Function onFieldSubmitted;

  AdaptativeForm({
    this.controller,
    this.keyboardType,
    this.label,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container()
        : TextFormField(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
            onFieldSubmitted: (_) => onFieldSubmitted(),
          );
  }
}
