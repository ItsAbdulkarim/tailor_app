import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/custom/custom_searchbar.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/custom/customtextformfield.dart';
import 'package:untitled4/provider/addworker_provider.dart';
import 'package:untitled4/view/UI_screen/update_worker_screen.dart';

import '../../provider/deleteprovder.dart';
import 'bottomnavigationbar.dart';

class WorkerListScreen extends StatefulWidget {

  const WorkerListScreen({super.key,});

  @override
  State<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends State<WorkerListScreen> {
  //this is dialog controller
  TextEditingController namecontroller = TextEditingController();
  TextEditingController workernumbercontroller = TextEditingController();
  TextEditingController specialitycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();


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
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
                onPressed: () {
                  setState(() {});
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'Add Worker',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                  )),
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
                                  await context
                                      .read<AddWorkerProvider>()
                                      .AddWorkerMethod(
                                          namecontroller.text.trim(),
                                          workernumbercontroller.text.trim(),
                                          specialitycontroller.text.trim(),
                                          pricecontroller.text.trim());
                                  namecontroller.clear();
                                  workernumbercontroller.clear();
                                  specialitycontroller.clear();
                                  pricecontroller.clear();

                                  Navigator.of(context).pop();
                                },
                                text: "Submit",
                                color: Color(0xFF7A7B80),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add_circle_outline,
                ),
                color: Colors.black,
                iconSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Add worker',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: context.read<AddWorkerProvider>().getWorker(),
                builder: (context, snapshot) {
                  print('Snapshot: $snapshot');
                  print('Data Length: ${snapshot.data?.docs.length}');
                  List<DocumentSnapshot> workerlist = snapshot.data?.docs ?? [];
                  if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(child: Text('No connection yet'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SpinKitDualRing(color: Colors.purple));
                  }

                  print('thissisissssssssssssss$workerlist');

                  if (workerlist.isEmpty) {
                    return const Center(child: Text('No Tasks Saved Yet'));
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: workerlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 100,
                              decoration: BoxDecoration(
                              color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(20),


                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        workerlist[index]['workername'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        workerlist[index]['specialty'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        workerlist[index]['price'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),

                                  // this row is used for edth the worker list and delete the worker both button with dialoge
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: TextButton(

                                              onPressed: () {
                                                String taskID = workerlist[index].id;
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return UpdateWorkerScreen(taskSnapshot: workerlist[index],taskID:taskID ,);
                                            },));

                                              },
                                              child: Text(
                                                'Edit worker',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ))),

                                      //this is delete butoon with dialog
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: TextButton(
                                              onPressed: () {



                                                showDialog(context: context, builder: (context) {
                                                  return AlertDialog(


                                                    title: Text('Are you sure to delete'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(context); // Close the dialog
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                          onPressed: () async {
                                                            Navigator.pop(context);
                                                            String taskID =
                                                                workerlist[index].id;
                                                            await context
                                                                .read<
                                                                DeleteRecordProvider>()
                                                                .deleteWorker(taskID);


                                                          },
                                                          child: Text('Delete'))

                                                    ],
                                                  );
                                                },);




                                              },
                                              child: Text(
                                                'delete worker',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  return const Center(
                      child: Text('Unexpected ConnectionState'));
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}
