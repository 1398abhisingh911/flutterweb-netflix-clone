import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/dimensions.dart';
import 'package:netflixclone/app/shared/text_styles.dart';
import 'package:netflixclone/core/notifiers/authentication.notifier.dart';
import 'package:netflixclone/meta/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

//LAYOUTBUIDER
//RESPONSEIVEBUILDER
//MEDIAQUERY

showSendVerificationEmailPopup({required BuildContext context}) {
  final verificationEmailController = TextEditingController();
  var authenticationNotifer =
      Provider.of<AuthenticationNotifier>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Builder(
              builder: (context) => Container(
                height: 500,
                width: 500,
                color: darkColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: lightColor,
                              )),
                        ],
                      ),
                      vSizedBox2,
                      Text(
                        "Create a free account for getting started",
                        style: smalltextB,
                      ),
                      vSizedBox3,
                      customTextField(
                          width: 400,
                          textEditingController: verificationEmailController,
                          hintText: "Enter email address"),
                      vSizedBox3,
                      ElevatedButton(
                          onPressed: () async {
                            print(verificationEmailController.text);
                            await authenticationNotifer.sendEmailVerification(
                                useremail: verificationEmailController.text);
                          },
                          child: Text("Send mail")),
                      vSizedBox3,
                      Text(Provider.of<AuthenticationNotifier>(context,
                              listen: true)
                          .newuseremail)
                    ],
                  ),
                  physics: ClampingScrollPhysics(),
                ),
              ),
            ),
            insetPadding: EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ));
}
