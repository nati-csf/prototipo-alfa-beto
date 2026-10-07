import 'package:flutter/material.dart';
import '../controllers/gestor_audio.dart';
import '../models/nivel_vocal.dart';
import 'juego_vocales_screen.dart'; 

class VocalesScreen extends StatelessWidget {
  final GestorAudio gestorAudio = GestorAudio();
  final int indiceActual;

  VocalesScreen({super.key, required this.indiceActual});

  @override
  Widget build(BuildContext context) {
    final nivel = baseDeDatosVocales[indiceActual];
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
                  color: Color(0xFFF2C570),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25), 
                    bottomRight: Radius.circular(25)
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Vocales', 
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(baseDeDatosVocales.length, (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: index <= indiceActual 
                              ? const Color(0xFF81C784)
                              : const Color.fromARGB(255, 209, 166, 86),
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
                  _crearTarjetaLetra(nivel.letra, nivel.audioLetra),
                  const SizedBox(width: 20),
                  _crearTarjetaLetra(nivel.letra.toLowerCase(), nivel.audioLetra),
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
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2C570),
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
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.0),
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
                    MaterialPageRoute(builder: (context) => JuegoVocalesScreen(indiceActual: indiceActual - 1)),
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
                  MaterialPageRoute(builder: (context) => JuegoVocalesScreen(indiceActual: indiceActual)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTarjetaLetra(String letraMostrada, String audio) {
    return GestureDetector(
      onTap: () => gestorAudio.reproducir(audio),
      child: Container(
        width: 110, height: 110,
        decoration: BoxDecoration(
          color: const Color(0xFFF2C570), 
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Text(letraMostrada, style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}