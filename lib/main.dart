import 'package:flutter/material.dart';
import 'screens/pantalla_planificacion.dart';
import 'screens/pantalla_seleccion.dart';
import 'screens/pantalla_inicio.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación Flutter',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),

      //home: PantallaInicio(), //Nombre de la clase dentro de pantalla_inicio.dart
      //home: PantallaSeleccion(),
      home: PantallaPlanificacion(),
    );
  }
}
