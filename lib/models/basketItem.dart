import 'package:southsea_cinema/models/movie.dart';


class BasketItem {
  final Movie basketed_movie;
  final int quantaty ;

  const BasketItem({
    required this.basketed_movie,
    required this.quantaty
  });

  double get lineTotal {
    return basketed_movie.price * quantaty;

  }


}