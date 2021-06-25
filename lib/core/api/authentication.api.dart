import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflixclone/app/routes/api_routes.dart';

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future sendEmailVerification({required String useremail}) async {
    final String suburl = "/user/send-email-verification";
    final Uri uri = Uri.parse(BaseUrl + suburl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({"useremail": useremail}), headers: headers);
    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode == 200) {
      return body;
    } else {
      print("Error occured");
    }
  }

  Future verifyEmail(
      {required String secretcode,
      required String secretcodeinput,
      required String useremail}) async {
    final String suburl = "/user/verify-email";
    final Uri uri = Uri.parse(BaseUrl + suburl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "secretcode": secretcode,
          "secretcodeinput": secretcodeinput,
          "useremail": useremail
        }),
        headers: headers);
    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode == 200) {
      return body;
    } else {
      print("Error occured");
    }
  }

  Future saveUserData(
      {required String username,
      required String useremail,
      required String userpassword}) async {
    final String suburl = "/user/save-user-data";
    final Uri uri = Uri.parse(BaseUrl + suburl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "username": username,
          "useremail": useremail,
          "userpassword": userpassword
        }),
        headers: headers);
    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode == 200) {
      return body;
    } else {
      print("Error occured");
    }
  }

  Future userlogin(
      {required String useremail, required String userpassword}) async {
    final String suburl = "/user/login";
    final Uri uri = Uri.parse(BaseUrl + suburl);
    final http.Response response = await client.post(uri,
        body:
            jsonEncode({"useremail": useremail, "userpassword": userpassword}),
        headers: headers);
    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode == 200) {
      return body;
    } else {
      print("Error occured");
    }
  }
}
