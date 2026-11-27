



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

  


factory Movie.fromJson(Map<String, dynamic> json) {
  final String id = json['id'] as String;
  final String name = json['name'] as String;
  final String synopsis = json['synopsis'] as String;
  final String venue = json['venue'] as String;
  final String ageRating = json['ageRating'] as String;
  final String screeningTime = json['screeningTime'] as String;
  final double price = json['price'] as double;
  final String poster = json['poster'] as String;

  return Movie(id: id, name: name, venue: venue, synopsis: synopsis,
   ageRating: ageRating, screeningTime: screeningTime,
    price: price, poster: poster);
}

String get formattedprice => '£${price.toStringAsFixed(2)}';

Map<String , dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{
    'id' : id.toString(),
    'name' : name,
    'synopsis'  : synopsis,
    'price' : price,
    'poster' : poster,
    'ageRating' : ageRating,
    'screeningTime' : screeningTime,
    'venue' : venue
  };
  return data;
}




}