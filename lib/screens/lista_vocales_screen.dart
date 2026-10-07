import 'package:flutter/material.dart';
import '../models/nivel_vocal.dart';
import 'vocales_screen.dart'; 

class ListaVocalesScreen extends StatelessWidget {
  const ListaVocalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF38BCDE), 
      appBar: AppBar(
        title: const Text('Vocales', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFF2C570),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(baseDeDatosVocales.length, (index) {
              final nivel = baseDeDatosVocales[index];
              return _crearBotonVocal(context, nivel.letra, index);
            }),
          ),
        ),
      ),
    );
  }

  Widget _crearBotonVocal(BuildContext context, String letra, int indice) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VocalesScreen(indiceActual: indice)),
        );
      },
      child: Container(
        width: 100, height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFF2C570),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Text(letra, style: const TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}