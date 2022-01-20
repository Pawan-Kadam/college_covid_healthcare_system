import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  FormWidget(
      {Key? key,
      required this.fieldName,
      required this.labelText,
      required this.fieldNameVariable})
      : super(key: key);
  String fieldName;
  String labelText;
  String? fieldNameVariable;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$fieldName is Required";
          }
        },
        // controller: willToDonatePlasma,
        onSaved: (value) {
          fieldNameVariable = value!;
        },
      ),
    );
  }
}
