import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/custom/container_audio_instruction.dart';
import 'package:untitled4/custom/custom_radiolist_tile.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/custom/customdatepickfiled.dart';
import 'package:untitled4/custom/containerforimgofcloth.dart';
import 'package:untitled4/custom/custompament_order_status.dart';
import 'package:untitled4/custom/customtextformfield.dart';
import 'package:untitled4/custom/measurementfield.dart';
import 'package:untitled4/custom/specialinstructioncontainer.dart';
import 'package:untitled4/provider/add_customer_provider.dart';
import 'package:untitled4/provider/update_provider.dart';

import 'package:untitled4/view/UI_screen/homescreen.dart';

import 'bottomnavigationbar.dart';
// after clicking on card .from the card navigate here to update

class UpdateCustomerScreen extends StatefulWidget {
  final DocumentSnapshot taskSnapshot;
  final String taskID;

  const UpdateCustomerScreen(
      {super.key, required this.taskSnapshot, required this.taskID});

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  var Namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var Orderdatecontroller = TextEditingController();
  var Deliverydatecontroller = TextEditingController();

  String pamentstatus = 'PAMENT STATUS';
  String orderstatus = 'ORDER STATUS';
  String? Gender;
  String? selectmeasurement;
  String selectworker = 'SELECT WORKER';
  bool isContainervisible = true;
  //for shirt
  bool firstshirt = false;
  bool secondshirt = false;
  bool thirdshirt = false;
  bool fourthshirt = false;
  bool fifthshirt = false;
  bool sixthshirt = false;
//for pant
  bool firstshirtp = false;
  bool secondshirtp = false;
  bool thirdshirtp = false;
  bool fourthshirtp = false;
  bool fifthshirtp = false;
  bool sixthshirtp = false;

  //for shalwarzizchekbox
  bool firstshirtshl = false;
  bool secondshirtshl = false;
  bool thirdshirtshl = false;
  bool fourthshirtshl = false;
  bool fifthshirtshl = false;
  bool sixthshirtshl = false;

//short controller
  TextEditingController shortquantitycontroller = TextEditingController();
  TextEditingController shortamountcontroller = TextEditingController();
  TextEditingController shirtLengthController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController hipController = TextEditingController();
  TextEditingController sleeveLengthController = TextEditingController();
  TextEditingController shoulderController = TextEditingController();
  TextEditingController collarController = TextEditingController();
  TextEditingController cuffController = TextEditingController();

  TextEditingController addshortnotecontroller = TextEditingController();
  // TextEditingController addnotescontroller = TextEditingController();

  //paint controller
  TextEditingController addinstructionpantcontroller = TextEditingController();
  TextEditingController pantquantitycontroller = TextEditingController();
  TextEditingController pantamountcontroller = TextEditingController();
  TextEditingController waistSizeController = TextEditingController();
  TextEditingController hipSizeController = TextEditingController();
  TextEditingController inseamController = TextEditingController();
  TextEditingController outseamController = TextEditingController();
  TextEditingController thighCircumferenceController = TextEditingController();
  TextEditingController kneeCircumferenceController = TextEditingController();
  TextEditingController legOpeningController = TextEditingController();
  TextEditingController frontRiseController = TextEditingController();
  TextEditingController backRiseController = TextEditingController();
  TextEditingController crotchDepthController = TextEditingController();
  TextEditingController flyLengthController = TextEditingController();
//controller for shalwar kamiz

  TextEditingController shkamizquantity = TextEditingController();
  TextEditingController shkamizamount = TextEditingController();
  TextEditingController kamizchestSizeController = TextEditingController();
  TextEditingController kamizLengthController = TextEditingController();
  TextEditingController kamizsleeveLengthController = TextEditingController();
  TextEditingController kamizshoulderWidthController = TextEditingController();

  TextEditingController shalwarwaistSizeController = TextEditingController();
  TextEditingController shalwarhipSizeController = TextEditingController();
  TextEditingController shalwarinseamLengthController = TextEditingController();
  TextEditingController shalwaroutseamLengthController =
      TextEditingController();
  TextEditingController shalwarthighCircumferenceController =
      TextEditingController();
  TextEditingController shalwarbottomOpeningController =
      TextEditingController();

