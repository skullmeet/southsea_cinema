import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
     
      color : cinemaBackground,
      margin: EdgeInsets.symmetric(horizontal: 60.0,vertical: 38.0),
      child : Padding(
        padding: EdgeInsets.all(10.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title and age ratingf
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(color: cinemaBrandDark, child: Text(style : TextStyle(color: cinemaBrandDark, fontSize: 30,fontWeight : FontWeight.bold), movie.name)),
                const SizedBox(width: 10,),
                Text(style : TextStyle(color: cinemaFontWhite),movie.ageRating)
                  ]
                ),
           
           const SizedBox(height: 20,),
           //poster an dsynopsis
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(movie.poster, width: 120,height: 180,fit: BoxFit.cover),
              const SizedBox(width: 20),
              Expanded(child: Text(style : TextStyle(color: cinemaFontWhite,fontSize: 20),movie.synopsis) )
              
            ]
           ),
           const SizedBox(height: 20,),
           Text(style: TextStyle(color: cinemaFontWhite,fontSize: 20),'BOOK TICKETS NOW!!'),
           const SizedBox(height: 20,),
           //date and order button
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(style : TextStyle(color: cinemaFontWhite,fontSize: 20),movie.screeningTime),
              const SizedBox(width: 50,),
              Text(style : TextStyle(color: cinemaFontWhite),'Buttun here')
            ],
           )
          ],
        )
      )
    );
  }
}