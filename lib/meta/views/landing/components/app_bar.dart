import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/dimensions.dart';
import 'package:netflixclone/app/shared/fonts.dart';
import 'package:netflixclone/meta/views/authentication/signin.popup.dart';
import 'package:netflixclone/meta/widgets/custom_button1.dart';

class LandingBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ColorFiltered(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.85), BlendMode.darken),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/landing-bg1.jpg"),
                  fit: BoxFit.cover)),
        ));
  }
}

class LandingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Row(
        children: [
          Spacer(),
          CustomButton(
              height: 40.0,
              width: 80.0,
              color: redColor,
              title: "Sign in",
              ontap: () {
                showSignInPopup(context: context);
              }),
          width > 500 ? hSizedBox4 : hSizedBox2
        ],
      ),
    );
  }
}

class LandingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      curve: Curves.easeInCirc,
      duration: Duration(milliseconds: 100),
      height: 500.0,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("""Unlimited movies, TV 
    shows and more. """,
                style: TextStyle(
                    color: lightColor,
                    fontSize: width > 500 ? 60 : 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: MONTSERRATB)),
            vSizedBox1,
            Text("Watch anywhere. Cancel anytime",
                style: TextStyle(
                    color: lightColor,
                    fontSize: width > 500 ? 30 : 18,
                    fontFamily: MONTSERRAT)),
            vSizedBox1,
            Text(
                "Ready to watch? Enter your email to create or restart your membership.",
                style: TextStyle(
                    color: lightColor,
                    fontSize: width > 500 ? 18 : 12,
                    fontFamily: MONTSERRAT)),
            vSizedBox2,
            Container(
              width: width > 500 ? 500.0 : 400,
              child: TextField(
                style: TextStyle(
                    color: darkColor,
                    fontFamily: MONTSERRAT,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: lightColor,
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: redColor)),
                    hintStyle: new TextStyle(
                        color: textColor,
                        fontFamily: MONTSERRATB,
                        fontSize: 14.0),
                    hintText: "Enter your email"),
              ),
            ),
            vSizedBox3,
            CustomButton(
                height: 40.0,
                width: 120.0,
                color: redColor,
                ontap: () {},
                title: "Get started")
          ],
        ),
      ),
    );
  }
}
