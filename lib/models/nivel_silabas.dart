class NivelSilaba {
  final String silaba;
  final String imagen;
  final String audioSilaba;
  final String audioPalabra;
  final String palabraDeletreada;
  final List<String> palabraObjetivo;
  final List<String?> estadoInicial;
  final List<String> opcionesLetras;

  NivelSilaba({
    required this.silaba, 
    required this.imagen, 
    required this.audioSilaba,
    required this.audioPalabra, 
    required this.palabraDeletreada,
    required this.palabraObjetivo, 
    required this.estadoInicial, 
    required this.opcionesLetras,
  });
}

final List<NivelSilaba> baseDeDatosSilabas = [
  NivelSilaba(
    silaba: 'BA', 
    imagen: 'assets/images/BA.png', 
    audioSilaba: 'audio/Ba.mp3',
    audioPalabra: 'audio/Balon.mp3',
    palabraDeletreada: 'B A L Ó N',
    palabraObjetivo: ['b', 'a', 'l', 'o', 'n'],
    estadoInicial: [null, null, 'l', 'o', 'n'],
    opcionesLetras: ['b', 'a', 'e', 'i', 'n'],
),
  NivelSilaba(
    silaba: 'BE', 
    imagen: 'assets/images/BE.png', 
    audioSilaba: 'audio/Be.mp3',
    audioPalabra: 'audio/Bebe.mp3',
    palabraDeletreada: 'b e b é',
    palabraObjetivo: ['b', 'e', 'b', 'e'],
    estadoInicial: [null, null, null, null],
    opcionesLetras: ['e', 'b', 'd', 'u', 'n'],
  ),
  NivelSilaba(
silaba: 'BI', 
    imagen: 'assets/images/BI.png', 
    audioSilaba: 'audio/bi.mp3',
    audioPalabra: 'audio/Bigote.mp3',
    palabraDeletreada: 'B i g o t e',
    palabraObjetivo: ['b', 'i', 'g', 'o','t','e'],
    estadoInicial: [null, null, 'g','o','t','e'],
    opcionesLetras: ['i', 'r', 'b', 'a', 'k'],     
  ),
  NivelSilaba(
    silaba: 'BO', 
    imagen: 'assets/images/BO.png', 
    audioSilaba: 'audio/Bo.mp3',
    audioPalabra: 'audio/Bote.mp3',
    palabraDeletreada: 'B O T E',
    palabraObjetivo: ['b', 'o','t','e'],
    estadoInicial: [null, null,'t','e'],
    opcionesLetras: ['u', 'o', 'h', 'm', 'b'],
  ),             
  NivelSilaba(
    silaba: 'BU', 
    imagen: 'assets/images/BU.png', 
    audioSilaba: 'audio/Bu.mp3',
    audioPalabra: 'audio/Buho.mp3',
    palabraDeletreada: 'B u h o',
    palabraObjetivo: ['b', 'u', 'h', 'o'],
    estadoInicial: [null, null, 'h','o'],
    opcionesLetras: ['o', 's', 'b', 'u', 't'],
                
  ),
];