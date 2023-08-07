import 'package:flutter/material.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';
import 'package:shoishob/res/components/AppButton.dart';
import 'package:shoishob/view/ticket.dart';

import '../res/colors.dart';
import '../res/components/AppTextField.dart';

class Transport extends StatefulWidget {
  const Transport({
    super.key,
  });

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();

  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("From"), value: "USA"),
      DropdownMenuItem(child: Text("Chawkbazar"), value: "Chawkbazar"),
      DropdownMenuItem(child: Text("Muradpur"), value: "Muradpur"),
      DropdownMenuItem(child: Text("Agrabad"), value: "Agrabad"),
      DropdownMenuItem(child: Text("Patenga"), value: "Patenga"),
      DropdownMenuItem(child: Text("LalKhanbazar"), value: "LalKhanbazar"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("To"), value: "USA"),
      DropdownMenuItem(child: Text("Chawkbazar"), value: "Chawkbazar"),
      DropdownMenuItem(child: Text("Muradpur"), value: "Muradpur"),
      DropdownMenuItem(child: Text("Agrabad"), value: "Agrabad"),
      DropdownMenuItem(child: Text("Patenga"), value: "Patenga"),
      DropdownMenuItem(child: Text("LalKhanbazar"), value: "LalKhanbazar"),
    ];
    return menuItems;
  }

  String selectedValue1 = "USA";
  String selectedValue2 = "USA";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transport",
          style: TextStyle(fontFamily: 'raleway', fontSize: screenWidth * 0.05),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 1.1,
          width: screenWidth * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Please Fill this following form for Transportation",
                style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontFamily: "subtile",
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: screenHeight * 0.02),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      myController: nameController,
                      focusNode: nameFocusNode,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? 'Enter your name' : null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      hint: "Name",
                      obsecureText: false,
                    ),
                    SizedBox(height: screenHeight * .02),
                    AppTextField(
                        myController: phoneController,
                        focusNode: phoneFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty
                              ? 'Enter your phone number'
                              : null;
                        },
                        keyBoardType: TextInputType.visiblePassword,
                        hint: "Phone",
                        obsecureText: false),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Select Date :",
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.bold),
                  ),
                  AppButton(
                    title:
                        "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                    onPress: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000));
                      if (pickedDate != null) {
                        selectedDate = pickedDate;
                        setState(() {});
                      } else {}
                    },
                    color: Colors.black,
                    textColor: AppColors.subtitle1,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: screenWidth * 0.02,
                          spreadRadius: screenWidth * 0.005,
                          color: Colors.grey.withOpacity(.5),
                          offset: Offset(
                            0.0, // Move to right 7.0 horizontally
                            screenWidth * 0.005,
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                      child: DropdownButton(
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'subtile',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                        value: selectedValue1,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue1 = newValue!;
                          });
                        },
                        items: dropdownItems1,
                      ),
                    ),
                  ),
                  Text(
                    "to",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontFamily: "subtile",
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: screenWidth * 0.02,
                          spreadRadius: screenWidth * 0.005,
                          color: Colors.grey.withOpacity(.5),
                          offset: Offset(
                            0.0, // Move to right 7.0 horizontally
                            screenWidth * 0.005,
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                      child: DropdownButton(
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'subtile',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                        value: selectedValue2,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue2 = newValue!;
                          });
                        },
                        items: dropdownItems2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ticket(
                            name: nameController.text,
                            phone: phoneController.text,
                            from: selectedValue1,
                            destination: selectedValue2,
                            date: selectedDate),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: screenWidth * 0.03,
                        spreadRadius: screenWidth * 0.003,
                        offset: Offset(
                          0.0, // Move to right 7.0 horizontally
                          screenWidth * 0.015, // Move to bottom 8.0 Vertically
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * .1,
                        vertical: screenWidth * .02),
                    child: Text(
                      "Get Ticket",
                      style: TextStyle(
                        fontFamily: 'Reemkufi',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.045,
                        color: AppColors.heading1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
