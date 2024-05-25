import 'package:flutter/material.dart';

class ProblemTextFormField extends StatelessWidget {
  const ProblemTextFormField({
    super.key,
    required this.onSaved,
    required this.labelText,
    this.onValidate,
  });

  final void Function(String?) onSaved;
  final String? Function(String?)? onValidate;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidate,
      onSaved: onSaved,
      style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontSize: 16),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: 16),
        filled: false,
        fillColor: const Color(0xFF010028),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
