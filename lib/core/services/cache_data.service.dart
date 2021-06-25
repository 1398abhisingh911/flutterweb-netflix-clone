import 'package:flutter/material.dart';
import 'package:netflixclone/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheNotifier extends ChangeNotifier {
  late String _jwtData = "";
  String get jwtData => _jwtData;

  Future<void> readCache(
      {required BuildContext context, required String key}) async {
    print("<-------------------Reading Cache------------------>");
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    if (sharedPreferences.getString(key) == null) {
      print("Oops jwt data is null");
      Navigator.of(context).pushNamed(LandingRoute);
    } else {
      _jwtData = sharedPreferences.getString(key)!;
    }
    notifyListeners();
  }

  Future writeCache({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
    notifyListeners();
  }

  Future deleteCache(
      {required BuildContext context, required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key).whenComplete(() {
      Navigator.of(context).pushNamed(HomeRoute);
    });
    notifyListeners();
  }
}
