import 'dart:io';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/movie.api.dart';

class MovieNotifier extends ChangeNotifier {
  final MovieAPI _movieAPI = new MovieAPI();

  Future fetchMovies() async {
    try {
      var movies = await _movieAPI.fetchMovies();
      return movies;
    } on SocketException {} catch (error) {}
  }

  Future fetchMovieDetails({required dynamic movieid}) async {
    try {
      var movieDetails = await _movieAPI.fetchMovieDetails(movieid: movieid);
      return movieDetails;
    } on SocketException {} catch (error) {}
  }
}
