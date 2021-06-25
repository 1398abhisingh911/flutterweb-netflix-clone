import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:netflixclone/app/routes/routes.dart';
import 'package:netflixclone/core/api/authentication.api.dart';
import 'package:netflixclone/core/services/cache_data.service.dart';
import 'package:netflixclone/meta/views/authentication/authentication.import.dart';

class AuthenticationNotifier extends ChangeNotifier {
  bool _isVerified = false;
  bool get isVerified => _isVerified;

  bool _emailSend = false;
  bool get emailSend => _emailSend;

  late String _secretcode, _newuseremail;
  String get secretcode => _secretcode;
  String get newuseremail => _newuseremail;

  bool _isUserDataSaved = false;
  bool get isUserDataSaved => _isUserDataSaved;
  late String _jwtData = "";
  String get jwtData => _jwtData;

  bool _isUserLogged = false;
  bool get isUserLogged => _isUserLogged;

  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future sendEmailVerification({required String useremail}) async {
    try {
      _authenticationAPI
          .sendEmailVerification(useremail: useremail)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        final status = parsedData['received'];
        final useremail = parsedData['useremail'];
        final secretCode = parsedData['secretcode'];
        if (status) {
          _emailSend = true;
          _secretcode = secretCode;
          _newuseremail = useremail;
          print("Has email send : $emailSend");
          print("The secret passcode is $secretcode");
          print("The new user is $newuseremail");
          notifyListeners();
        } else {
          print("Error has occured");
          print(useremail);
        }
      });
    } on SocketException {} catch (error) {}
  }

  Future verifyEmail(
      {required String secretcode,
      required String secretcodeinput,
      required String useremail}) async {
    try {
      _authenticationAPI
          .verifyEmail(
              secretcode: secretcode,
              secretcodeinput: secretcodeinput,
              useremail: useremail)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        final status = parsedData['verified'];
        final useremail = parsedData['useremail'];
        if (status) {
          _isVerified = status;
          print("The email is verified : $status");
        } else {
          print("Error has occured");
          print(useremail);
        }
      });
    } on SocketException {} catch (error) {}
  }

  Future saveUserData(
      {required String username,
      required String useremail,
      required String userpassword}) async {
    try {
      _authenticationAPI
          .saveUserData(
              username: username,
              useremail: useremail,
              userpassword: userpassword)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        final authenticated = parsedData['authentication'];
        final authData = parsedData['data'];
        if (authenticated) {
          _isUserDataSaved = authenticated;
          _jwtData = authData;
          print("The user is $isUserDataSaved");
          print("The user data : $jwtData");
        } else {
          print("Something went wrong");
        }
      });
    } on SocketException {} catch (error) {}
  }

  Future userlogin(
      {required BuildContext context,
      required String useremail,
      required String userpassword}) async {
    try {
      _authenticationAPI
          .userlogin(useremail: useremail, userpassword: userpassword)
          .then((value) async {
        print(value);
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        final logged = parsedData['authentication'];
        final authData = parsedData['data'];
        print(logged);
        print(authData);
        if (logged) {
          _isUserLogged = logged;
          _jwtData = authData;
          print("The user is logged in : $logged");
          print("The user data is : $jwtData");
          if (jwtData.isNotEmpty) {
            var cacheNotifier =
                Provider.of<CacheNotifier>(context, listen: false);
            cacheNotifier
                .writeCache(key: "jwt", value: jwtData)
                .whenComplete(() {
              Navigator.of(context).pushNamed(HomeRoute);
            });
          }
        }
      });
    } on SocketException {} catch (error) {}
  }
}
