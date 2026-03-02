import 'dart:math';
import 'package:flutter/material.dart';

class BancoData {
  final String nombre;
  final Gradient fondoGradient;
  final Widget logo;
  final Widget logoAgua;
  final List<String> prefijos;

  BancoData({
    required this.nombre,
    required this.fondoGradient,
    required this.logo,
    required this.logoAgua,
    required this.prefijos,
  });
}

class MetodoPagoScreen extends StatefulWidget {
  const MetodoPagoScreen({super.key});

  @override
  State<MetodoPagoScreen> createState() => _MetodoPagoScreenState();
}

class _MetodoPagoScreenState extends State<MetodoPagoScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final FocusNode _cvcFocusNode = FocusNode();

  late AnimationController _animationController;
  late Animation<double> _animation;

  // DICCIONARIO MASIVO DE BINs (Bancos Mexicanos y Neobancos)
  final List<BancoData> _bancosMexicanos = [
    BancoData(
      nombre: 'nu',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFF8A05BE), Color(0xFF5E0382)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      logo: const Text(
        'nu',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        ),
      ),
      logoAgua: Text(
        'nu',
        style: TextStyle(
          color: Colors.white.withAlpha(20),
          fontSize: 150,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        ),
      ),
      prefijos: ['5326', '5579', '5256', '4216', '5203', '5101'],
    ),
    BancoData(
      nombre: 'BBVA',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFF072146), Color(0xFF004481)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      logo: const Text(
        'BBVA',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
      ),
      logoAgua: Text(
        'BBVA',
        style: TextStyle(
          color: Colors.white.withAlpha(15),
          fontSize: 90,
          fontWeight: FontWeight.w900,
        ),
      ),
      prefijos: [
        '4152',
        '4555',
        '4098',
        '4100',
        '4815',
        '5406',
        '4684',
        '4772',
        '4111',
        '5255',
      ],
    ),
    BancoData(
      nombre: 'Citibanamex',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFF002D72), Color(0xFF001133)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      logo: const Text(
        'citibanamex',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      logoAgua: Icon(
        Icons.star_border_rounded,
        color: Colors.white.withAlpha(15),
        size: 180,
      ),
      prefijos: ['5470', '4800', '5204', '4204', '5544', '4770', '4929'],
    ),
    BancoData(
      nombre: 'Santander',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFFEC0000), Color(0xFF990000)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      logo: const Text(
        'Santander',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      logoAgua: Text(
        'Santander',
        style: TextStyle(
          color: Colors.white.withAlpha(20),
          fontSize: 70,
          fontWeight: FontWeight.bold,
        ),
      ),
      prefijos: ['5575', '4929', '4160', '5255', '5400', '5471', '4043'],
    ),
    BancoData(
      nombre: 'Banorte',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFFEB0029), Color(0xFFAA001D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      logo: const Text(
        'BANORTE',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
      ),
      logoAgua: Text(
        'B',
        style: TextStyle(
          color: Colors.white.withAlpha(20),
          fontSize: 200,
          fontWeight: FontWeight.bold,
        ),
      ),
      prefijos: ['4913', '4007', '4213', '4118', '4628', '5206'],
    ),
    BancoData(
      nombre: 'HSBC',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFFDB0011), Color(0xFF8A000A)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      logo: const Text(
        'HSBC',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w900,
          letterSpacing: 2.0,
        ),
      ),
      logoAgua: Text(
        'HSBC',
        style: TextStyle(
          color: Colors.white.withAlpha(15),
          fontSize: 100,
          fontWeight: FontWeight.w900,
        ),
      ),
      prefijos: ['5491', '4908', '4421', '4213'],
    ),
    BancoData(
      nombre: 'BanCoppel',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFF005DAA), Color(0xFF003D73)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      logo: const Text(
        'BanCoppel',
        style: TextStyle(
          color: Colors.yellowAccent,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      logoAgua: Text(
        'BanCoppel',
        style: TextStyle(
          color: Colors.white.withAlpha(15),
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
      ),
      prefijos: ['4169', '5351', '4268'],
    ),
    BancoData(
      nombre: 'Banco Azteca',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFF00893A), Color(0xFF005C26)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      logo: const Text(
        'Banco Azteca',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      logoAgua: Text(
        'Azteca',
        style: TextStyle(
          color: Colors.white.withAlpha(15),
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
      ),
      prefijos: ['5512', '5349', '4170'],
    ),
    BancoData(
      nombre: 'Mercado Pago',
      fondoGradient: const LinearGradient(
        colors: [Color(0xFF009EE3), Color(0xFF007BFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      logo: const Text(
        'mercado pago',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      logoAgua: Icon(
        Icons.handshake_rounded,
        color: Colors.white.withAlpha(20),
        size: 150,
      ),
      prefijos: ['5323', '5312'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    _cvcFocusNode.addListener(() {
      if (_cvcFocusNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _numeroController.dispose();
    _fechaController.dispose();
    _cvcController.dispose();
    _cvcFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  String get _numeroSinEspacios => _numeroController.text.replaceAll(' ', '');

  String get _tipoRed {
    if (_numeroSinEspacios.isEmpty) {
      return '';
    }
    if (_numeroSinEspacios.startsWith('4')) {
      return 'VISA';
    }
    if (_numeroSinEspacios.startsWith('5')) {
      return 'MASTERCARD';
    }
    if (_numeroSinEspacios.startsWith('3')) {
      return 'AMEX';
    }
    return '';
  }

  BancoData? get _bancoActual {
    if (_numeroSinEspacios.isEmpty) {
      return null;
    }
    for (var banco in _bancosMexicanos) {
      for (var prefijo in banco.prefijos) {
        if (_numeroSinEspacios.startsWith(prefijo)) {
          return banco;
        }
      }
    }
    return null;
  }

  Gradient get _fondoTarjeta {
    if (_bancoActual != null) {
      return _bancoActual!.fondoGradient;
    }
    if (_tipoRed == 'VISA') {
      return const LinearGradient(
        colors: [Color(0xFF1A1F71), Color(0xFF101450)],
      );
    }
    if (_tipoRed == 'MASTERCARD') {
      return const LinearGradient(
        colors: [Color(0xFFEB001B), Color(0xFFF79E1B)],
      );
    }
    if (_tipoRed == 'AMEX') {
      return const LinearGradient(
        colors: [Color(0xFF002663), Color(0xFF001A44)],
      );
    }
    return const LinearGradient(
      colors: [Color(0xFF535353), Color(0xFF2A2A2A)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  String get _numeroFormateado {
    if (_numeroSinEspacios.isEmpty) {
      return 'XXXX  XXXX  XXXX  XXXX';
    }
    String str = _numeroSinEspacios;
    String result = '';
    for (int i = 0; i < str.length; i++) {
      result += str[i];
      if ((i + 1) % 4 == 0 && i != str.length - 1) {
        result += '  ';
      }
    }
    return result;
  }

  String get _fechaFormateada {
    if (_fechaController.text.isEmpty) {
      return 'MM/YY';
    }
    String str = _fechaController.text.replaceAll('/', '');
    if (str.length > 2) {
      return '${str.substring(0, 2)}/${str.substring(2)}';
    }
    return str;
  }

  // Variable para simular carga
  bool _estaProcesando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MySelfCar'),
      ), // Se usa el nombre de la app como pediste
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final transform = Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_animation.value * pi);

                  bool isBack = _animation.value > 0.5;

                  return Transform(
                    alignment: Alignment.center,
                    transform: transform,
                    child: isBack
                        ? Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(pi),
                            child: _construirParteTraseraTarjeta(),
                          )
                        : _construirParteFrontalTarjeta(),
                  );
                },
              ),

              const SizedBox(height: 40),

              _construirTextField(
                hint: "Nombre del Titular",
                controller: _nombreController,
                isCvc: false,
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 15),
              _construirTextField(
                hint: "Número de la Tarjeta",
                controller: _numeroController,
                isCvc: false,
                type: TextInputType.number,
                maxLength: 16,
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _construirTextField(
                      hint: "Vencimiento",
                      controller: _fechaController,
                      isCvc: false,
                      type: TextInputType.number,
                      maxLength: 4,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _construirTextField(
                      hint: "CVC",
                      controller: _cvcController,
                      isCvc: true,
                      type: TextInputType.number,
                      maxLength: 3,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // ==========================================
              // BOTÓN FINAL CON NAVEGACIÓN A PAGO REALIZADO
              // ==========================================
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(120),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  icon: _estaProcesando
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.lock, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Colors.purpleAccent,
                        width: 1.5,
                      ),
                    ),
                  ),
                  onPressed: _estaProcesando
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          // Activamos la carga visual
                          setState(() {
                            _estaProcesando = true;
                          });

                          // Simulamos una carga de 1 segundo (como si se conectara al banco)
                          await Future.delayed(const Duration(seconds: 1));

                          if (context.mounted) {
                            // Usamos pushReplacement para que al entrar a Exito no pueda regresar a esta pantalla
                            Navigator.pushReplacementNamed(context, '/exito');
                          }
                        },
                  label: Text(
                    _estaProcesando ? "PROCESANDO..." : "PAGAR AHORA",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirChip() {
    return Container(
      width: 48,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          colors: [
            Colors.amber.shade200,
            Colors.amber.shade400,
            Colors.amber.shade200,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.amber.shade600, width: 1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(height: 1, color: Colors.amber.shade600),
          ),
          Positioned(
            top: 24,
            left: 0,
            right: 0,
            child: Container(height: 1, color: Colors.amber.shade600),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 15,
            child: Container(width: 1, color: Colors.amber.shade600),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 15,
            child: Container(width: 1, color: Colors.amber.shade600),
          ),
        ],
      ),
    );
  }

  Widget _construirParteFrontalTarjeta() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        gradient: _fondoTarjeta,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -30,
            child:
                _bancoActual?.logoAgua ??
                Icon(
                  Icons.credit_card,
                  color: Colors.white.withAlpha(20),
                  size: 180,
                ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.white.withAlpha(40), Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _construirChip(),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.wifi_rounded,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ],
                    ),
                    if (_bancoActual != null)
                      _bancoActual!.logo
                    else
                      const Text(
                        'BANCO',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                  ],
                ),
                Text(
                  _numeroFormateado,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha(150),
                        offset: const Offset(1, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TITULAR",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Text(
                          _nombreController.text.isEmpty
                              ? 'XXXX XXXX'
                              : _nombreController.text.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "VALID THRU",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          _fechaFormateada,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Courier',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _tipoRed,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirParteTraseraTarjeta() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        gradient: _fondoTarjeta,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -20,
            top: -30,
            child:
                _bancoActual?.logoAgua ??
                Icon(
                  Icons.credit_card,
                  color: Colors.white.withAlpha(20),
                  size: 180,
                ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 45,
                color: Colors.black87,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://www.transparenttextures.com/patterns/diagonal-striped-brick.png",
                            ),
                            repeat: ImageRepeat.repeat,
                            opacity: 0.2,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          _cvcController.text.isEmpty
                              ? 'XXX'
                              : _cvcController.text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Courier',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  _bancoActual != null
                      ? "Tarjeta propiedad de ${_bancoActual!.nombre}. Si se encuentra, devuélvala a la sucursal más cercana."
                      : "Línea de atención 01-800-XXX-XXXX. Tarjeta intransferible.",
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _construirTextField({
    required String hint,
    required TextEditingController controller,
    required bool isCvc,
    TextInputType type = TextInputType.text,
    int? maxLength,
    void Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        focusNode: isCvc ? _cvcFocusNode : null,
        keyboardType: type,
        maxLength: maxLength,
        obscureText: isCvc,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          labelText: hint,
          labelStyle: TextStyle(color: Colors.purple[700], fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple.withAlpha(50)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
          ),
        ),
      ),
    );
  }
}
