class Pelicula {
  String titulo;
  String rutaFondo;
  String tituloOriginal;
  String descripcion;
  String rutaPoster;
  String fechaEstreno;
  double calificacion;

  Pelicula({
    required this.titulo,
    required this.rutaFondo,
    required this.tituloOriginal,
    required this.descripcion,
    required this.rutaPoster,
    required this.fechaEstreno,
    required this.calificacion,
  });

  //Método para crear una instancia de Pelicula a partir de datos JSON
  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      titulo: json["title"],
      rutaFondo: json["backdrop_path"],
      tituloOriginal: json["original_title"],
      descripcion: json["overview"],
      rutaPoster: json["poster_path"],
      fechaEstreno: json["release_date"],
      calificacion: json["vote_average"].toDouble(),
    );
  }
}