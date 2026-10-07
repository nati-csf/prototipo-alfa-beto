class NivelConsonante {
  final String letra;
  final String imagen;
  final String audioLetra;
  final String audioPalabra;
  final String palabraDeletreada;
  final List<String> palabraObjetivo;
  final List<String?> estadoInicial;
  final List<String> opcionesLetras;

  NivelConsonante({
    required this.letra, 
    required this.imagen, 
    required this.audioLetra,
    required this.audioPalabra, 
    required this.palabraDeletreada,
    required this.palabraObjetivo, 
    required this.estadoInicial, 
    required this.opcionesLetras,
  });
}

final List<NivelConsonante> baseDeDatosConsonantes = [
  NivelConsonante(
    letra: 'B', 
    imagen: 'assets/images/BA.png', 
    audioLetra: 'audio/B.mp3',
    audioPalabra: 'audio/Balon.mp3',
    palabraDeletreada: 'B A L Ó N',
    palabraObjetivo: ['b', 'a', 'l', 'o', 'n'],
    estadoInicial: [null, 'a', 'l', 'o', 'n'],
    opcionesLetras: ['b', 'f', 'y', 'm', 'a'],
  ),
  NivelConsonante(
    letra: 'C', 
    imagen: 'assets/images/CA.png', 
    audioLetra: 'audio/C.mp3',
    audioPalabra: 'audio/Casa.mp3',
    palabraDeletreada: 'c a s a', 
    palabraObjetivo: ['c', 'a', 's', 'a'],
    estadoInicial: [null, 'a', 's', 'a'],
    opcionesLetras: ['d', 'i', 'c', 'b', 'o'],
  ),
  NivelConsonante(
    letra: 'D', 
    imagen: 'assets/images/DE.png', 
    audioLetra: 'audio/D.mp3',
    audioPalabra: 'audio/Delfin.mp3',
    palabraDeletreada: 'D E L F Í N', 
    palabraObjetivo: ['d', 'e', 'l', 'f', 'i', 'n'],
    estadoInicial: [null, 'e', 'l', 'f', 'i', 'n'], 
    opcionesLetras: ['t', 'e', 'd', 'b', 'i']
  ),
  NivelConsonante(
    letra: 'F', 
    imagen: 'assets/images/FA.png', 
    audioLetra: 'audio/F.mp3',
    audioPalabra: 'audio/Fantasma.mp3',
    palabraDeletreada: 'f a n t a s m a',
    palabraObjetivo: ['f', 'a', 'n', 't','a', 's', 'm','a',],
    estadoInicial: [null, 'a', 'n', 't','a', 's', 'm','a'],
    opcionesLetras: ['u', 'f', 'c', 'r', 'e'] 
  ),
  NivelConsonante(
    letra: 'G', 
    imagen: 'assets/images/GA.png', 
    audioLetra: 'audio/G.mp3',
    audioPalabra: 'audio/Gato.mp3',
    palabraDeletreada: 'G a t o', 
    palabraObjetivo: ['g', 'a', 't', 'o'],
    estadoInicial: [null, 'a', 't', 'o'], 
    opcionesLetras: ['h', 'a', 'r', 'u', 'g']
  ),
];