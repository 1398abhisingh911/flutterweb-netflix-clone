import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/fonts.dart';
import 'package:netflixclone/meta/views/home/widgets/movieBlock.dart';
import 'package:netflixclone/meta/widgets/buttons/buttons.dart';

class MainBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget categoryText({required String text}) {
      return Text(text,
          style: TextStyle(
              fontFamily: MONTSERRATB, color: lightColor, fontSize: 20.0));
    }

    header() {
      return Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/poster2.jpg"),
                      fit: BoxFit.cover)),
              width: width,
              height: 600),
          Positioned(
              left: 250.0, top: 450.0, child: playButton(context: context)),
          Positioned(
              top: 575.0, left: 5, child: categoryText(text: "Trending Now"))
        ],
      );
    }

    return Container(
      color: blackColor,
      height: height,
      width: width * 0.95,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [header(), MoviesBlock()],
        ),
      ),
    );
  }
}
