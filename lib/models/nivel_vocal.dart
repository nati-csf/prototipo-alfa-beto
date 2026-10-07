class NivelVocal {
  final String letra;
  final String imagen;
  final String audioLetra;
  final String audioPalabra;
  final String palabraDeletreada;
  final List<String> palabraObjetivo;
  final List<String?> estadoInicial;
  final List<String> opcionesLetras;

  NivelVocal({
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

final List<NivelVocal> baseDeDatosVocales = [
  NivelVocal(
    letra: 'A', imagen: 'assets/images/A.png', 
    audioLetra: 'audio/a.mp3', 
    audioPalabra: 'audio/abeja.mp3',
    palabraDeletreada: 'A B E J A',
    palabraObjetivo: ['A', 'B', 'E', 'J', 'A'], 
    estadoInicial: [null, 'B', 'E', 'J', null], 
    opcionesLetras: ['M', 'A', 'U', 'C', 'A'],
  ),
  NivelVocal(
    letra: 'E', 
    imagen: 'assets/images/E.png', 
    audioLetra: 'audio/e.mp3', 
    audioPalabra: 'audio/elefante.mp3',
    palabraDeletreada: 'E L E F A N T E', 
    palabraObjetivo: ['E', 'L', 'E', 'F', 'A', 'N', 'T', 'E'], 
    estadoInicial: [null, 'L', null, 'F', 'A', 'N', 'T', null], 
    opcionesLetras: ['E', 'I', 'O', 'A', 'U'],
  ),
  NivelVocal(
    letra: 'I', 
    imagen: 'assets/images/I.png', 
    audioLetra: 'audio/i.mp3',
    audioPalabra: 'audio/isla.mp3',
    palabraDeletreada: 'I S L A',
    palabraObjetivo: ['I', 'S', 'L', 'A'],
    estadoInicial: [null, 'S', 'L', null],
    opcionesLetras: ['A', 'I', 'E', 'O', 'U'],
  ),
  NivelVocal(
    letra: 'O', 
    imagen: 'assets/images/O.png', 
    audioLetra: 'audio/o.mp3',
    audioPalabra: 'audio/oso.mp3',
    palabraDeletreada: 'O S O',
    palabraObjetivo: ['O', 'S', 'O'],
    estadoInicial: [null, 'S', null],
    opcionesLetras: ['O', 'A', 'I', 'E', 'U'],
  ),
  NivelVocal(
    letra: 'U', 
    imagen: 'assets/images/U.png', 
    audioLetra: 'audio/u.mp3',
    audioPalabra: 'audio/uva.mp3',
    palabraDeletreada: 'U V A',
    palabraObjetivo: ['U', 'V', 'A'],
    estadoInicial: [null, 'V', null],
    opcionesLetras: ['U', 'A', 'E', 'O', 'I'],
  ),
];