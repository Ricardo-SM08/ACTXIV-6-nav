import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'principal/inicio.dart';
import 'principal/home_screen.dart';
import 'principal/detalles_producto_screen.dart';
import 'principal/carrito_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MySelfCar',
      // ==========================================
      // TEMA GLOBAL PROFESIONAL
      // ==========================================
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        // Tipografía cursiva legible para toda la app
        textTheme: GoogleFonts.caveatTextTheme(
          Theme.of(context).textTheme,
        ),
        // Configuramos el AppBar para no repetir código en las pantallas
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFDCD0FF), // Lila
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.caveat(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // ==========================================
      // RUTAS NOMBRADAS
      // ==========================================
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/home': (context) => const MySelfCarHomeScreen(),
        '/carrito': (context) => const CarritoScreen(),
        '/detalles': (context) => const DetallesProductoScreen(),
      },
    );
  }
}