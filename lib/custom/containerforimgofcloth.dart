import 'package:flutter/material.dart';

class ClothImageContainer extends StatelessWidget {
  final Widget child;

  const ClothImageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown.shade50,
      ),
      child: child,
    );
  }
}
