import 'package:southsea_cinema/models/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Movie model test', () {
    test('Create a movie instance with given properties', () {
      const movie = Movie(
          id: '03',
          name: 'SOmething something good movie',
          synopsis: 'stuff and stuff',
          venue: 'place and place',
          price: 10,
          ageRating: 'M for mature',
          screeningTime: 'couple of hours',
          poster: 'poster');

      expect(movie.id, '03');
      expect(movie.name, 'SOmething something good movie');
      expect(movie.synopsis, 'stuff and stuff');
      expect(movie.venue, 'place and place');
      expect(movie.price, 10);
      expect(movie.ageRating, 'M for mature');
      expect(movie.screeningTime, 'couple of hours');
      expect(movie.poster, 'poster');
    });
  });

  test('Json conversion presevrves every movie field',() {
    final Map<String, dynamic> data = <String , dynamic>{
      'id' : 'x',
      'name' : 'x',
      'price' : 0.0,
      'venue' : 'x',
      'synopsis' : 'x',
      'poster' : 'x',
      'ageRating' : 'x',
      'screeningTime' : 'x'
    };
    final Movie movie = Movie.fromJson(data);
    expect(movie.id ,'x');
    expect(movie.name, 'x');
    expect(movie.synopsis, 'x');
    expect(movie.venue, 'x');
    expect(movie.ageRating, 'x');
    expect(movie.screeningTime, 'x');
    expect(movie.price, 0.0);
    expect(movie.poster, 'x');
  });
}
