import 'package:flutter/material.dart';
import '../colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color, textColor;
  final bool loading;
  const AppButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.color = AppColors.buttonColor,
    this.textColor = Colors.white,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: screenHeight*0.05,
        width: screenWidth*0.35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(screenWidth*0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: screenWidth*0.015,
              spreadRadius: screenWidth*0.003,
              offset: Offset(
                0.0, // Move to right 7.0 horizontally
                screenHeight*0.002, // Move to bottom 8.0 Vertically
              ),
            ),
          ],
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Center(
                child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: screenWidth*.05, color: textColor,fontFamily: 'Reemkufi'),
              )),
      ),
    );
  }
}
