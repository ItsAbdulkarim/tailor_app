import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled4/custom/custom_searchbar.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/custom/customtextformfield.dart';

import 'bottomnavigationbar.dart';

class WorkerListScreen extends StatefulWidget {
  const WorkerListScreen({super.key});

  @override
  State<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends State<WorkerListScreen> {
  //this is dialog controller
  TextEditingController namecontroller = TextEditingController();
  TextEditingController workernumbercontroller = TextEditingController();
  TextEditingController specialitycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();

  //this is search controller
  TextEditingController orderlistsearchcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          'Worker list',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.to(const AnimatedDrawerScreen());
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
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
                                hint: 'Enter worker name',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: specialitycontroller,
                                hint: 'Enter worker name',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: pricecontroller,
                                hint: 'Enter worker name',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                text: "Submit",
                                color: Colors.brown,
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
                color: Colors.white,
                iconSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Add worker',
              style: TextStyle(
                color: Colors.white,
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
              CustomSearchBar(
                  controller: orderlistsearchcontroler, onSearch: () {}),
              SizedBox(
                height: 10,
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: 90,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 7,
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade800,
                              Colors.purple.shade700,
                              Colors.red.shade600,
                              Colors.deepOrange.shade500,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kairm',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  'speciallity',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text(
                                  'price',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                              ],
                            ),

                            // this row is used for edth the worker list and delete the worker both button with dialoge
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {});
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                insetPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 30,
                                                        horizontal: 10),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Add Worker',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 35,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      CustomTextField(
                                                        controller:
                                                            namecontroller,
                                                        hint:
                                                            'Enter worker name',
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CustomTextField(
                                                        controller:
                                                            workernumbercontroller,
                                                        hint:
                                                            'Enter worker name',
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CustomTextField(
                                                        controller:
                                                            specialitycontroller,
                                                        hint:
                                                            'Enter worker name',
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CustomTextField(
                                                        controller:
                                                            pricecontroller,
                                                        hint:
                                                            'Enter worker name',
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CustomButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        text: "Submit",
                                                        color: Colors.brown,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          'Edit worker',
                                          style: TextStyle(color: Colors.white),
                                        ))),

                                //this is delete butoon with dialog
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Conform Delete',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: Text(
                                                  'Are you sure you want to delete',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  // Confirm Button
                                                  TextButton(
                                                    onPressed: () {
                                                      // Add your delete logic here

                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          'delete worker',
                                          style: TextStyle(color: Colors.white),
                                        ))),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )

              // Container(
              //   height:90,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10,
              //         vertical: 3),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Kairm',
              //               style: TextStyle(
              //                   fontSize: 20,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black),
              //             ),
              //             Text(
              //               'speciallity',
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w500,
              //                   color: Colors.black),
              //             ),
              //             Text(
              //               'price',
              //               style: TextStyle(
              //                   fontSize: 20,
              //                   fontWeight: FontWeight.w300,
              //                   color: Colors.black),
              //             ),
              //           ],
              //         ),
              //
              //         // this row is used for edth the worker list and delete the worker both button with dialoge
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Align(
              //                 alignment: Alignment.bottomCenter,
              //                 child: TextButton(
              //                     onPressed: () {
              //                       setState(() {});
              //                       showDialog(
              //                         context: context,
              //                         builder: (context) {
              //                           return Dialog(
              //                             insetPadding: EdgeInsets.symmetric(
              //                                 vertical: 30, horizontal: 10),
              //                             child: Padding(
              //                               padding: const EdgeInsets.all(10),
              //                               child: Column(
              //                                 children: [
              //                                   Text(
              //                                     'Add Worker',
              //                                     style: TextStyle(
              //                                         color: Colors.black,
              //                                         fontSize: 25,
              //                                         fontWeight: FontWeight.bold),
              //                                   ),
              //                                   Align(
              //                                       alignment: Alignment.topRight,
              //                                       child: InkWell(
              //                                         onTap: () {
              //                                           Navigator.of(context).pop();
              //                                         },
              //                                         child: Icon(
              //                                           Icons.close,
              //                                           size: 35,
              //                                           color: Colors.black,
              //                                         ),
              //                                       )),
              //                                   SizedBox(
              //                                     height: 5,
              //                                   ),
              //                                   CustomTextField(
              //                                     controller: namecontroller,
              //                                     hint: 'Enter worker name',
              //                                   ),
              //                                   SizedBox(
              //                                     height: 10,
              //                                   ),
              //                                   CustomTextField(
              //                                     controller: workernumbercontroller,
              //                                     hint: 'Enter worker name',
              //                                   ),
              //                                   SizedBox(
              //                                     height: 10,
              //                                   ),
              //                                   CustomTextField(
              //                                     controller: specialitycontroller,
              //                                     hint: 'Enter worker name',
              //                                   ),
              //                                   SizedBox(
              //                                     height: 10,
              //                                   ),
              //                                   CustomTextField(
              //                                     controller: pricecontroller,
              //                                     hint: 'Enter worker name',
              //                                   ),
              //                                   SizedBox(
              //                                     height: 10,
              //                                   ),
              //                                   CustomButton(
              //                                     onPressed: () {
              //                                       Navigator.of(context).pop();
              //                                     },
              //                                     text: "Submit",
              //                                     color: Colors.brown,
              //                                   )
              //                                 ],
              //                               ),
              //                             ),
              //                           );
              //                         },
              //                       );
              //                     },
              //                     child: Text('Edit worker'))),
              //
              //             //this is delete butoon with dialog
              //             Align(
              //                 alignment: Alignment.bottomCenter,
              //                 child: TextButton(
              //                     onPressed: () {
              //                       showDialog(
              //                         context: context,
              //                         builder: (context) {
              //                           return AlertDialog(
              //                             title: Text(
              //                               'Conform Delete',
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontSize: 25,
              //                                   fontWeight: FontWeight.bold),
              //                             ),
              //                             content: Text(
              //                               'Are you sure you want to delete',
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontSize: 17,
              //                                   fontWeight: FontWeight.bold),
              //                             ),
              //                             actions: [
              //                               TextButton(
              //                                 onPressed: () {
              //                                   Navigator.pop(
              //                                       context); // Close the dialog
              //                                 },
              //                                 child: Text(
              //                                   'Cancel',
              //                                   style: TextStyle(
              //                                       color: Colors.black,
              //                                       fontSize: 20,
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                               // Confirm Button
              //                               TextButton(
              //                                 onPressed: () {
              //                                   // Add your delete logic here
              //
              //                                   Navigator.pop(
              //                                       context); // Close the dialog
              //                                 },
              //                                 child: Text(
              //                                   'OK',
              //                                   style: TextStyle(
              //                                       color: Colors.black,
              //                                       fontSize: 20,
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ],
              //                           );
              //                         },
              //                       );
              //                     },
              //                     child: Text(
              //                       'delete worker',
              //                     ))),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
