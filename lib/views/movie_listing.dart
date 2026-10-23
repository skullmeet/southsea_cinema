

import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';


class TicketCounter extends StatefulWidget {
  const TicketCounter({super.key});

  @override 
  State<TicketCounter> createState() => _TicketCounterState();

}

class _TicketCounterState extends State<TicketCounter> {
  int _count = 0;

  void _increment() {
    setState(() {
       _count ++;
    });
   
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Tickets in cart'),
        Text(
          '$_count',
          style: Theme.of(context).textTheme.headlineLarge,

        ),
        ElevatedButton(onPressed: _increment, child: const Text('Add Ticket')),
        ElevatedButton(onPressed: _reset,style: ElevatedButton.styleFrom(backgroundColor: cinemaFontMuted, foregroundColor: cinemaFontWhite),child: const Text('Reset'))
      ],
    );
  }

}


class MovieListing extends StatelessWidget {
  final Movie movie;
  const MovieListing({super.key,required this.movie});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.name, style: TextStyle(color: cinemaFontWhite, fontSize: 30),),
          Text(movie.ageRating, style: TextStyle(color: cinemaFontWhite, fontSize: 30),),
          Image.asset(movie.poster, width: 120,height: 180,fit: BoxFit.cover),
          Text(movie.venue, style: TextStyle(color: cinemaFontWhite, fontSize: 30),),
          Text(movie.screeningTime, style: TextStyle(color: cinemaFontWhite, fontSize: 30),),
          Text(movie.synopsis, style: TextStyle(color: cinemaFontWhite, fontSize: 30),),
          Text(movie.price, style: TextStyle(color: cinemaFontWhite, fontSize: 30),),
          TicketCounter(),
          
           
          
          
          
          

          

        ],
      )
      
      
      
      ),
    );
  }
}
