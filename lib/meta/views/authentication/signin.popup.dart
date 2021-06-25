import 'authentication.import.dart';

showSignInPopup({required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  var authenticationNotifier =
      Provider.of<AuthenticationNotifier>(context, listen: false);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            insetPadding: EdgeInsets.all(5.0),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        vSizedBox2,
                        Text("Welcome back",
                            style: TextStyle(
                                color: lightColor,
                                fontSize: width > 500 ? 30 : 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: MONTSERRATB)),
                        vSizedBox4,
                        Container(
                          width: 400.0,
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                                color: darkColor,
                                fontFamily: MONTSERRAT,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: lightColor,
                                border: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: redColor)),
                                hintStyle: new TextStyle(
                                    color: textColor,
                                    fontFamily: MONTSERRATB,
                                    fontSize: 14.0),
                                hintText: "Johnwick@gmail.com"),
                          ),
                        ),
                        vSizedBox2,
                        Container(
                          width: 400.0,
                          child: TextField(
                            controller: passwordController,
                            style: TextStyle(
                                color: darkColor,
                                fontFamily: MONTSERRAT,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: lightColor,
                                border: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: redColor)),
                                hintStyle: new TextStyle(
                                    color: textColor,
                                    fontFamily: MONTSERRATB,
                                    fontSize: 14.0),
                                hintText: "Password"),
                          ),
                        ),
                        vSizedBox3,
                        CustomButton(
                            height: 40.0,
                            width: 150,
                            color: redColor,
                            ontap: () async {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                authenticationNotifier.userlogin(
                                    context: context,
                                    useremail: emailController.text,
                                    userpassword: passwordController.text);
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
                                          "Fill the details",
                                          style: TextStyle(color: lightColor),
                                        ),
                                      );
                                    });
                              }
                            },
                            title: "Sign in"),
                        vSizedBox2,
                        vSizedBox3,
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "New to Netflix? ",
                              style: TextStyle(
                                  color: lightColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: MONTSERRAT)),
                          TextSpan(
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  sendEmailVerificationPopup1(context: context);
                                },
                              text: "Sign Up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: lightColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: MONTSERRATB)),
                        ]))
                      ],
                    ),
                    height: 500,
                    color: darkColor,
                    width: 500);
              },
            ),
          ));
}
