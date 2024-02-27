import 'package:flutter/material.dart';
class CustomOrderStatus extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomOrderStatus({super.key,

  required this.title,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800,
              Colors.purple.shade600,
              Colors.red.shade900,



            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.8),
              offset: Offset(4, 4),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              offset: Offset(-4, -4),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(child: Text(title,style: TextStyle(

            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),)),
        // Your child widgets go here
      ),
    );
  }
}
