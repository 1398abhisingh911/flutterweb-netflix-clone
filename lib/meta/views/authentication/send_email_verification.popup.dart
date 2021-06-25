//--------------------------SEND EMAIL VERIFICATION-----------------------------
import 'authentication.import.dart';

sendEmailVerificationPopup1({required BuildContext context}) {
  final _authenticationNotifier =
      Provider.of<AuthenticationNotifier>(context, listen: false);
  final verificationCodeController = TextEditingController();
  final emailController = TextEditingController();
  return showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            insetPadding: EdgeInsets.all(2.0),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return Container(
                  width: 500,
                  color: darkColor,
                  height: 500,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close, color: greenColor))
                            ],
                          ),
                          vSizedBox2,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text("Build projects with Slatecode",
                                style: TextStyle(
                                    color: lightColor,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: MONTSERRATB)),
                          ),
                          vSizedBox2,
                          Text("Create a free account to get started!",
                              style: TextStyle(
                                  color: lightColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: MONTSERRAT)),
                          vSizedBox3,
                          Container(
                            width: 280.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                          vSizedBox3,
                          if (Provider.of<AuthenticationNotifier>(context,
                                      listen: true)
                                  .emailSend ==
                              true)
                            Center(
                              child: Container(
                                child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "Enter the verification code send at ",
                                      style: TextStyle(
                                          color: lightColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: MONTSERRAT)),
                                  TextSpan(
                                      text: Provider.of<AuthenticationNotifier>(
                                              context,
                                              listen: false)
                                          .newuseremail,
                                      style: TextStyle(
                                          color: lightColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: MONTSERRATB))
                                ])),
                              ),
                            ),
                          vSizedBox2,
                          customTextField(
                              hintText: Provider.of<AuthenticationNotifier>(
                                              context,
                                              listen: true)
                                          .emailSend ==
                                      true
                                  ? "Enter verification code"
                                  : "Email address",
                              textEditingController:
                                  Provider.of<AuthenticationNotifier>(context,
                                                  listen: true)
                                              .emailSend ==
                                          true
                                      ? verificationCodeController
                                      : emailController),
                          vSizedBox3,
                          sendVerificationCodeButton(
                              buttonColor: Provider.of<AuthenticationNotifier>(
                                              context,
                                              listen: true)
                                          .emailSend ==
                                      true
                                  ? greenColor
                                  : yellowColor,
                              buttonTitle: Provider.of<AuthenticationNotifier>(
                                              context,
                                              listen: true)
                                          .emailSend ==
                                      true
                                  ? "Enter verification code"
                                  : "Send verification code",
                              context: context,
                              onTap: () async {
                                if (Provider.of<AuthenticationNotifier>(context,
                                        listen: false)
                                    .emailSend) {
                                  emailController.clear();
                                  await _authenticationNotifier
                                      .verifyEmail(
                                          secretcode: Provider.of<
                                                      AuthenticationNotifier>(
                                                  context,
                                                  listen: false)
                                              .secretcode,
                                          secretcodeinput:
                                              verificationCodeController.text,
                                          useremail: Provider.of<
                                                      AuthenticationNotifier>(
                                                  context,
                                                  listen: false)
                                              .newuseremail)
                                      .whenComplete(() {
                                    if (_authenticationNotifier.isVerified ==
                                        true) {
                                      Navigator.pop(context);
                                      showSaveDataPopup(context: context);
                                    }
                                  });
                                } else {
                                  if (emailController.text.isNotEmpty) {
                                    await _authenticationNotifier
                                        .sendEmailVerification(
                                            useremail: emailController.text);
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: darkColor,
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Okay",
                                                    style: TextStyle(
                                                        color: lightColor),
                                                  ))
                                            ],
                                            content: Text(
                                              "Enter email address",
                                              style:
                                                  TextStyle(color: lightColor),
                                            ),
                                          );
                                        });
                                  }
                                }
                              }),
                          vSizedBox3,
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Already a member? ",
                                style: TextStyle(
                                    color: lightColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: MONTSERRAT)),
                            TextSpan(
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                    showSignInPopup(context: context);
                                  },
                                text: "Sign In",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: yellowColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: MONTSERRATB)),
                          ]))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ));
}
