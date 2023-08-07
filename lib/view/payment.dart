import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';

import '../res/colors.dart';
import '../res/components/AppTextField.dart';

class PaymentScreen extends StatefulWidget {
  final String? turfName, userName, userMail, bookingId, slot, price, date;

  const PaymentScreen(
      {super.key,
      this.turfName,
      this.userName,
      this.userMail,
      this.bookingId,
      this.slot,
      this.price,
      this.date});

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890#';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => PaymentScreen._chars
              .codeUnitAt(_rnd.nextInt(PaymentScreen._chars.length)),
        ),
      );

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final bookIdController = TextEditingController();
  final bookIdFocusNode = FocusNode();
  final turfNameController = TextEditingController();
  final turfNameFocusNode = FocusNode();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final phoneController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final addressController = TextEditingController();
  final addressFocusNode = FocusNode();
  final cityController = TextEditingController();
  final cityFocusNode = FocusNode();
  final personController = TextEditingController();
  final personFocusNode = FocusNode();
  final priceController = TextEditingController();
  final priceFocusNode = FocusNode();
  final selectedDateController = TextEditingController();
  final selectedDateFocusNode = FocusNode();
  final selectedSlotController = TextEditingController();
  final selectedSlotFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String bookID = getRandomString(12);
    String slots = "9.00 AM-10.00 AM";
    if (widget.slot == "Canada") slots = "9.00 AM - 10.00 AM";
    if (widget.slot == "Brazil") slots = "10.00 AM - 11.00 AM";
    if (widget.slot == "England") slots = "11.00 AM - 12.00 PM";
    bookIdController.text = getRandomString(16);
    turfNameController.text = widget.turfName.toString();
    nameController.text = widget.userName.toString();
    emailController.text = widget.userMail.toString();
    priceController.text = widget.price.toString();
    selectedDateController.text = widget.date.toString();
    selectedSlotController.text = slots;
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Payment"),
      ),
      body: Container(
        height: screenHeight * 1.1,
        width: screenWidth * 1.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: bookIdController,
                        focusNode: bookIdFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: bookID,
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: turfNameController,
                        focusNode: turfNameFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: widget.turfName.toString(),
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: nameController,
                        focusNode: nameFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: widget.userName.toString(),
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: emailController,
                        focusNode: emailFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: widget.userMail.toString(),
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Divider(
                          thickness: screenHeight * 0.001, color: Colors.black),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: phoneController,
                        focusNode: phoneFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty
                              ? "please enter phone number"
                              : null;
                        },
                        keyBoardType: TextInputType.number,
                        hint: "Phone",
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: addressController,
                        focusNode: addressFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty ? "please enter address" : null;
                        },
                        keyBoardType: TextInputType.text,
                        hint: "Address",
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: cityController,
                        focusNode: cityFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty ? "please enter city" : null;
                        },
                        keyBoardType: TextInputType.text,
                        hint: "City",
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Divider(
                          thickness: screenHeight * 0.001, color: Colors.black),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: personController,
                        focusNode: personFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty ? "please enter a number" : null;
                        },
                        keyBoardType: TextInputType.number,
                        hint: "How person will come?",
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: priceController,
                        focusNode: priceFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: "${widget.price} taka",
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Divider(
                          thickness: screenHeight * 0.001, color: Colors.black),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: selectedDateController,
                        focusNode: selectedDateFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: widget.date.toString(),
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    AppTextField(
                        myController: selectedSlotController,
                        focusNode: selectedSlotFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {},
                        keyBoardType: TextInputType.text,
                        hint: slots,
                        enable: false,
                        obsecureText: false),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Divider(
                          thickness: screenHeight * 0.001, color: Colors.black),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          DateTime datetime = DateTime.now();
                          MongoDatabase().insertBookingData(
                              slots,
                              int.parse(priceController.text) ,
                              datetime,
                              datetime,
                              "",
                              emailController.text,
                              nameController.text,
                              phoneController.text,
                              bookIdController.text,
                              addressController.text,
                              cityController.text,
                              "",
                              false,
                              personController.text,
                              selectedDateController.text,
                              "",
                              turfNameController.text);
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
                                screenWidth *
                                    0.015, // Move to bottom 8.0 Vertically
                              ),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .1,
                              vertical: screenWidth * .02),
                          child: Text(
                            "Payment",
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
                    SizedBox(height: screenHeight * 0.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
