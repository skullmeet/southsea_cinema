// ignore_for_file: unnecessary_string_escapes

import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: '01',
        name: 'Godzilla King of Monsters(2019)',
        venue: 'Room 3A',
        synopsis: 'Godzilla Returns to now face a threat\n that roams the entire planet and Lords\n over storms An ancient rivalry resurfaced by\n a new threat to the survival of humanity',
        ageRating: '(12A)',
        screeningTime: 'Sunday 20 oct 20:30',
        price: '4 - Pounds',
        poster: 'assets/images/Big_G_poster.jpg',

      ),
      Movie(
        id: '02',
        name: 'ChainsawMan Reze Arc',
        venue: 'Room 4B',
        synopsis: 'Watch Denji encounter the captivating\n and dangerous Reze, a girl of many mysteries \nthat brings disaster and tears alike in\n the continuing heartbreaking story of Chainsawman',
        ageRating: '(18A)',
        screeningTime: 'Saturday 19 oct 20:30',
        price: '5 - Pounds',
        poster: 'assets/images/chainsaw_poster.jpg'
      )
    
    ];
  }
}