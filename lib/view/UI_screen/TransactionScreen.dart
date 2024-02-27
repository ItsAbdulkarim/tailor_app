import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled4/custom/custompaid_unpaidcontainer.dart';
class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true
        ,title: Text('Transaction Details',style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu, size: 30,color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
Row(children: [
  Expanded(
    child: CustomPaidUnpaidContainer(
      ontap: (){},
      Pamentstatus: 'UNPAID',
    )
  ),
  SizedBox(width: 15,),
  Expanded(
    child: CustomPaidUnpaidContainer(
      ontap: (){},
      Pamentstatus: 'PAID',

    )
  )


],)



          ],
        ),
      ),
    );
  }
}