import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/booking_card.dart';

class MovieListing extends StatelessWidget {
  final Movie movie;
  const MovieListing({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return BookingCard(movie: movie);
            }));
  }
}
