import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:flutter/material.dart';



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






class BookingCard extends StatelessWidget {
  final Movie movie;

  const BookingCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
     
      color : cinemaSurface,
      margin: EdgeInsets.symmetric(horizontal: 60.0,vertical: 38.0),
      child : Padding(
        padding: EdgeInsets.all(10.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title and age ratingf
            Title(color: cinemaBrandDark, child: Text(style : TextStyle(color: cinemaFontWhite, fontSize: 30,fontWeight : FontWeight.bold), movie.name)),
            const SizedBox(width: 10,),
            Text(style : TextStyle(color: cinemaFontWhite),movie.ageRating),
            const SizedBox(height: 20,),

           //poster and details
            Image.asset(movie.poster, width: 120,height: 180,fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(style : TextStyle(color: cinemaFontWhite,fontSize: 20),movie.venue),
            const SizedBox(height: 20),
            Text(style : TextStyle(color: cinemaFontWhite,fontSize: 20),movie.screeningTime),
            const SizedBox(height: 20),

            //synopsis
            Text(style : TextStyle(color: cinemaFontWhite,fontSize: 20),movie.synopsis) ,
           
           //ticket counter and price
           
           const SizedBox(height: 20,),
            Text(style : TextStyle(color: cinemaFontWhite,fontSize: 20),movie.formattedprice) ,
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 50,),
              TicketCounter()
            ],
           )
          ],
        )
      )
    );
  }
}