  TextEditingController addkamisnotesscontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    //initialize here
    Namecontroller.text = widget.taskSnapshot['name'];
    phonecontroller.text = widget.taskSnapshot['phone'];
    addresscontroller.text = widget.taskSnapshot['address'];
    Gender = widget.taskSnapshot['gender'];
    //
    orderstatus = widget.taskSnapshot['orderdate'];
    Deliverydatecontroller.text = widget.taskSnapshot['deliverydate'];
    pamentstatus = widget.taskSnapshot['pamentstatus'];
    orderstatus = widget.taskSnapshot['orderstatus'];
    selectworker = widget.taskSnapshot['selectedworker'];
    shortquantitycontroller.text=widget.taskSnapshot['Shortquantity'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        title: Text(
          'Add customer',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.to(AnimatedDrawerScreen());
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/karim.jpg'),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Book No# 3',
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 25,
                    //       fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Customer Name',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'please provide ';
                  } else {
                    return null;
                  }
                },
                controller: Namecontroller,
                hint: 'Enter Name',
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
              CustomTextField(
                hint: 'Enter Phone Number',
                controller: phonecontroller,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
              CustomTextField(
                  hint: 'Enter Address', controller: addresscontroller),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              Text('Select gender',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      fillColor: MaterialStateProperty.all(Colors.brown),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.zero,
                      tileColor: Colors.brown.shade200,
                      value: 'Male',
                      title: Text('Male'),
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: RadioListTile(
                      fillColor: MaterialStateProperty.all(Colors.brown),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.zero,
                      tileColor: Colors.brown.shade200,
                      value: 'Female',
                      title: Text('Female'),
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Order Date',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      'Delivery date',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomDateField(
                    controller: Orderdatecontroller,
                    onTap: () {
                      selectDate(context, Orderdatecontroller);
                    },
                    hintText: 'Pick Date',
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: CustomDateField(
                    controller: Deliverydatecontroller,
                    onTap: () {
                      selectDate(context, Deliverydatecontroller);
                    },
                    hintText: 'Pick Date',
                  ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomDropdown(
                    value: pamentstatus,
                    items: ['PAMENT STATUS', 'UNPAID', 'PAID'],
                    onChanged: (value) {
                      setState(() {
                        pamentstatus = value.toString();
                      });
                    },
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: CustomDropdown(
                    value: orderstatus,
                    items: [
                      'ORDER STATUS',
                      'NORMAL',
                      'URGENT',
                    ],
                    onChanged: (value) {
                      setState(() {
                        orderstatus = value.toString();
                      });
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomDropdown(
                  value: selectworker,
                  items: [
                    'SELECT WORKER',
                    'Abdul karim',
                    'Luqman hakeem',
                    'Suleman khan',
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectworker = value.toString();
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              Text('MEASUREMENT',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text('SELECT MEASUREMENT TYPE',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomRadioListTile(
                      value: 'SHIRT',
                      title: 'SHIRT',
                      groupValue: selectmeasurement,
                      onChanged: (value) {
                        setState(() {
                          selectmeasurement = value;
                          isContainervisible = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomRadioListTile(
                      value: 'PAINTS',
                      title: 'PAINTS',
                      groupValue: selectmeasurement,
                      onChanged: (value) {
                        setState(() {
                          selectmeasurement = value;
                          isContainervisible = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomRadioListTile(
                      value: 'SUITS',
                      title: 'SUITS',
                      groupValue: selectmeasurement,
                      onChanged: (value) {
                        setState(() {
                          selectmeasurement = value;
                          isContainervisible = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (selectmeasurement != null && isContainervisible)
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isContainervisible = false;
                                    selectmeasurement =
                                        null; // Hide the container
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        if (selectmeasurement == 'SHIRT')
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Add Short Quantity:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110),
                                      child: MeasurementTextField(
                                          labelText: '',
                                          controller: shortquantitycontroller),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text('Add Short Amount:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 17,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110),
                                      child: MeasurementTextField(
                                          labelText: '',
                                          controller: shortamountcontroller),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Shoulder",
                                          controller: shoulderController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Sleeve",
                                          controller: sleeveLengthController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Hip Size",
                                          controller: hipController),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Waist Size",
                                          controller: waistController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Chest Size",
                                          controller: chestController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "length ",
                                          controller: shirtLengthController),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: firstshirt,
                                      onChanged: (value) {
                                        setState(() {
                                          firstshirt = value!;
                                        });
                                      },
                                    ),
                                    Text('first'),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: secondshirt,
                                      onChanged: (value) {
                                        setState(() {
                                          secondshirt = value!;
                                        });
                                      },
                                    ),
                                    Text('second'),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: thirdshirt,
                                      onChanged: (value) {
                                        setState(() {
                                          thirdshirt = value!;
                                        });
                                      },
                                    ),
                                    Text('third'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: fourthshirt,
                                      onChanged: (value) {
                                        setState(() {
                                          fourthshirt = value!;
                                        });
                                      },
                                    ),
                                    Text('forth'),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: fifthshirt,
                                      onChanged: (value) {
                                        setState(() {
                                          fifthshirt = value!;
                                        });
                                      },
                                    ),
                                    Text('fifth'),
                                    SizedBox(
                                      width: 62,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: sixthshirt,
                                      onChanged: (value) {
                                        setState(() {
                                          sixthshirt = value!;
                                        });
                                      },
                                    ),
                                    Text('sixth'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'ADD NOTES HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SpecialInstructionContainer(
                                    controller: addshortnotecontroller,
                                    hinttext:
                                        'Please write your special instruction here'),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SPECIAL INSTRUCTIONS AUDIO',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.mic,
                                      color: Colors.brown,
                                      size: 36,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomAudioInstruction(
                                  iconData: Icons.play_circle_outline,
                                  iconDataa: Icons.delete_outline,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SELECT THE CLOTH IMAGE HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ClothImageContainer(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      'images/cloth.jpeg',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        if (selectmeasurement == 'PAINTS')
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Add Pants Quantity:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110),
                                      child: MeasurementTextField(
                                          labelText: '',
                                          controller: pantquantitycontroller),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text('Add Pants Amount:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 17,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110),
                                      child: MeasurementTextField(
                                          labelText: '',
                                          controller: pantamountcontroller),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Waist Size",
                                          controller: waistSizeController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Hip Size",
                                          controller: hipSizeController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Inseam Length",
                                          controller: inseamController),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Outseam Length",
                                          controller: outseamController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Thigh Circumference",
                                          controller:
                                              thighCircumferenceController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Knee Circumference",
                                          controller:
                                              kneeCircumferenceController),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Leg Opening",
                                          controller: legOpeningController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Front rise",
                                          controller: frontRiseController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Back rise",
                                          controller: backRiseController),
                                    ),
                                    //one remaining fly lenghtfield
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: firstshirtp,
                                      onChanged: (value) {
                                        setState(() {
                                          firstshirtp = value!;
                                        });
                                      },
                                    ),
                                    Text('first'),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: secondshirtp,
                                      onChanged: (value) {
                                        setState(() {
                                          secondshirtp = value!;
                                        });
                                      },
                                    ),
                                    Text('second'),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: thirdshirtp,
                                      onChanged: (value) {
                                        setState(() {
                                          thirdshirtp = value!;
                                        });
                                      },
                                    ),
                                    Text('third'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: fourthshirtp,
                                      onChanged: (value) {
                                        setState(() {
                                          fourthshirtp = value!;
                                        });
                                      },
                                    ),
                                    Text('forth'),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: fifthshirtp,
                                      onChanged: (value) {
                                        setState(() {
                                          fifthshirtp = value!;
                                        });
                                      },
                                    ),
                                    Text('fifth'),
                                    SizedBox(
                                      width: 62,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: sixthshirtp,
                                      onChanged: (value) {
                                        setState(() {
                                          sixthshirtp = value!;
                                        });
                                      },
                                    ),
                                    Text('sixth'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'ADD NOTES HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SpecialInstructionContainer(
                                    controller: addinstructionpantcontroller,
                                    hinttext:
                                        'Please write your special instruction here'),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SPECIAL INSTRUCTIONS AUDIO',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.mic,
                                      color: Colors.brown,
                                      size: 36,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomAudioInstruction(
                                  iconData: Icons.play_circle_outline,
                                  iconDataa: Icons.delete_outline,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SELECT THE CLOTH IMAGE HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ClothImageContainer(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      'images/cloth.jpeg',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        if (selectmeasurement == 'SUITS')
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Add SUIT Quantity:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110),
                                      child: MeasurementTextField(
                                          labelText: '',
                                          controller: shkamizquantity),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text('Add SUIT Amount:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 17,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110),
                                      child: MeasurementTextField(
                                          labelText: '',
                                          controller: shkamizamount),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "kamis Length",
                                          controller: kamizLengthController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "Sleeve",
                                          controller:
                                              kamizsleeveLengthController),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MeasurementTextField(
                                          labelText: "SHOULDER",
                                          controller:
                                              kamizshoulderWidthController),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: MeasurementTextField(
                                //           labelText: "CHEST",
                                //           controller: kamizchestSizeController),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Expanded(
                                //       child: MeasurementTextField(
                                //           labelText: "Waist Size",
                                //           controller:
                                //               shalwarwaistSizeController),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Expanded(
                                //       child: MeasurementTextField(
                                //           labelText: "Hip Size",
                                //           controller: shalwarhipSizeController),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: MeasurementTextField(
                                //           labelText: "Inseam Length (Shalwar)",
                                //           controller:
                                //               shalwarinseamLengthController),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Expanded(
                                //       child: MeasurementTextField(
                                //           labelText:
                                //               "Outseam Length (Shalwar):",
                                //           controller:
                                //               shalwaroutseamLengthController),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Expanded(
                                //       child: MeasurementTextField(
                                //           labelText: "Bottom Opening (Shalwar)",
                                //           controller:
                                //               shalwarbottomOpeningController),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: firstshirtshl,
                                      onChanged: (value) {
                                        setState(() {
                                          firstshirtshl = value!;
                                        });
                                      },
                                    ),
                                    Text('first'),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: secondshirtshl,
                                      onChanged: (value) {
                                        setState(() {
                                          secondshirtshl = value!;
                                        });
                                      },
                                    ),
                                    Text('second'),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.brown),
                                      value: thirdshirtshl,
                                      onChanged: (value) {
                                        setState(() {
                                          thirdshirtshl = value!;
                                        });
                                      },
                                    ),
                                    Text('third'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Row(
                                //   children: [
                                //     Checkbox(
                                //       fillColor: MaterialStateProperty.all(
                                //           Colors.brown),
                                //       value: fourthshirtshl,
                                //       onChanged: (value) {
                                //         setState(() {
                                //           fourthshirtshl = value!;
                                //         });
                                //       },
                                //     ),
                                //     Text('forth'),
                                //     SizedBox(
                                //       width: 45,
                                //     ),
                                //     Checkbox(
                                //       fillColor: MaterialStateProperty.all(
                                //           Colors.brown),
                                //       value: fifthshirtshl,
                                //       onChanged: (value) {
                                //         setState(() {
                                //           fifthshirtshl = value!;
                                //         });
                                //       },
                                //     ),
                                //     Text('fifth'),
                                //     SizedBox(
                                //       width: 62,
                                //     ),
                                //     Checkbox(
                                //       fillColor: MaterialStateProperty.all(
                                //           Colors.brown),
                                //       value: sixthshirtshl,
                                //       onChanged: (value) {
                                //         setState(() {
                                //           sixthshirtshl = value!;
                                //         });
                                //       },
                                //     ),
                                //     Text('sixth'),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'ADD NOTES HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SpecialInstructionContainer(
                                    controller: addkamisnotesscontroller,
                                    hinttext:
                                        'Please write your special instruction here'),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SPECIAL INSTRUCTIONS AUDIO',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.mic,
                                      color: Colors.brown,
                                      size: 36,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomAudioInstruction(
                                  iconData: Icons.play_circle_outline,
                                  iconDataa: Icons.delete_outline,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SELECT THE CLOTH IMAGE HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ClothImageContainer(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      'images/cloth.jpeg',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                      ],
                    )),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  onPressed: () async {
                    //convert all to text.trim if possible

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Please wait.......'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SpinKitDualRing(
                                color: Colors.blue,
                                size: 70,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Update user...'),
                            ],
                          ),
                        );
                      },
                    );
                    await Future.delayed(Duration(milliseconds: 500));

                    await context.read<UpdateProvder>().updateCustomerRecord(
                        widget.taskID,
                        context,
                        selectmeasurement.toString(),
                        Namecontroller.text.trim(),
                        phonecontroller.text.trim(),
                        addresscontroller.text.trim(),
                        Gender.toString(),
                        Orderdatecontroller.text.trim(),
                        Deliverydatecontroller.text.trim(),
                        pamentstatus,
                        orderstatus,
                        selectworker,
                        shkamizquantity.text.trim(),
                        shkamizamount.toString(),
                        kamizLengthController.text.trim(),
                        sleeveLengthController.text.trim(),
                        addkamisnotesscontroller.text.trim(),
                        firstshirtshl,
                        secondshirtshl,
                        thirdshirtshl,
                        fourthshirtshl,
                        shortquantitycontroller.text.trim(),
                        shortamountcontroller.text.trim(),
                        addshortnotecontroller.text.trim(),
                        shoulderController.text.trim(),
                        pantamountcontroller.text.trim(),
                        pantquantitycontroller.text.trim());

                    //   addCustomerRecord(
                    //           context,
                    //           selectmeasurement.toString(),
                    //           Namecontroller.text.trim(),
                    //           phonecontroller.text.trim(),
                    //           addresscontroller.text.trim(),
                    //           Gender.toString(),
                    //           Orderdatecontroller.text.trim(),
                    //           Deliverydatecontroller.text.trim(),
                    //           pamentstatus,
                    //           orderstatus,
                    //           selectworker,
                    //           shkamizquantity.text.trim(),
                    //           shkamizamount.toString(),
                    //           kamizLengthController.text.trim(),
                    //           sleeveLengthController.text.trim(),
                    //           addkamisnotesscontroller.text.trim(),
                    //           firstshirtshl,
                    //           secondshirtshl,
                    //           thirdshirtshl,
                    //           fourthshirtshl,
                    //           shortquantitycontroller.text.trim(),
                    //           shortamountcontroller.text.trim(),
                    //           addshortnotecontroller.text.trim(),
                    //           shoulderController.text.trim(),
                    //           pantamountcontroller.text.trim(),
                    //           pantquantitycontroller.text.trim());
                  },
                  color: Colors.brown,
                  text: 'Update')
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat.yMMMd().format(picked);
      });
    }
  }
}
