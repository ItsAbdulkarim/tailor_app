import 'package:flutter/material.dart';
class CustomAudioInstruction extends StatelessWidget {

  final IconData iconData;
  final IconData iconDataa;
  const CustomAudioInstruction({super.key,


    required this.iconData,
    required this.iconDataa,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)


      ),child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(

        children: [

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData,size: 30,),
                Icon(iconDataa,size: 30,)





              ],),
          )



        ],

      ),
    ),


    );
  }
}
