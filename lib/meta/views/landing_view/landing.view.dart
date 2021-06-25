import 'package:flutter/material.dart';
import 'package:netflixclone/meta/views/authentication_view/send_verification_email.popup.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  showSendVerificationEmailPopup(context: context);
                },
                child: Text("Sign up"))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("web/landing_bg.jpg"), fit: BoxFit.cover)),
          height: height,
          width: width,
        ));
  }
}
