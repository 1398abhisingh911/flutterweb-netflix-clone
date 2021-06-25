import 'package:netflixclone/app/shared/textTheme.dart';
import 'package:netflixclone/core/notifiers/movie.notifier.dart';
import 'package:netflixclone/core/services/video.service.dart';
import 'package:netflixclone/meta/views/authentication/authentication.import.dart';

class MovieDetail extends StatefulWidget {
  final MovieDetailsArguments movieDetailsArguments;
  const MovieDetail({required this.movieDetailsArguments});
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: Container(
          child: Consumer<MovieNotifier>(
            builder: (context, notifier, _) {
              return FutureBuilder(
                  future: notifier.fetchMovieDetails(
                      movieid: widget.movieDetailsArguments.id),
                  builder: (context, snapshot) {
                    var movieData = snapshot.data as Map;
                    var starcast = movieData['moviestarcast'] as List;
                    return Container(
                        child: Column(
                      children: [
                        Text(
                          movieData['moviename'],
                          style: TextStyle(
                              color: lightColor,
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              fontFamily: MONTSERRATB),
                        ),
                        Container(
                          width: width,
                          height: 600,
                          child: VideoPlayerService(
                              trailerUrl: movieData['movietrailerurl']),
                        ),
                        Text(movieData['moviedescription'], style: mediumtextB),
                        Container(
                          height: 50,
                          width: 500,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: starcast.length,
                              itemBuilder: (context, index) {
                                return Text(starcast[index], style: smalltextR);
                              }),
                        )
                      ],
                    ));
                  });
            },
          ),
        ),
      ),
    );
  }
}

class MovieDetailsArguments {
  final dynamic id;
  const MovieDetailsArguments({required this.id});
}
