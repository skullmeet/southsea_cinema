import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositaries/movie_repository.dart';


void main(){
  group('Movie test units', (){
    test('getMovie returns 2 movies', (){
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getmovie contains valid bigG and Chansaw movies', (){
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie bigG = movies[0];
      expect(bigG.id, '01');
      expect(bigG.name, 'Godzilla King of Monsters(2019)');
      expect(bigG.price, 4);
      expect(bigG.poster, isNotEmpty);


      final Movie chainsaw = movies[1];
      expect(chainsaw.id, '02');
      expect(chainsaw.name, 'ChainsawMan Reze Arc');
      expect(chainsaw.price, 5);
      expect(chainsaw.poster, isNotEmpty);


    });
  });
}