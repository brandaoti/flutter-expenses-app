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
    // implements build TextForm for ANDROID and IOS
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Platform.isIOS
          ? CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              placeholder: label,
              onSubmitted: (_) => onFieldSubmitted(),
            )
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
            ),
    );
  }
}
