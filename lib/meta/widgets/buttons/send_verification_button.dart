import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/fonts.dart';

sendVerificationCodeButton(
    {required BuildContext context,
    required Color buttonColor,
    required String buttonTitle,
    required dynamic onTap}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
          width: 320.0,
          height: 40.0,
          child: Center(
            child: Text(buttonTitle,
                style: TextStyle(
                    color: lightColor,
                    fontFamily: MONTSERRATB,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: redColor)),
    ),
  );
}
