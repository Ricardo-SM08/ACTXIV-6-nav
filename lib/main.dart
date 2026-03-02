import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'principal/inicio.dart';
import 'principal/home_screen.dart';
import 'principal/detalles_producto_screen.dart';
import 'principal/carrito_screen.dart';
import 'principal/metodo_pago.dart';
import 'principal/pago_realizado.dart'; // IMPORTAMOS LA NUEVA PANTALLA

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
      // TEMA GLOBAL PROFESIONAL (Fuente Cursiva Estética)
      // ==========================================
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.caveatTextTheme(
          Theme.of(context).textTheme,
        ),
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
        '/pago': (context) => const MetodoPagoScreen(),
        '/exito': (context) => const PagoRealizadoScreen(), // NUEVA RUTA DE ÉXITO
      },
    );
  }
}