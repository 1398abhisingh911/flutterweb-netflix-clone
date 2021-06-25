import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflixclone/app/routes/api_routes.dart';

class MovieAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future fetchMovies() async {
    final String suburl = "/movie";
    final Uri uri = Uri.parse(BaseUrl + suburl);
    final http.Response response = await client.get(uri, headers: headers);
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      final Map<String, dynamic> parsedData = jsonDecode(body);
      bool movieRecevied = parsedData['received'];
      dynamic listOfMovies = parsedData['data'];
      if (movieRecevied) {
        return listOfMovies;
      }
    }
  }

  Future fetchMovieDetails({required dynamic movieid}) async {
    final String suburl = "/movie/details/$movieid";
    final Uri uri = Uri.parse(BaseUrl + suburl);
    final http.Response response = await client.get(uri, headers: headers);
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      final Map<String, dynamic> parsedData = jsonDecode(body);
      bool movieRecevied = parsedData['received'];
      dynamic movieDetails = parsedData['data'];
      if (movieRecevied) {
        return movieDetails;
      }
    }
  }
}
