import 'package:flutter/material.dart';
import 'package:netflixclone/app/routes/routes.dart';
import 'package:netflixclone/core/notifiers/movie.notifier.dart';
import 'package:netflixclone/meta/views/authentication/authentication.import.dart';
import 'package:netflixclone/meta/views/movie_details/movie_detail.dart';

class MoviesBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    showBlock({required String image, required dynamic id}) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(MovieDetailsRoute,
                arguments: MovieDetailsArguments(id: id));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 200.0,
              child: Image.network(image, fit: BoxFit.fitHeight),
            ),
          ),
        ),
      );
    }

    return Container(
      width: width,
      height: 200.0,
      child: Consumer<MovieNotifier>(
          builder: (context, notifier, _) => FutureBuilder(
              future: notifier.fetchMovies(),
              builder: (context, snapshot) {
                List movieData = snapshot.data as List;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (movieData.isEmpty || movieData.length == 0) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    itemCount: movieData.length,
                    itemBuilder: (context, index) => showBlock(
                        image: movieData[index]['moviethumbnailurl'],
                        id: movieData[index]['_id']));
              })),
    );
  }
}
