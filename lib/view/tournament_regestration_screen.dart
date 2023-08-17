import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:shoishob/services/session_manager.dart';
import 'package:uuid/uuid.dart';

import '../dbHelper/constants.dart';
import '../dbHelper/mongoDB.dart';
import '../res/colors.dart';
import '../res/components/AppTextField.dart';
import '../utils/utils.dart';
import 'Invoice.dart';
import 'invoice2.dart';

class TournamentRegistrationScreen extends StatefulWidget {
  const TournamentRegistrationScreen(
      {super.key,
      required this.tournament_name,
      required this.turf_name,
      required this.email,
      required this.turf_id,
      required this.ownerPhone,
      required this.address,
      required this.city,
      required this.price,
      required this.person,
      required this.logo,
      required this.cover,
      required this.about,
      required this.rules,
      required this.reg_start,
      required this.reg_end,
      required this.id});
  final mongo.ObjectId id;
  final String tournament_name,
      turf_name,
      email,
      turf_id,
      ownerPhone,
      address,
      city,
      price,
      person,
      logo,
      cover,
      about,
      rules,
      reg_start,
      reg_end;

  @override
  State<TournamentRegistrationScreen> createState() =>
      _TournamentRegistrationScreenState();
}

class _TournamentRegistrationScreenState
    extends State<TournamentRegistrationScreen> {
  var uuid = Uuid();
  final _formKey = GlobalKey<FormState>();
  final turfNameController = TextEditingController();
  final turfNameFocusNode = FocusNode();
  final addressController = TextEditingController();
  final addressFocusNode = FocusNode();
  final captainNameController = TextEditingController();
  final captainFocusNode = FocusNode();
  final emailController1 = TextEditingController();
  final email1FocusNode = FocusNode();
  final emailController2 = TextEditingController();
  final email2FocusNode = FocusNode();
  final emailController3 = TextEditingController();
  final email3FocusNode = FocusNode();
  final emailController4 = TextEditingController();
  final email4FocusNode = FocusNode();
  final emailController5 = TextEditingController();
  final email5FocusNode = FocusNode();
  final emailController6 = TextEditingController();
  final email6FocusNode = FocusNode();
  final emailController7 = TextEditingController();
  final email7FocusNode = FocusNode();
  final personController = TextEditingController();
  final personFocusNode = FocusNode();
  final phoneController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final priceController = TextEditingController();
  final priceFocusNode = FocusNode();
  final teamNameController = TextEditingController();
  final teamNameFocusNode = FocusNode();
  final tournamentNameController = TextEditingController();
  final tournamentNameFocusNode = FocusNode();
  final cityController = TextEditingController();
  final cityFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(widget.id);
    tournamentNameController.text = widget.tournament_name;
    turfNameController.text = widget.turf_name;
    personController.text = "${widget.person} persons";
    captainNameController.text = SessionController().userName.toString();
    emailController1.text = SessionController().userEmail.toString();
    priceController.text = widget.price;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tournament Registration"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: tournamentNameController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {},
                      keyBoardType: TextInputType.text,
                      hint: "",
                      enable: false,
                      obsecureText: false,
                      focusNode: tournamentNameFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: turfNameController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {},
                      keyBoardType: TextInputType.text,
                      hint: "",
                      enable: false,
                      obsecureText: false,
                      focusNode: turfNameFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: personController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {},
                      keyBoardType: TextInputType.text,
                      hint: "",
                      enable: false,
                      obsecureText: false,
                      focusNode: personFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: captainNameController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {},
                      keyBoardType: TextInputType.text,
                      hint: "",
                      enable: false,
                      obsecureText: false,
                      focusNode: captainFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Divider(
                          thickness: screenHeight * 0.001, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: teamNameController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "Team name",
                      enable: true,
                      obsecureText: false,
                      focusNode: teamNameFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController1,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {},
                      keyBoardType: TextInputType.text,
                      hint: "",
                      enable: false,
                      obsecureText: false,
                      focusNode: email1FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController2,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "2nd person's email account",
                      obsecureText: false,
                      focusNode: email2FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController3,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "3rd person's email account",
                      obsecureText: false,
                      focusNode: email3FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController4,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "4th person's email account",
                      obsecureText: false,
                      focusNode: email4FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController5,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "5th person's email account",
                      obsecureText: false,
                      focusNode: email5FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController6,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "6th person's email account",
                      obsecureText: false,
                      focusNode: email6FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: emailController7,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "7th person's email account",
                      obsecureText: false,
                      focusNode: email7FocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Divider(
                          thickness: screenHeight * 0.001, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: addressController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "Address",
                      obsecureText: false,
                      focusNode: addressFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: cityController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.text,
                      hint: "city",
                      obsecureText: false,
                      focusNode: cityFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: phoneController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "cannot be null" : null;
                      },
                      keyBoardType: TextInputType.number,
                      hint: "Phone",
                      obsecureText: false,
                      focusNode: phoneFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    AppTextField(
                      myController: priceController,
                      onFiledSubmittedValue: (value) {},
                      onValidator: (value) {},
                      keyBoardType: TextInputType.text,
                      hint: "",
                      enable: false,
                      obsecureText: false,
                      focusNode: priceFocusNode,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          sslCommerzGeneralCall(
                              addressController.text,
                              captainNameController.text,
                              cityController.text,
                              DateTime.now(),
                              DateTime.now(),
                              emailController1.text,
                              int.parse(widget.person),
                              emailController2.text,
                              emailController3.text,
                              emailController4.text,
                              emailController5.text,
                              emailController6.text,
                              emailController7.text,
                              phoneController.text,
                              int.parse(priceController.text),
                              teamNameController.text,
                              "",
                              false,
                              widget.id);
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
              ],
            ),
          )
        ],
      )),
    );
  }

  Future<void> sslCommerzGeneralCall(
      String address,
      String captainName,
      String city,
      DateTime createdAt,
      DateTime updatedAt,
      String email,
      int person,
      String player2Email,
      String player3Email,
      String player4Email,
      String player5Email,
      String player6Email,
      String player7Email,
      String playerPhoneOne,
      int price,
      String teamName,
      transactionId,
      bool paid,
      mongo.ObjectId tournamentId) async {
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
        print("OK");
        MongoDatabase().insertTournamentRegistrationInfo(
            address,
            captainName,
            city,
            createdAt,
            updatedAt,
            email,
            person,
            player2Email,
            player3Email,
            player4Email,
            player5Email,
            player6Email,
            player7Email,
            playerPhoneOne,
            price,
            teamName,
            transactionId,
            true,
            tournamentId);

       Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Invoice2(
                    turfName: turfNameController.text,
                    transactionID: transactionId,
                    phone: phoneController.text,
                    captainEmail: emailController1.text,
                    captainName: captainNameController.text,
                    tournamentName: tournamentNameController.text,
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
