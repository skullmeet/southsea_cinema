

import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/foundation.dart';

class Movie {
  final String id;
  final String name;
  final String venue;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double price;
  final String poster;

  const Movie({
    required this.id,
    required this.name,
    required this.venue,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.poster,
  });

  String get formattedprice => '£${price.toStringAsFixed(2)}';
}

factory movie.fromJson(Map<String, dynamic> json) {
  final String id = json['id'] as String;
  final String name = json['name'] as String;
  final String synopsis = json['synopsis'] as String;
  final String venue = json['venue'] as String;
  final String ageRating = json['ageRating'] as String;
  final String screeningTime = json['screeningTime'] as String;
  final Double price = json['price'] as Double;
  final String poster = json['poster'] as String;

  return Movie(id: id, name: name, venue: venue, synopsis: synopsis, ageRating: ageRating, screeningTime: screeningTime, price: price, poster: poster);

}
