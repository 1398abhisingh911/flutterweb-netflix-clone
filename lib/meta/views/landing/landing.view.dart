import 'package:flutter/material.dart';
import 'components/app_bar.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        LandingBG(),
        Positioned(top: 40.0, child: LandingAppBar()),
        Positioned(top: width > 500 ? 200.0 : 150, child: LandingBody())
      ],
    ));
  }
}
