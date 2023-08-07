import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoishob/res/components/AppButton.dart';
import 'package:shoishob/view/payment.dart';

import '../res/colors.dart';
import '../res/components/AppTextField.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    super.key,
    required this.name,
    required this.address,
    required this.price,
    required this.userName,
    required this.userEmail,
  });
  final String name, address, price, userName, userEmail;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "USA", child: Text("8.00 AM - 9.00 AM")),
      DropdownMenuItem(value: "Canada", child: Text("9.00 AM - 10.00 AM")),
      DropdownMenuItem(value: "Brazil", child: Text("10.00 AM - 11.00 AM")),
      DropdownMenuItem(value: "England", child: Text("11.00 AM - 12.00 PM")),
    ];
    return menuItems;
  }

  String selectedValue = "USA";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    nameController.text = widget.userName.toString();
    emailController.text = widget.userEmail.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking",
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
              Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: screenWidth * 0.09, fontFamily: "Raleway"),
                ),
              ),
              Text(
                widget.address,
                style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                    fontFamily: "subtile"),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "${widget.price} Taka per Hour",
                style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: AppColors.subtitle1,
                    fontFamily: "Reemkufi"),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Please Fill this following form to make payment",
                style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontFamily: "subtile",
                    fontWeight: FontWeight.w500),
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
                      onValidator: (value) {},
                      enable: false,
                      keyBoardType: TextInputType.emailAddress,
                      hint: widget.userName,
                      obsecureText: false,
                    ),
                    SizedBox(height: screenHeight * .02),
                    AppTextField(
                        myController: emailController,
                        focusNode: emailFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        enable: false,
                        keyBoardType: TextInputType.visiblePassword,
                        hint: widget.userEmail,
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
                        "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}",
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
              Center(
                child: Container(
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
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.16),
                    child: DropdownButton(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'subtile',
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                      ),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        userName: widget.userName,
                        price: widget.price,
                        turfName: widget.name,
                        userMail: widget.userEmail,
                        slot: selectedValue,
                        date:
                            "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}",
                      ),
                    ),
                  );
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
                      "Book",
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
