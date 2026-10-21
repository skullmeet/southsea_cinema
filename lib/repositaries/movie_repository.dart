// ignore_for_file: unnecessary_string_escapes

import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: '01',
        name: 'Godzilla King of Monsters(2019)',
        venue: 'Room 3A',
        synopsis: 'Godzilla Returns to now face a threat that roams the entire planet and Lords over storms. An ancient rivalry resurfaced by a new threat to the survival of humanity',
        ageRating: 'M for Mature',
        screeningTime: 'Sunday 20 oct 20:30',
        price: '4 - Pounds',
        poster: 'assets\images\MV5BY2U5YTJmNWMtYTAxMS00YmI3LThjNzYtN2FjY2MyMTdhMDdmXkEyXkFqcGc@._V1_.jpg',

      ),
      Movie(
        id: '02',
        name: 'ChainsawMan Reze Arc',
        venue: 'Room 4B',
        synopsis: 'Watch Denji encounter the captivating and dangerous Reze, a girl of many mysteries that brings disaster and tears alike in the continuing heartbreaking story of Chainsawman',
        ageRating: 'M for Mature',
        screeningTime: 'Saturday 19 oct 20:30',
        price: '5 - Pounds',
        poster: 'assets\images\71w58zkWnfL._AC_UF894,1000_QL80_.jpg'
      )
    
    ];
  }
}