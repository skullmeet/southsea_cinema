
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositaries/basket_repositary.dart';



class TicketCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onReset;

  const TicketCounter({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Tickets in cart'),
        Text('$count', style: Theme.of(context).textTheme.headlineLarge),
        PrimaryButton(onPressed: onIncrement, label: 'Add Ticket'),
        const SizedBox(height: 20),
        SecondaryButton(onPressed: onReset, label: 'Reset'),
        
      ],
    );
  }
}

class BookingCard extends StatefulWidget {
  final Movie movie;
  const BookingCard({super.key, required this.movie});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard>{


  int _count = 0;

  void _increment() => setState(() => _count++);
  void _reset() => setState(() => _count = 0);

  void _addToBasket(){
    if(_count <=0){
      return;
    }

    BasketItem item = BasketItem(basketedMovie: widget.movie, quantaty: _count);
    BasketRepositary.instance.addItem(item);
    setState(() {
      _count = 0;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Card(
        color: cinemaSurface,
        margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 38.0),
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title and age ratingf
                Title(
                    color: cinemaBrandDark,
                    child: Text(
                        style: TextStyle(
                            color: cinemaFontWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                          widget.movie.name)),
                const SizedBox(
                  width: 10,
                ),
                Text(style: TextStyle(color: cinemaFontWhite), widget.movie.ageRating),
                const SizedBox(
                  height: 20,
                ),

                //poster and details
                Image.asset(widget.movie.poster,
                    width: 120, height: 180, fit: BoxFit.cover),
                const SizedBox(height: 20),
                Text(
                    style: TextStyle(color: cinemaFontWhite, fontSize: 20),
                    widget.movie.venue),
                const SizedBox(height: 20),
                Text(
                    style: TextStyle(color: cinemaFontWhite, fontSize: 20),
                    widget.movie.screeningTime),
                const SizedBox(height: 20),

                //synopsis
                Text(
                    style: TextStyle(color: cinemaFontWhite, fontSize: 20),
                    widget.movie.synopsis),

                //ticket counter and price

                const SizedBox(
                  height: 20,
                ),
                Text(
                    style: TextStyle(color: cinemaFontWhite, fontSize: 20),
                    widget.movie.formattedprice),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    TicketCounter(count: _count, onIncrement: _increment, onReset: _reset),
                                       
                   
                    

                  ],
                ),
                SizedBox(height: 20,),
                Row(children: [
                  SizedBox(width: 50,),
                  PrimaryButton(onPressed: _addToBasket, label: 'Add To Basket!!')
                ],)
                
              ],
            )));
  }
}
