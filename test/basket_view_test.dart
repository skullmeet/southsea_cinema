import 'package:flutter/material.dart';
import 'package:southsea_cinema/repositaries/basket_repositary.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/basket_view.dart';


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




void main() {

  setUp(() {
    BasketRepositary.instance.clearItems();

  });
  
   testWidgets('BasketScreen displays empty message when basket has no items', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);



  });

   testWidgets(


    'BasketScreen renders items and removes item when delete pressed',
    (WidgetTester tester) async {
    
      const BasketItem item = BasketItem(basketedMovie: dummymovie, quantaty: 2);
      BasketRepositary.instance.addItem(item);

      await tester.pumpWidget(const MaterialApp(home: BasketView()));

      expect(find.textContaining('MY ORDER'), findsOneWidget);
      expect(find.textContaining('2 Standard'), findsOneWidget);
      expect(find.textContaining('Buy Tickets'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
    },
  );
}
  
  
  

