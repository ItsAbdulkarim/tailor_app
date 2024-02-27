import 'package:flutter/material.dart';


class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListTile with Circular Avatar in Card'),
        ),
        body: ListView.builder(
          itemCount: 5, // Replace with the actual length of your tasklist
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
              // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Card(
                elevation: 4,
                child: Row(
                  children: [

                    CircleAvatar(

                      radius: 40,
                      backgroundColor: Colors.redAccent,
                    )


                  ],
                )
              ),
            );
          },
        ),
      );

  }
}
