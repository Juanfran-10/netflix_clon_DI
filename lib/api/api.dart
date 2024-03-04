import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clon/constantes.dart';
import 'package:netflix_clon/modelos/pelicula.dart';

class Api {
  //URLs de las APIs para obtener películas en tendencia, mejor valoradas y próximos estrenos
  static const _urlTendencia =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constantes.claveApi}';
  static const _urlMejorValoradas =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constantes.claveApi}';
  static const _urlProximosEstrenos =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constantes.claveApi}';

  //Método para obtener películas en tendencia
  Future<List<Pelicula>> obtenerPeliculasTendencia() async {
    //Hacer solicitud HTTP para obtener la respuesta
    final respuesta = await http.get(Uri.parse(_urlTendencia));
    //Verificar si la respuesta es exitosa (código 200)
    if (respuesta.statusCode == 200) {
      //Decodificar la respuesta y mapear los datos a objetos Movie
      final datosDecodificados = json.decode(respuesta.body)['results'] as List;
      return datosDecodificados.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
    } else {
      throw Exception('Algo salió mal');
    }
  }

  //Método para obtener películas mejor valoradas
  Future<List<Pelicula>> obtenerPeliculasMejorValoradas() async {
    //Lo mismo que el método anterior pero para las mejor valoradas
    final respuesta = await http.get(Uri.parse(_urlMejorValoradas));
    if (respuesta.statusCode == 200) {
      final datosDecodificados = json.decode(respuesta.body)['results'] as List;
      return datosDecodificados.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
    } else {
      throw Exception('Algo salió mal');
    }
  }

  //Método para obtener próximos estrenos
  Future<List<Pelicula>> obtenerProximosEstrenos() async {
    //Lo mismo que el método anterior pero para los próximos estrenos
    final respuesta = await http.get(Uri.parse(_urlProximosEstrenos));
    if (respuesta.statusCode == 200) {
      final datosDecodificados = json.decode(respuesta.body)['results'] as List;
      return datosDecodificados.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
    } else {
      throw Exception('Algo salió mal');
    }
  }
}