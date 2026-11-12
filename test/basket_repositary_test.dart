import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositaries/basket_repositary.dart';



const Movie dummymovie =  Movie(
          id: '02',
          name: 'ChainsawMan Reze Arc',
          venue: 'Room 4B',
          synopsis:
              'Watch Denji encounter the captivating\n and dangerous Reze, a girl of many mysteries \nthat brings disaster and tears alike in\n the continuing heartbreaking story of Chainsawman',
          ageRating: '(18A)',
          screeningTime: 'Saturday 19 oct 20:30',
          price: 5,
          poster: 'assets/images/chainsaw_poster.jpg');

const Movie dummymovie2 =  Movie(
          id: '02',
          name: 'ChainsawMan Reze Arc',
          venue: 'Room 4B',
          synopsis:
              'Watch Denji encounter the captivating\n and dangerous Reze, a girl of many mysteries \nthat brings disaster and tears alike in\n the continuing heartbreaking story of Chainsawman',
          ageRating: '(18A)',
          screeningTime: 'Saturday 19 oct 20:30',
          price: 5,
          poster: 'assets/images/chainsaw_poster.jpg');

void main() {
  setUp((){
    BasketRepositary.instance.clearItems();});

    group('baskt repo test',() {
      test('start with emtpy basket and zero total', () {
        final BasketRepositary basket = BasketRepositary.instance;
        expect(basket.getItems().length, 0);
        expect(basket.getTotalItems(), 0);
        expect(basket.getServiceCharge(), 0);
        expect(basket.getSubTotal(), 0);
        expect(basket.getTotalDue(), 0);

    });

    test('add items and do it again', (){
      final BasketRepositary basket = BasketRepositary.instance;
      const BasketItem item2 = BasketItem(basketedMovie: dummymovie, quantaty: 1);
      const BasketItem item1 = BasketItem(basketedMovie: dummymovie2, quantaty: 2);

      basket.addItem(item1);
      basket.addItem(item2);


      expect(basket.getItems().length, 2);
        expect(basket.getTotalItems(), 2);
        expect(basket.getServiceCharge(), 4);
        expect(basket.getTotalDue(), 0);


    });
    });
  }
