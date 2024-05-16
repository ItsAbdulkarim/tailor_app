import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/custom/custom_searchbar.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/custom/customtextformfield.dart';
import 'package:untitled4/provider/addworker_provider.dart';
import 'package:untitled4/provider/update_worker_provider.dart';
import 'package:untitled4/view/UI_screen/worker_list_screen.dart';

import 'bottomnavigationbar.dart';

class UpdateWorkerScreen extends StatefulWidget {
  final DocumentSnapshot taskSnapshot;
  final String taskID;

  const UpdateWorkerScreen(
      {super.key, required this.taskSnapshot, required this.taskID});

  @override
  State<UpdateWorkerScreen> createState() => _UpdateWorkerScreenState();
}

class _UpdateWorkerScreenState extends State<UpdateWorkerScreen> {
  //this is dialog controller
  TextEditingController namecontroller = TextEditingController();
  TextEditingController workernumbercontroller = TextEditingController();
  TextEditingController specialitycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    namecontroller.text = widget.taskSnapshot['workername'];
    workernumbercontroller.text = widget.taskSnapshot['workerphone'];
    specialitycontroller.text = widget.taskSnapshot['specialty'];
    pricecontroller.text = widget.taskSnapshot['price'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: const Text(
          'Worker list',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.to(const AnimatedDrawerScreen());
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            CustomTextField(
              controller: namecontroller,
              hint: 'Enter worker name',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: workernumbercontroller,
              hint: 'phone number',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: specialitycontroller,
              hint: 'speciality',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: pricecontroller,
              hint: 'price',
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: () async {
                await context.read<UpdateWorkerProvider>().updateWorkerMethod(
                      widget.taskID,
                      namecontroller.text.trim(),
                      workernumbercontroller.text.trim(),
                      specialitycontroller.text.trim(),
                      pricecontroller.text.trim(),
                    );
                namecontroller.clear();
                workernumbercontroller.clear();
                specialitycontroller.clear();
                pricecontroller.clear();

                Get.to(WorkerListScreen());
              },
              text: "Submit",
              color: Color(0xFF7A7B80),
            ),
          ],
        ),
      ),
    );
  }
}
