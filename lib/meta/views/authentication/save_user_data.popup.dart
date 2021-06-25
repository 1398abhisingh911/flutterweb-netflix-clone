import 'package:netflixclone/app/routes/routes.dart';
import 'authentication.import.dart';

customTextField(
    {required String hintText,
    required TextEditingController textEditingController}) {
  return Container(
    width: 400.0,
    child: TextField(
      controller: textEditingController,
      style: TextStyle(
          color: darkColor,
          fontFamily: MONTSERRAT,
          fontWeight: FontWeight.bold,
          fontSize: 18.0),
      decoration: InputDecoration(
          filled: true,
          fillColor: lightColor,
          border:
              OutlineInputBorder(borderSide: new BorderSide(color: redColor)),
          hintStyle: new TextStyle(
              color: textColor, fontFamily: MONTSERRATB, fontSize: 14.0),
          hintText: hintText),
    ),
  );
}

showSaveDataPopup({required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var authenticationNotifier =
      Provider.of<AuthenticationNotifier>(context, listen: false);
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
                      Text("Hello there",
                          style: TextStyle(
                              color: lightColor,
                              fontSize: width > 500 ? 30 : 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: MONTSERRATB)),
                      vSizedBox4,
                      customTextField(
                          hintText: "John Wick",
                          textEditingController: nameController),
                      vSizedBox2,
                      customTextField(
                          hintText: "johnwickspassword",
                          textEditingController: passwordController),
                      vSizedBox3,
                      CustomButton(
                          height: 40.0,
                          width: 150,
                          color: redColor,
                          ontap: () {
                            authenticationNotifier
                                .saveUserData(
                                    username: nameController.text,
                                    useremail:
                                        authenticationNotifier.newuseremail,
                                    userpassword: passwordController.text)
                                .whenComplete(() {
                              if (authenticationNotifier.isUserDataSaved) {
                                Navigator.of(context).pushNamed(HomeRoute);
                              }
                            });
                          },
                          title: "Sign up"),
                      vSizedBox2,
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Already have an account?",
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
                                color: lightColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: MONTSERRATB)),
                      ]))
                    ],
                  ),
                  color: darkColor,
                  width: 500,
                  height: 500,
                );
              },
            ),
          ));
}
