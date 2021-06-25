import 'package:flutter/material.dart';
import 'package:netflixclone/meta/views/home/home.view.dart';
import 'package:netflixclone/meta/views/landing/landing.view.dart';
import 'package:netflixclone/meta/views/movie_details/movie_detail.dart';

final String LandingRoute = "/landing";
final String HomeRoute = "/home";
final String MovieDetailsRoute = "/movie-details";

final routes = {
  LandingRoute: (context) => LandingView(),
  HomeRoute: (context) => HomeView(),
  MovieDetailsRoute: (context) => MovieDetail(
      movieDetailsArguments:
          ModalRoute.of(context)!.settings.arguments as dynamic)
};
