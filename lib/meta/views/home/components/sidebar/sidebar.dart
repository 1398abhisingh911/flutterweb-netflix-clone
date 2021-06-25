import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/dimensions.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    iconButtons(
        {required bool isOpen,
        required dynamic onPressed,
        required IconData iconData}) {
      return Column(
        children: [
          IconButton(
              color: lightColor,
              onPressed: () {
                onPressed();
              },
              icon: Icon(iconData)),
          if (isOpen)
            Container(
              width: 15.0,
              height: 5,
              color: redColor,
            )
        ],
      );
    }

    return Container(
        width: width * 0.05,
        child: Center(
          child: Column(
            children: [
              vSizedBox2,
              SizedBox(
                height: 50.0,
                width: 40.0,
                child: Image.asset("assets/images/logo.png"),
              ),
              vSizedBox4,
              vSizedBox3,
              iconButtons(
                  isOpen: false, iconData: EvaIcons.search, onPressed: () {}),
              vSizedBox2,
              iconButtons(
                  isOpen: true, iconData: EvaIcons.home, onPressed: () {}),
              vSizedBox2,
              iconButtons(
                  isOpen: false, iconData: EvaIcons.tv, onPressed: () {}),
              vSizedBox2,
              iconButtons(
                  isOpen: false,
                  iconData: EvaIcons.videoOutline,
                  onPressed: () {}),
              vSizedBox2,
              iconButtons(
                  isOpen: false,
                  iconData: EvaIcons.shoppingBag,
                  onPressed: () {}),
              vSizedBox2,
              iconButtons(
                  isOpen: false,
                  iconData: EvaIcons.plusCircle,
                  onPressed: () {}),
            ],
          ),
        ),
        decoration: BoxDecoration(color: blackColor),
        height: height);
  }
}
