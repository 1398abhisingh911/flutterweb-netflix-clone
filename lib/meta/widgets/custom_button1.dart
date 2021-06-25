import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width, height;
  final Color color;
  final dynamic ontap;
  const CustomButton(
      {required this.height,
      required this.width,
      required this.color,
      required this.ontap,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 100),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: lightColor, width: 0.2)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: lightColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: MONTSERRAT),
            ),
          ),
        ),
      ),
    );
  }
}
