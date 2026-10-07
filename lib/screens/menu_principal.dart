import 'package:flutter/material.dart';
import '../controllers/gestor_audio.dart';
import 'lista_vocales_screen.dart';
import 'lista_consonantes_screen.dart';
import 'lista_silabas_screen.dart';


class MenuPrincipalScreen extends StatelessWidget {
  final GestorAudio gestorAudio = GestorAudio();

  MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE5D0), 
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_gruby.png',
                height: 150,
              ),
              const SizedBox(height: 40),
            
              _crearBoton(
                context: context,
                titulo: 'A   Vocales',
                colorFondo: const Color(0xFFF2C570), 
                audioLocal: 'audio/Vocales.mp3',
                alPresionar: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaVocalesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              _crearBoton(
                context: context,
                titulo: 'B   Consonantes',
                colorFondo: const Color(0xFF38BCDE),
                audioLocal: 'audio/Consonantes.mp3',
                alPresionar: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaConsonantesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              _crearBoton(
                context: context,
                titulo: 'C   Sílabas',
                colorFondo: const Color(0xFFD8175C),
                audioLocal: 'audio/Silabas.mp3',
                alPresionar: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaSilabasScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xFF67448B), 
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.arrow_back, color: Color(0xFFF2C570), size: 40),
            Icon(Icons.home, color: Color(0xFF38BCDE), size: 40),
            Icon(Icons.arrow_forward, color: Color(0xFFF2C570), size: 40),
          ],
        ),
      ),
    );
  }

  Widget _crearBoton({
    required BuildContext context,
    required String titulo,
    required Color colorFondo,
    required String audioLocal,
    required VoidCallback alPresionar,
  }) {
    return GestureDetector(
      onTap: () {
        gestorAudio.reproducir(audioLocal);
        alPresionar();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, 
        height: 80,
        decoration: BoxDecoration(
          color: colorFondo,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 32, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}