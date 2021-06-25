import 'package:flutter/material.dart';
import 'package:netflixclone/app/shared/colors.dart';
import 'package:netflixclone/app/shared/textTheme.dart';
import 'package:netflixclone/core/services/cache_data.service.dart';
import 'package:provider/provider.dart';
import 'components/mainbar/mainbar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    //! Initializes the readcache method to determine whether session has some
    //! data or not
    var cacheNotifier = Provider.of<CacheNotifier>(context, listen: false);
    cacheNotifier.readCache(context: context, key: "jwt");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //! This widget is used for logging out of the current session.
      floatingActionButton: MaterialButton(
        color: darkColor,
        child: Text("Log out", style: smalltextB),
        onPressed: () {
          Provider.of<CacheNotifier>(context, listen: false)
              .deleteCache(context: context, key: "jwt");
        },
      ),
      backgroundColor: darkColor,
      //! Main body
      body: Container(width: width, child: MainBar()),
    );
  }
}
