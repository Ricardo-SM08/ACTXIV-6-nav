import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MySelfCar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[900], 
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purpleAccent, width: 2), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(150), 
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "CARRITO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple[300]!, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(90), 
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white, 
                              image: const DecorationImage(
                                image: NetworkImage("https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/filtro.jpg"),
                                fit: BoxFit.contain, 
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12.0, left: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Filtro de Aceite",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                ),
                                const SizedBox(height: 5),
                                _itemEstrella("Alta durabilidad"),
                                _itemEstrella("Flujo universal"),
                                _itemEstrella("Precio: \$450 MXN"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.redAccent, size: 28),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Artículo eliminado", style: TextStyle(fontSize: 18)), 
                              backgroundColor: Colors.red
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Container(
                width: 200,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(100),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[800], 
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.purpleAccent, width: 1.5), 
                    ),
                  ),
                  onPressed: () {
                    // ========================================================
                    // AQUÍ ESTÁ EL CAMBIO: NAVEGAR A LA PANTALLA DE PAGO
                    // ========================================================
                    Navigator.pushNamed(context, '/pago');
                  },
                  child: const Text(
                    "COMPRAR",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFDCD0FF), 
        selectedItemColor: Colors.purple[800], 
        unselectedItemColor: Colors.black54, 
        selectedLabelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        currentIndex: 1, 
        onTap: (index) {
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Casa'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        ],
      ),
    );
  }

  Widget _itemEstrella(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 16),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              texto,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}