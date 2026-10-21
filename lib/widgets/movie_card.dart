import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
      child : Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Title(color: cinemaBrandDark, child: Text(movie.name)),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(movie.poster, width: 50,height: 50,fit: BoxFit.cover),
              Text(movie.synopsis)
            ]
           ),
           Text('BOOK TICKETS NOW!!'),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.screeningTime),
              Text('Buttun here')
            ],
           )
          ],
        )
      )
    );
  }
}