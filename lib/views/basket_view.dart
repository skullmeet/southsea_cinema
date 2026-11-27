import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositaries/basket_repositary.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';





class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState(){
    return _BasketViewState();
  }
  
  }


class _BasketViewState extends State<BasketView>  {
  String _confirmationMessage = '';

  @override
   Widget build(BuildContext context) { 
    final BasketRepositary repo = BasketRepositary.instance;
    final List<BasketItem> items = repo.getItems();

    final Widget content ;
    if (items.isEmpty){
      if (_confirmationMessage.isNotEmpty){
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            _buildEmptyState(),
            const SizedBox(height: 12),
            Text(_confirmationMessage,style: const TextStyle(fontWeight : FontWeight.bold),)
          ],
        );
      } else {
        content = _buildEmptyState();
      }

    } else {
      content = _buildBasketList(repo, items);
    }
    


    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: content,
      ),
      
    );

  }

//CCCCCAAAAAAAARRRRRRDDDDDD
  Widget _buildCartItemCard(BasketRepositary cart,  BasketItem item, int index ){
    return Padding(
      padding : const EdgeInsets.symmetric(vertical: 2.0),
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child : Row(
              
              children: [
                Text('${item.quantaty} Tickets',
                  style : const TextStyle(fontWeight: FontWeight.w600, color: cinemaBrandDark)),
                const SizedBox(width: 12,),
                Expanded(child :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  
                  children: [
                    Text('${item.quantaty} Standard'),
                    Text(item.basketedMovie.name,),
                    Text(item.basketedMovie.screeningTime),
                    Text(item.basketedMovie.venue),
                    
                  ]
                  
                )),
               
                const SizedBox(width: 20,),

             
              ],
            )
          ),
          Text('£${item.lineTotal.toStringAsFixed(2)}'),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: cinemaFontWhite,),
            style: IconButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              backgroundColor: cinemaBrand
              ),
            onPressed: () {
              setState(() {
                cart.removeItem(index);});})
        ],
      )
    );
  }


  Widget _buildTotalRow(String label, String value, {bool emphasise = false}) {
    final TextStyle style;



    if (emphasise) {
      style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    } else {
      style = const TextStyle(color: cinemaFontWhite);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

  Widget _buildBasketList(BasketRepositary cart, List<BasketItem> items) {
    final List<Widget> children = [];

    children.add(const Text('MY ORDER', style: TextStyle(color: cinemaFontWhite,fontSize: 25)));
    children.add(const SizedBox(height: 16));
    children.add(Padding(padding:const EdgeInsets.symmetric(vertical: 2.0),child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Item             Details',style: TextStyle(fontWeight: FontWeight.bold),),
        Expanded(child: Text(''),),
        Text('Price',style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 40,)
      ]
      
      
      
      ,), ));

    for (int index = 0; index < items.length; index++) {
      final BasketItem item = items[index];
      children.add(_buildCartItemCard(cart, item, index));
    }
    children.add(const SizedBox(height: 24));
    children.add(
      _buildTotalRow(
        'Service Charge',
        '£${cart.getServiceCharge().toStringAsFixed(2)}',
      ),
    );
    children.add(
      _buildTotalRow(
        'Total Due',
        '£${cart.getTotalDue().toStringAsFixed(2)}',
        emphasise: true,
      ),
    );
    children.add(const SizedBox(height: 24));
     children.add(
      SizedBox(
        child: PrimaryButton(
          label: 'Buy Tickets',
          onPressed: () {
            setState(() {
              cart.clearItems();
              _confirmationMessage = 'Thanks, your order is on its way';
            });
          },
        ),
      ));
      


    if (_confirmationMessage.isNotEmpty) {
      children.add(const SizedBox(height: 12));
      children.add(
        Text(
          _confirmationMessage,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,




    );
  
  }
    Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Text(
          'Your basket is empty',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

}