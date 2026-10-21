import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/repositaries/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  
  @override
  Widget build(BuildContext context) {

    final repository = MovieRepository();
    final movies = repository.getMovies();
    final bigG = movies[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome my boi to $appTitle',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MovieCard(movie: bigG)
            ],
          ),
        ),
      ),
    );
  }
}
