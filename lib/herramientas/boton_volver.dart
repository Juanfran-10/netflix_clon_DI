import 'package:flutter/material.dart';
import 'package:netflix_clon/colores.dart';

class BotonVolver extends StatelessWidget {
  const BotonVolver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(
        color: Colores.colorFondoScaffold,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}