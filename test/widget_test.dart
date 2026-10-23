import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', (){
    testWidgets('App displays movie cards in Home', (WidgetTester tester) async{
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);

    });

    testWidgets('Shows cards with Order buttons', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.text('Godzilla King of Monsters(2019)'), findsOneWidget);
      expect(find.text('Book Now!!'), findsNWidgets(2));
    });
  });
}
