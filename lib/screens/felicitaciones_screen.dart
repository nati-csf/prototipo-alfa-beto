import 'package:flutter/material.dart';
import '../controllers/gestor_audio.dart';

class FelicitacionesScreen extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final String textoBotonSiguiente;
  final VoidCallback? onSiguiente;
  final VoidCallback onInicio;

  const FelicitacionesScreen({
    super.key,
    this.titulo = '¡Felicitaciones!',
    this.subtitulo = '¡Has completado la sección!',
    this.textoBotonSiguiente = 'Siguiente',
    this.onSiguiente,
    required this.onInicio,
  });

  @override
  State<FelicitacionesScreen> createState() => _FelicitacionesScreenState();
}

class _FelicitacionesScreenState extends State<FelicitacionesScreen> {
  final GestorAudio gestorAudio = GestorAudio();

  @override
  void initState() {
    super.initState();
    gestorAudio.reproducir('audio/aplausos.mp3'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D408B), 
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/gruby.png', 
                          height: MediaQuery.of(context).size.height * 0.35, 
                        ),
                        const SizedBox(height: 30),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.titulo,
                              style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            widget.subtitulo,
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 50),

                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 15.0, 
                          runSpacing: 15.0,
                          children: [
                            if (widget.onSiguiente != null) 
                              _crearBoton(
                                texto: widget.textoBotonSiguiente,
                                colorFondo: const Color(0xFFF2C570), 
                                alPresionar: widget.onSiguiente!,
                              ),
                            _crearBoton(
                              texto: 'Volver a inicio',
                              colorFondo: const Color(0xFFD8175C),
                              alPresionar: widget.onInicio,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Widget _crearBoton({required String texto, required Color colorFondo, required VoidCallback alPresionar}) {
    return GestureDetector(
      onTap: alPresionar,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: colorFondo,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)
          ],
        ),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}