import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoishob/res/components/AppButton.dart';
import 'package:shoishob/res/components/AppTextField.dart';

import '../res/colors.dart';
import '../utils/routes/route_name.dart';
import '../utils/utils.dart';
import '../view_model/authentication/auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  bool isLogin = false;

  Future<void> forgotPassword() async {
    try {
      await Auth().forgotPassword(email: emailController.text).then((value) {
        Utils.toastMessage("An email Has been sent to your mail");
        Navigator.pushNamed(context, RouteName.loginScreen);
      });
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image(
                    height: screenHeight * .2,
                    image: const AssetImage('assets/images/login.png'),
                  ),
                ),
                SizedBox(height: screenHeight * .05),
                Container(
                  padding: EdgeInsets.only(left: screenWidth * .15),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Recover Password",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: AppColors.heading1,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: screenWidth * .15),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "please enter your mail to continue",
                    style: TextStyle(
                      fontFamily: 'subtile',
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w700,
                      color: AppColors.subtitle1,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .01),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        myController: emailController,
                        focusNode: emailFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty ? 'Enter your email' : null;
                        },
                        keyBoardType: TextInputType.emailAddress,
                        hint: "E-mail ID",
                        obsecureText: false,
                      ),
                      SizedBox(height: screenHeight * .02),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .15),
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppButton(
                        title: "Recover",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            forgotPassword();
                          }
                        }),
                  ),
                ),
                SizedBox(height: screenHeight * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
