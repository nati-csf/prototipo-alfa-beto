import 'package:flutter/material.dart';
import 'screens/menu_principal.dart';
import 'screens/lista_silabas_screen.dart';
import 'screens/lista_vocales_screen.dart';
import 'screens/lista_consonantes_screen.dart';

void main() {
  runApp(const PrototipoLecturaApp());
}

class PrototipoLecturaApp extends StatelessWidget {
  const PrototipoLecturaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gruby Alfa-Beto',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MenuPrincipalScreen(),
        '/vocales': (context) => ListaVocalesScreen(),
        '/consonantes': (context) => ListaConsonantesScreen(),
        '/silaba': (context) => const ListaSilabasScreen(),
      },
    );
  }
}