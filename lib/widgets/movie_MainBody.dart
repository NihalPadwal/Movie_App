// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import '/pages/movieinfo.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieWidget extends StatelessWidget {
  final List<Movie> dataMovie;

  // ignore: use_key_in_widget_constructors
  const MovieWidget({required this.dataMovie});

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.black,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataMovie.length,
            itemBuilder: (context, index) {
              final movieBest = dataMovie[index];
              return Container(
                margin: const EdgeInsets.only(right: 4),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => MovieInfo(
                              movieBest.title,
                              movieBest.poster,
                            )));
                  },
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: movieBest.poster,
                    width: 150,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
      );
}
