import 'package:flutter/material.dart';
import '/models/nivel_consonantes.dart';
import 'consonantes_screen.dart';

class ListaConsonantesScreen extends StatelessWidget {
  const ListaConsonantesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2C570),
      appBar: AppBar(
        title: const Text('Consonantes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF38BCDE),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(baseDeDatosConsonantes.length, (index) {
                final nivel = baseDeDatosConsonantes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _crearBotonConsonante(context, nivel.letra, index),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearBotonConsonante(BuildContext context, String letra, int indice) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConsonanteScreen(indiceActual: indice)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFF38BCDE),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Consonante $letra', 
              style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)
            ),
          ),
        ),
      ),
    );
  }
}