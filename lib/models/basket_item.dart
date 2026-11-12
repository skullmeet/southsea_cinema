import 'package:southsea_cinema/models/movie.dart';


class BasketItem {
  final Movie basketedMovie;
  final int quantaty ;

  const BasketItem({
    required this.basketedMovie,
    required this.quantaty
  });

  double get lineTotal {
    return basketedMovie.price * quantaty;

  }


}