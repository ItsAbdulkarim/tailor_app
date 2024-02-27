import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  final String subtitle;
  final String img;

  const CustomContainer({
    super.key,
    required this.title,
    this.ontap,
    required this.img,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade800,
            Colors.purple.shade700,
            Colors.red.shade600,
            Colors.deepOrange.shade500,

          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                img,
                height: 60,
                width: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.white),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
