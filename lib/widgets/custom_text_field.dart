import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/validators.dart';

class CustomTextField extends StatelessWidget {
  final String? initValue;
  final Validator? validator;
  final String? labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.textInputType,
    this.initValue,
    this.obscureText = false,
    this.prefixIcon,
    this.labelText, 
     this.onChanged,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType:textInputType ,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator != null ? validator!.validate : null,
        controller: controller,
        initialValue: initValue,
        obscureText: obscureText,
        decoration: InputDecoration(

          errorMaxLines: 4,
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
