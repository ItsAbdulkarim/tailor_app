import 'package:flutter/material.dart';

class SpecialInstructionContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;

  const SpecialInstructionContainer(
      {super.key, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown.shade50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          maxLines: 8,
          decoration: InputDecoration.collapsed(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.brown.shade50,
            hintText: hinttext,
          ),
        ),
      ),
    );
  }
}
