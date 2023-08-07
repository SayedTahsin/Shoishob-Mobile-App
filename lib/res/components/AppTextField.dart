import 'package:flutter/material.dart';

import '../colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.myController,
    required this.focusNode,
    required this.onFiledSubmittedValue,
    required this.onValidator,
    required this.keyBoardType,
    required this.hint,
    required this.obsecureText,
    this.enable = true,
    this.autoFocus = false,
    this.maxline = 1,
  }) : super(key: key);

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final int maxline;
  final bool obsecureText, enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: screenWidth * 0.015,
              spreadRadius: screenWidth * 0.005,
              offset: Offset(
                0.0, // Move to right 7.0 horizontally
                screenWidth * 0.005, // Move to bottom 8.0 Vertically
              ),
            ),
          ],
        ),
        child: TextFormField(
          controller: myController,
          focusNode: focusNode,
          obscureText: obsecureText,
          onFieldSubmitted: onFiledSubmittedValue,
          validator: onValidator,
          keyboardType: keyBoardType,
          cursorColor: AppColors.heading1,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              height: screenHeight * 0.001, fontSize: screenWidth * 0.04),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            enabled: enable,
            contentPadding: EdgeInsets.all(screenWidth * 0.03),
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                height: 0,
                color: Colors.grey.withOpacity(0.7),
                fontSize: screenHeight * 0.02,
                fontFamily: 'Raleway'),

            // border: const OutlineInputBorder(
            //   borderSide: BorderSide(color: AppColors.heading1),
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            // ),
            // focusedBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: AppColors.heading1),
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            // enabledBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: AppColors.heading1),
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
          ),
        ),
      ),
    );
  }
}
