import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoishob/res/components/AppButton.dart';
import 'package:shoishob/res/components/AppTextField.dart';
import 'package:shoishob/view/verify_email.dart';

import '../res/colors.dart';
import '../services/session_manager.dart';
import '../utils/routes/route_name.dart';
import '../utils/utils.dart';
import '../view_model/authentication/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
            SessionController().userEmail=emailController.text;
        Navigator.pushNamed(context, RouteName.verifyEmail);
        // Navigator.pushNamed(context, RouteName.dashBoard);
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
                    height: screenHeight * .3,
                    image: const AssetImage('assets/images/login.png'),
                  ),
                ),
                SizedBox(height: screenHeight * .05),
                Container(
                  padding: EdgeInsets.only(left: screenWidth * .15),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Login",
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
                    "please sign in to continue",
                    style: TextStyle(
                      fontFamily: 'subtile',
                      fontSize: screenWidth * 0.05,
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
                      AppTextField(
                          myController: passwordController,
                          focusNode: passwordFocusNode,
                          onFiledSubmittedValue: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter password' : null;
                          },
                          keyBoardType: TextInputType.visiblePassword,
                          hint: "password",
                          obsecureText: true),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteName.forgotPasswordScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * .2),
                    child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontSize: screenWidth * 0.03,
                          color: AppColors.heading1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .15),
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppButton(
                        title: "Login",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            signInWithEmailAndPassword();
                          }
                        }),
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.registerScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * .2),
                    child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontSize: screenWidth * 0.04,
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
      ),
    );
  }
}
