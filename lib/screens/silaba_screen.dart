import 'package:flutter/material.dart';
import '../controllers/gestor_audio.dart';
import 'juego_silaba_screen.dart';
import '../models/nivel_silabas.dart';

class SilabaScreen extends StatelessWidget {
  final GestorAudio gestorAudio = GestorAudio();
  final int indiceActual;

  SilabaScreen({super.key, required this.indiceActual});

  @override
  Widget build(BuildContext context) {
    final nivel = baseDeDatosSilabas[indiceActual];
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF38BCDE),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFFD8175C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const Text('Sílabas', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(baseDeDatosSilabas.length, (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: index <= indiceActual
                              ? const Color(0xFF81C784)
                              : const Color.fromARGB(255, 173, 8, 65),
                          shape: BoxShape.circle,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _crearTarjetaSilaba(nivel.silaba, nivel.audioSilaba),
                  const SizedBox(width: 20),
                  _crearTarjetaSilaba(nivel.silaba.toLowerCase(), nivel.audioSilaba),
                ],
              ),
              const SizedBox(height: 30),
              
              GestureDetector(
                onTap: () => gestorAudio.reproducir(nivel.audioPalabra),
                child: Container(
                  width: screenWidth * 0.7,
                  height: 220,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(nivel.imagen),
                ),
              ),
              const SizedBox(height: 30),

              GestureDetector(
                onTap: () => gestorAudio.reproducir(nivel.audioPalabra),
                child: Container(
                  width: screenWidth * 0.8,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8175C),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)],
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        nivel.palabraDeletreada,
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 4.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: const Color(0xFF67448B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFF2C570), size: 40),
              onPressed: () {
                if (indiceActual > 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => JuegoSilabasScreen(indiceActual: indiceActual - 1)),
                  );
                } else {
                  Navigator.pop(context);
                }
              }
            ),
            IconButton(icon: const Icon(Icons.home, color: Color(0xFF38BCDE), size: 40), onPressed: () => Navigator.pushNamed(context, '/')),
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: Color(0xFFF2C570), size: 40),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => JuegoSilabasScreen(indiceActual: indiceActual)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTarjetaSilaba(String textoMostrado, String audio) {
    return GestureDetector(
      onTap: () => gestorAudio.reproducir(audio),
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0xFFD8175C),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Text(textoMostrado, style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}