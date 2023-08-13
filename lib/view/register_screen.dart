import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dbHelper/mongoDB.dart';
import '../res/colors.dart';
import '../res/components/AppButton.dart';
import '../res/components/AppTextField.dart';
import '../utils/routes/route_name.dart';
import '../utils/utils.dart';
import '../view_model/authentication/auth.dart';

class ResisterScreen extends StatefulWidget {
  const ResisterScreen({super.key});

  @override
  State<ResisterScreen> createState() => _ResisterScreenState();
}

class _ResisterScreenState extends State<ResisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Utils.toastMessage("Check Email for Verification");
        Auth().sendEmailVerification();
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
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(width: screenWidth * .1),
              Image(
                height: screenHeight * 0.25,
                image: const AssetImage('assets/images/register.png'),
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * .15),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: screenWidth * 0.1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading1,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * .15),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Fill information in to continue",
                  style: TextStyle(
                    fontFamily: 'subtile',
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w700,
                    color: AppColors.subtitle1,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * .02),
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
                        keyBoardType: TextInputType.name,
                        hint: "Name",
                        obsecureText: false),
                    SizedBox(height: screenHeight * .015),
                    AppTextField(
                        myController: emailController,
                        focusNode: emailFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          return value.isEmpty ? 'Enter your email' : null;
                        },
                        keyBoardType: TextInputType.emailAddress,
                        hint: "E-mail ID",
                        obsecureText: false),
                    SizedBox(height: screenHeight * .015),
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
                    SizedBox(height: screenHeight * .05),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .15),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: AppButton(
                      title: "Register",
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          createUserWithEmailAndPassword();
                          DateTime datetime = DateTime.now();
                          MongoDatabase().insertUser(
                              nameController.text,
                              emailController.text,
                              "https://w7.pngwing.com/pngs/574/369/png-transparent-avatar-computer-icons-user-random-icons-purple-blue-heroes.png",
                              datetime,
                              datetime,
                              "user",
                              0
                          );
                        }
                      }),
                ),
              ),
              SizedBox(height: screenHeight * .03),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image(
              //       height: screenHeight * 0.045,
              //       image: const AssetImage('assets/images/google.png'),
              //     ),
              //   ],
              // ),
              // SizedBox(height: screenHeight * .01),
              // Text(
              //   "You can sign-in from here",
              //   style: TextStyle(
              //     fontFamily: 'Raleway',
              //     fontSize: screenWidth * 0.035,
              //     fontWeight: FontWeight.bold,
              //     color: AppColors.heading1,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
