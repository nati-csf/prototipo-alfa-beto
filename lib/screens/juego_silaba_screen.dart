import 'package:flutter/material.dart';
import '../controllers/gestor_audio.dart';
import '../models/nivel_silabas.dart';
import 'silaba_screen.dart';
import 'felicitaciones_screen.dart';

class JuegoSilabasScreen extends StatefulWidget {
  final int indiceActual;
  const JuegoSilabasScreen({super.key,required this.indiceActual
  });

  @override
  State<JuegoSilabasScreen> createState() => _JuegoSilabasScreenState();
}
class _JuegoSilabasScreenState extends State<JuegoSilabasScreen> {
  final GestorAudio gestorAudio = GestorAudio();
  late List<String?> estadoPalabra;
  late NivelSilaba nivel;

  @override
  void initState() {
    super.initState();
    nivel = baseDeDatosSilabas[widget.indiceActual];
    estadoPalabra = List.from(nivel.estadoInicial);
  }

  void _validarSeleccion(String letraSeleccionada) {
    int indiceVacio = estadoPalabra.indexOf(null);
    if (indiceVacio != -1) {
      if (nivel.palabraObjetivo[indiceVacio] == letraSeleccionada) {
        setState(() { estadoPalabra[indiceVacio] = letraSeleccionada; });
        gestorAudio.reproducir('audio/bien.mp3');
        if (!estadoPalabra.contains(null)) {
          gestorAudio.reproducir(nivel.audioPalabra);
        }
      } else {
        gestorAudio.reproducir('audio/intentalo.mp3');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color(0xFF38BCDE),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column (
            children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFD8175C),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              ),
              child: const Center(
                child: Text('Sílabas', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: screenWidth * 0.7, 
              height: 200,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(20),
              child: Image.asset(nivel.imagen), 
            ),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: estadoPalabra.map((letra) {
                return letra == null ? _crearLineaVacia() : _crearTarjeta(letra, inactiva: true);
              }).toList(),
            ),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: nivel.opcionesLetras.map((letra) {
                return GestureDetector(onTap: () => _validarSeleccion(letra), child: _crearTarjeta(letra, inactiva: false));
              }).toList(),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SilabaScreen(indiceActual: widget.indiceActual)),
                );
              }
            ),
            IconButton(icon: const Icon(Icons.home, color: Color(0xFF38BCDE), size: 40), onPressed: () => Navigator.pushNamed(context, '/')),
            IconButton(
              icon: Icon(
                Icons.arrow_forward, 
                color: !estadoPalabra.contains(null) ? const Color(0xFFF2C570) : Colors.grey, 
                size: 40
              ), 
              onPressed: () {
                if (estadoPalabra.contains(null)) {
                  gestorAudio.reproducir('audio/intentalo.mp3');
                  return;
                }

                int siguienteIndice = widget.indiceActual + 1;
                
                if (siguienteIndice < baseDeDatosSilabas.length) {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => SilabaScreen(indiceActual: siguienteIndice))
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FelicitacionesScreen(
                        titulo: '¡Lo lograste!',
                        subtitulo: '¡Completaste todas las secciones!',
                        onInicio: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTarjeta(String texto, {required bool inactiva}) {
    return Container(
      width: 75,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFD8175C),
        borderRadius: BorderRadius.circular(10),
        boxShadow: inactiva ? [] : const [BoxShadow(color: Colors.black26, offset: Offset(0, 3), blurRadius: 3)],
      ),
      alignment: Alignment.center,
      child: Text(texto, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _crearLineaVacia() {
    return Container(width: 75, height: 55, alignment: Alignment.bottomCenter, child: Container(width: 50, height: 4, color: Colors.white));
  }
}