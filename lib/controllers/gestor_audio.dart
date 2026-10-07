import 'package:audioplayers/audioplayers.dart';

class GestorAudio {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> reproducir(String rutaLocal) async {
    try {
      await detener(); 
      await _audioPlayer.play(AssetSource(rutaLocal));
    } catch (e) {
      print("Error al reproducir el audio: $e");
    }
  }

  Future<void> detener() async {
    await _audioPlayer.stop();
  }
  
  void liberar() {
    _audioPlayer.dispose();
  }
}