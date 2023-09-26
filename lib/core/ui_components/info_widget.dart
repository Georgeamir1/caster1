import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String hintText;
  final String value;
  final Function(String)? onChanged; // Make onChanged optional
  final Function(String?) onSaved;

  ReusableTextFormField({
    required this.formKey,
    required this.hintText,
    required this.value,
    this.onChanged, // onChanged is optional
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
          onChanged: onChanged, // This can be null
          onSaved: onSaved,
        ),
      ),
    );
  }
}
