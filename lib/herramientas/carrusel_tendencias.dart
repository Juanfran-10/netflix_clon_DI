import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clon/constantes.dart';
import 'package:netflix_clon/pantallas/pantalla_detalles.dart';

class CarruselTendencias extends StatelessWidget {
  //Constructor de la clase que recibe un snapshot con datos de películas en tendencia
  const CarruselTendencias({
    super.key,
    required this.snapshot,
  });

  //Variable que almacena el snapshot con datos de películas en tendencia
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaDetalles(
                    pelicula: snapshot.data[itemIndex],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  '${Constantes.rutaImagen}${snapshot.data[itemIndex].rutaPoster}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}