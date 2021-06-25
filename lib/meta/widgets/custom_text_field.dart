import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/text_styles.dart';

customTextField(
    {required String hintText,
    required double width,
    required TextEditingController textEditingController}) {
  return Container(
    width: width,
    child: TextField(
      style: smalltextR,
      controller: textEditingController,
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderSide: new BorderSide(color: redColor)),
          hintText: hintText,
          hintStyle: smalltextR),
    ),
  );
}
