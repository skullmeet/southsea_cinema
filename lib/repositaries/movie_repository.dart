// ignore_for_file: unnecessary_string_escapes

import 'package:southsea_cinema/models/movie.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


class MovieRepository {
  List<Movie>?  _cachedMovies;



  List<Movie> getMovies() {
        final List<Movie>? cachedMoviess = _cachedMovies;
    if (cachedMoviess!= null) {
      return cachedMoviess;
    }
    
    return const [
      Movie(
        id: '01',
        name: 'Godzilla King of Monsters(2019)',
        venue: 'Room 3A',
        synopsis:
            'Godzilla Returns to now face a threat\n that roams the entire planet and Lords\n over storms An ancient rivalry resurfaced by\n a new threat to the survival of humanity',
        ageRating: '(12A)',
        screeningTime: 'Sunday 20 oct 20:30',
        price: 4.0,
        poster: 'assets/images/Big_G_poster.jpg',
      ),
      Movie(
          id: '02',
          name: 'ChainsawMan Reze Arc',
          venue: 'Room 4B',
          synopsis:
              'Watch Denji encounter the captivating\n and dangerous Reze, a girl of many mysteries \nthat brings disaster and tears alike in\n the continuing heartbreaking story of Chainsawman',
          ageRating: '(18A)',
          screeningTime: 'Saturday 19 oct 20:30',
          price: 5.0,
          poster: 'assets/images/chainsaw_poster.jpg')
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

    Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedSandwiches = [];
    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie sandwich = Movie.fromJson(itemMap);
      loadedSandwiches.add(sandwich);
    }

    _cachedMovies = loadedSandwiches;
    return loadedSandwiches;
  }
  
}
