import 'package:flutter/material.dart';
import 'package:netflix_clon/constantes.dart';
import 'package:netflix_clon/pantallas/pantalla_detalles.dart';

class CarruselPeliculas extends StatelessWidget {
  //Constructor de la clase que recibe un snapshot con datos de películas en tendencia
  const CarruselPeliculas({
    super.key,
    required this.snapshot,
  });

  //Variable que almacena el snapshot con datos de películas en tendencia
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaDetalles(
                      pelicula: snapshot.data[index],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    '${Constantes.rutaImagen}${snapshot.data![index].rutaPoster}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}