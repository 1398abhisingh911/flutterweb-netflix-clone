import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflixclone/app/routes/routes.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/dimensions.dart';
import 'package:netflixclone/app/shared/fonts.dart';
import 'package:netflixclone/meta/views/movie_details/movie_detail.dart';

playButton({required BuildContext context}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MovieDetailsRoute,
            //! The value is hardcoded as we have only single movie
            arguments: MovieDetailsArguments(id: "60ca5d55e6b3fa2398dacf3f"));
      },
      child: Container(
        width: 120.0,
        height: 50.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.play, color: Colors.black, size: 18.0),
              hSizedBox1,
              Text("Play",
                  style: TextStyle(
                      color: blackColor,
                      fontFamily: MONTSERRATB,
                      fontSize: 20.0))
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(),
            color: lightColor),
      ),
    ),
  );
}
