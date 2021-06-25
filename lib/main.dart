import 'package:flutter/material.dart';
import 'package:netflixclone/app/providers/providers.dart';
import 'package:netflixclone/app/routes/routes.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

//! IMPORTANT.
//! 0.The code is written for beginners, If you are any expert you might want to modify the code.
//! 1.All the functionalities are added in this clone.
//! 2.The UI might is kinda low but focus over the features.
//! 3.Only single movie is rendered, Feel free to add more movies in the database.
//! 4.You can add more details of the movie in the details section.
//! 5.You can also add more categories just we have "Trending now".
//! 6.For shows, Process is same. Just initialize an array of shows as we have done here for array of starcast.
//! 7.Make sure to add args": ["--web-port", "1133", "--web-renderer", "html"] in launch json file to render network images.
//! 8.Have fun and modify the basic clone to next level :)

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers, child: Lava());
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeRoute,
      routes: routes,
      theme: ThemeData(accentColor: redColor, primaryColor: redColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
