import 'package:flutter/material.dart';

class CustomPaidUnpaidContainer extends StatelessWidget {
  final String Pamentstatus;
  final VoidCallback ontap;
  const CustomPaidUnpaidContainer({super.key,
  required this.Pamentstatus,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 70,

        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade800,
                Colors.purple.shade600,
                Colors.red.shade900,



              ],
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(Pamentstatus,style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),)),

      ),
    );
  }
}
