import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String hintText;

  const CustomDateField({
    Key? key,
    required this.controller,
    required this.onTap,
    this.hintText = 'Pick Date',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        prefixIcon: Icon(Icons.calendar_today),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
