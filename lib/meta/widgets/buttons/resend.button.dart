import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/fonts.dart';

resentButton({required dynamic onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: redColor,
        ),
        child: Center(
          child: Text(
            "Resend",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: MONTSERRATB,
                fontSize: 16.0,
                color: lightColor),
          ),
        ),
      ),
    ),
  );
}
