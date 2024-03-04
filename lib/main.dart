import 'package:flutter/material.dart';
import 'package:netflix_clon/pantallas/pantalla_principal.dart';
import 'colores.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NETFLIX',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colores.colorFondoScaffold,
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(),
    );
  }
}
