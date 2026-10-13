

import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';



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
      ],
    );
  }

}


class MovieListing extends StatelessWidget {
  const MovieListing({super.key});
  


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
        children: [
          Text(
            "Godzilla 2019",
            style: TextStyle(color: cinemaBrand, fontSize: 50),
            
          ),
          Text("Bookings Availabel :"
          ,style: TextStyle(fontSize: 30),),

          Text('15:30'),
          Text('17:30'),
          Text('19:30'),
          TicketCounter()
         
           
          
          
          
          

          

        ],
      )
      
      
      
      ),
    );
  }
}
