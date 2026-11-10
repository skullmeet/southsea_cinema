import 'package:southsea_cinema/constants.dart';
import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;

  
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cinemaBrandDark,
        foregroundColor: cinemaFontWhite,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
      ),

      onPressed: onPressed,
      child: Text(label));
  }
}



class SecondaryButton extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;

  
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cinemaFontMuted,
        foregroundColor: cinemaFontWhite,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
      ),

      onPressed: onPressed,
      child: Text(label));
  }
}
