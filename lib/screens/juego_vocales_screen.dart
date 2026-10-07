import 'package:flutter/material.dart';
import '../controllers/gestor_audio.dart';
import '../models/nivel_vocal.dart';
import 'vocales_screen.dart';
import 'felicitaciones_screen.dart';
import 'lista_consonantes_screen.dart';

class JuegoVocalesScreen extends StatefulWidget {
  final int indiceActual;
  const JuegoVocalesScreen({super.key, required this.indiceActual});

  @override
  State<JuegoVocalesScreen> createState() => _JuegoVocalesScreenState();
}

class _JuegoVocalesScreenState extends State<JuegoVocalesScreen> {
  final GestorAudio gestorAudio = GestorAudio();
  late List<String?> estadoPalabra;
  late NivelVocal nivel;

  @override
  void initState() {
    super.initState();
    nivel = baseDeDatosVocales[widget.indiceActual];
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
          child: Column(
            children: [
              Container(
                width: double.infinity, padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: const BoxDecoration(color: Color(0xFFF2C570), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                child: const Center(child: Text('Vocales', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white))),
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
                alignment: WrapAlignment.center, spacing: 8.0, runSpacing: 8.0,
                children: estadoPalabra.map((letra) {
                  return letra == null ? _crearLineaVacia() : _crearTarjetaLetra(letra, inactiva: true);
                }).toList(),
              ),
              const SizedBox(height: 30),
              
              Wrap(
                alignment: WrapAlignment.center, spacing: 8.0, runSpacing: 8.0,
                children: nivel.opcionesLetras.map((letra) {
                  return GestureDetector(onTap: () => _validarSeleccion(letra), child: _crearTarjetaLetra(letra, inactiva: false));
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
                  MaterialPageRoute(builder: (context) => VocalesScreen(indiceActual: widget.indiceActual)),
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
            
                if (siguienteIndice < baseDeDatosVocales.length) {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => VocalesScreen(indiceActual: siguienteIndice))
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FelicitacionesScreen(
                        titulo: '¡Felicitaciones!',
                        subtitulo: '¡Terminaste las vocales!',
                        textoBotonSiguiente: 'Jugar Consonantes', 
                        onSiguiente: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListaConsonantesScreen(),
                            ),
                          );
                        },
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

  Widget _crearTarjetaLetra(String letra, {required bool inactiva}) {
    return Container(
      width: 55, height: 55,
      decoration: BoxDecoration(color: const Color(0xFFF2C570), 
      borderRadius: BorderRadius.circular(10), 
      boxShadow: inactiva ? [] : const [BoxShadow(color: Colors.black26, offset: Offset(0, 3), blurRadius: 3)]),
      alignment: Alignment.center,
      child: Text(letra, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
  
  Widget _crearLineaVacia() {
    return Container(width: 55, height: 55, alignment: Alignment.bottomCenter, child: Container(width: 40, height: 4, color: Colors.white));
  }
}