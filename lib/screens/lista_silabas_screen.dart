import 'package:flutter/material.dart';
import 'silaba_screen.dart';
import '../models/nivel_silabas.dart';

class ListaSilabasScreen extends StatelessWidget {
  const ListaSilabasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF38BCDE),
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Sílabas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        ),
        backgroundColor: const Color(0xFFD8175C),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: List.generate(baseDeDatosSilabas.length, (index) {
                final nivel = baseDeDatosSilabas[index];
                return _crearBotonSilaba(context, nivel.silaba, index);
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearBotonSilaba(BuildContext context, String silaba, int indice) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SilabaScreen(indiceActual: indice)),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFD8175C),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              silaba, 
              style: const TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold)
            ),
          ),
        ),
      ),
    );
  }
}