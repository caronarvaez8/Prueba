import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String labelText;
  final Function onSaved;

  LabelText({
    @required this.labelText,
    @required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: false,
        contentPadding: EdgeInsets.fromLTRB(10, 35, 35, 0),
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Escribir el $labelText';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }
}
