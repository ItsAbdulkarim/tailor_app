import 'package:flutter/material.dart';

class MeasurementTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  MeasurementTextField({required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        // Set your desired fill color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      // Add other properties for text input handling as needed
    );
  }
}
