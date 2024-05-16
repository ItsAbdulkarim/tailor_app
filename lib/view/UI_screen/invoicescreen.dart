import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color( 0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: Color( 0xFFFFFFFF),
        centerTitle: true
        ,title: Text('Invocescreen',style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu,size: 30,color: Colors.black,),
        ),
      ),

    );
  }
}