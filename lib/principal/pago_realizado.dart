import 'package:flutter/material.dart';

class PagoRealizadoScreen extends StatelessWidget {
  const PagoRealizadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar heredado del tema global
      appBar: AppBar(
        title: const Text('MySelfCar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
        // Quitamos la flecha de regresar porque el pago ya se hizo
        automaticallyImplyLeading: false, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // ==========================================
            // ANIMACIÓN DE PALOMITA DE ÉXITO (Nivel Senior)
            // ==========================================
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.elasticOut, // Efecto de rebote
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withAlpha(100), // Brillo verde neón
                          blurRadius: 40,
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade600,
                      size: 180, // Palomita grande y centrada
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
            
            // Texto de confirmación
            const Text(
              "¡Pago Exitoso!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Tu pedido ha sido registrado correctamente.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 70),

            // ==========================================
            // BOTÓN NEÓN: PRODUCTO EN PROCESO
            // ==========================================
            GestureDetector(
              onTap: () {
                // Navega al Home y borra el historial para no poder darle "Atrás" a la pantalla de éxito
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCD0FF), // Fondo Lila
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.purple, width: 2), // Borde morado
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(150), // Difuminado Neón Morado
                      blurRadius: 25,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Text(
                  "Producto en proceso!!!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    letterSpacing: 1.5,
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