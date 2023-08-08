// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';
import 'package:uuid/uuid.dart';
import '../dbHelper/constants.dart';
import '../res/colors.dart';
import '../res/components/AppTextField.dart';
import '../utils/utils.dart';
import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCEMITransactionInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCShipmentInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/General.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

import 'Invoice.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key,
      required this.turfName,
      required this.userName,
      required this.userMail,
      required this.slot,
      required this.price,
      required this.date,
      required this.logo,
      required this.ownerId});

  final String? turfName, userName, userMail, slot, price, date, logo, ownerId;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890#';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final Random _rnd = Random();
  var uuid = Uuid();

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

  Future<int> getConfirmation(
      String mail, String date, String slots, String turf) async {
    var snap1 = await MongoDatabase.getBookingData(mail, date);
    var snap2 =
        await MongoDatabase.getBookingDataForDuplicated(slots, date, turf);
    print(snap2);
    int flag1 = 0, flag2 = 0;
    if (snap1 == null) {
      flag1 = 1;
    }
    if (snap2 == null) {
      flag2 = 1;
    }
    if (flag1 == 1 && flag2 == 1) {
      return 1;
    }
    if (flag1 == 0) {
      return 2;
    }
    if (flag2 == 0) {
      return 3;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String bookID = getRandomString(12);

    String slots = "9.00 AM-10.00 AM";

    if (widget.slot == "USA") slots = "04.00 PM - 5.00 PM";
    if (widget.slot == "Canada") slots = "05.00 PM - 6.00 PM";
    if (widget.slot == "Brazil") slots = "06.00 PM - 7.00 PM";
    if (widget.slot == "England") slots = "07.00 PM - 8.00 PM";
    if (widget.slot == "London") slots = "08.00 PM - 9.00 PM";
    if (widget.slot == "Australia") slots = "09.00 PM - 10.00 PM";
    if (widget.slot == "Zimbabwe") slots = "10.00 PM - 11.00 PM";
    if (widget.slot == "UgandaCapital") slots = "11.00 PM - 12.00 AM";
    if (widget.slot == "Argentina") slots = "12.00 AM - 1.00 AM";

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
                          thickness: screenHeight * 0.001, color: Colors.grey),
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
                          thickness: screenHeight * 0.001, color: Colors.grey),
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
                          thickness: screenHeight * 0.001, color: Colors.grey),
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
                          thickness: screenHeight * 0.001, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          int verdict = await getConfirmation(
                            emailController.text,
                            selectedDateController.text,
                            slots,
                            turfNameController.text,
                          );
                          if (verdict == 1) {
                            DateTime datetime = DateTime.now();
                            MongoDatabase().insertBookingData(
                                slots,
                                int.parse(priceController.text),
                                datetime,
                                datetime,
                                widget.logo.toString(),
                                emailController.text,
                                nameController.text,
                                phoneController.text,
                                addressController.text,
                                cityController.text,
                                widget.ownerId.toString(),
                                false,
                                int.parse(personController.text),
                                selectedDateController.text,
                                "",
                                turfNameController.text);

                            ///SSLCOMMERZ
                            sslCommerzGeneralCall();

                            ///SSLCOMMERZ end
                          } else if (verdict == 2) {
                            Utils.toastMessage(
                                "Booking Failed : You already booked a slot for ${selectedDateController.text}");
                          } else if (verdict == 3) {
                            Utils.toastMessage(
                                "Booking failed : ${selectedDateController.text} $slots is already booked");
                          }
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
                    SizedBox(height: screenHeight * 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sslCommerzGeneralCall() async {
    String transactionId = uuid.v1();
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        ipn_url: "www.ipnurl.com",
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Booking",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: STOREID,
        store_passwd: STOREPASS,
        total_amount: double.parse(widget.price.toString()),
        tran_id: transactionId,
      ),
    );

    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      print(result.status!.toLowerCase());
      if (result.status!.toLowerCase() == "failed") {
        Utils.toastMessage("Transaction Failed");
      } else if (result.status!.toLowerCase() == "closed") {
        Utils.toastMessage("Payment not Complete");
      } else {
        MongoDatabase().updateTransaction(
            emailController.text,
            selectedDateController.text,
            selectedSlotController.text,
            transactionId);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Invoice(
                    date: selectedDateController.text,
                    phone: phoneController.text,
                    slot: selectedSlotController.text,
                    transactionID: transactionId,
                    turfName: turfNameController.text,
                    userName: nameController.text,
                  )),
        );

        Utils.toastMessage(
            "Transaction is Successful and Amount is ${result.amount}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
