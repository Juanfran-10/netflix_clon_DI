import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clon/api/api.dart';
import 'package:netflix_clon/herramientas/carrusel_peliculas.dart';
import 'package:netflix_clon/herramientas/carrusel_tendencias.dart';
import 'package:netflix_clon/modelos/pelicula.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  //Variables que almacenan datos de películas en diferentes categorías
  late Future<List<Pelicula>> peliculasTendencia;
  late Future<List<Pelicula>> peliculasMejorValoradas;
  late Future<List<Pelicula>> peliculasProximosEstrenos;

  @override
  void initState() {
    super.initState();
    //Inicialización de las variables con datos de películas utilizando la clase Api
    peliculasTendencia = Api().obtenerPeliculasTendencia();
    peliculasMejorValoradas = Api().obtenerPeliculasMejorValoradas();
    peliculasProximosEstrenos = Api().obtenerProximosEstrenos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/logo_netflix.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Películas en Tendencia',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: peliculasTendencia,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return CarruselTendencias(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Películas Mejor Valoradas',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: peliculasMejorValoradas,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return CarruselPeliculas(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Próximos Estrenos',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: peliculasProximosEstrenos,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return CarruselPeliculas(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}