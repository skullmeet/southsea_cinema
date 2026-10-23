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
  });
}