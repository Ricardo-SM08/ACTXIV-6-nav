import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // Degradado de fondo sutil y elegante
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.purple.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // 1. CÍRCULO CENTRAL CON IMAGEN DE CARRETERA
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFDCD0FF), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?q=80&w=600&auto=format&fit=crop"),
                  fit: BoxFit.cover, // Aquí usamos cover para que llene el círculo
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            
            const Text(
              "Bienvenido a",
              style: TextStyle(fontSize: 26, color: Colors.black54),
            ),
            const Text(
              "MySelfCar",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.purple),
            ),

            const SizedBox(height: 70),

            // 2. BOTÓN DE ACCIÓN NEÓN
            GestureDetector(
              onTap: () {
                // Reemplaza la pantalla actual por el Home
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCD0FF), // Fondo Lila
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.purple, width: 2), // Borde morado
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(150), // Difuminado Neón
                      blurRadius: 25,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Text(
                  "Iniciar",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}