import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/widgets/movie_MainBody.dart';

class MovieBody extends StatefulWidget {
  const MovieBody({Key? key}) : super(key: key);

  @override
  _MovieBodyState createState() => _MovieBodyState();

  static getAllMovies() {}
}

class _MovieBodyState extends State<MovieBody> {
  List<Movie> _dataMovie = List<Movie>.empty();

  @override
  void initState() {
    super.initState();
    showAllMovie();
  }

  void showAllMovie() async {
    final dataMovie = await getAllMovies();
    if (mounted) {
      setState(() {
        _dataMovie = dataMovie;
      });
    }
  }

  Future<List<Movie>> getAllMovies() async {
    final response = await http.get(Uri.parse(
        "http://www.omdbapi.com/?i=tt3896198&apikey=c4033450&s=Movies"));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load Movie");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieWidget(
        dataMovie: _dataMovie,
      ),
    );
  }
}
