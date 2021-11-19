import 'package:flutter/material.dart';
import 'package:movie_api/Widgets/toprated.dart';
import 'package:movie_api/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'Widgets/trending.dart';
import 'Widgets/tv.dart';

void main() {
  runApp(const MovieApi());
}

class MovieApi extends StatelessWidget {
  const MovieApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Api Integration",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red, brightness: Brightness.dark),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apiKey = 'ce988b338d830af0eaec7bfc15b086fb';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTk4OGIzMzhkODMwYWYwZWFlYzdiZmMxNWIwODZmYiIsInN1YiI6IjYxOTZlYzg2NjM1MzZhMDA2MTkyMWMzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5kVYUJC8SnTY-BqP1hUpTJGAE5fWC9nuwyEZCTC55Tk';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Modified_Text(
          text: 'Flutter Movie App',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: ListView(
        children: [
          TV(tvshows: tv),
          TopRatedMovies(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
