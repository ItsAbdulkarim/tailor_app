
import 'package:flutter/material.dart';

Widget getdot(String dott){

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(dott, style: TextStyle(
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
        fontSize: 18),),
  );
}



Widget CustomInvoceButton(String text ,VoidCallback onpressed){

  return GestureDetector(
    onTap: onpressed,
    child: Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xFF7A7B80),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                fontSize: 16),
          )),
    ),
  );

}