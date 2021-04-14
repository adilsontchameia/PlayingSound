import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instanciando o pacote que reproducao de sons
  AudioCache audioCache = AudioCache();
  //Executando o som
  _executar() async {
    //Instanciando a classe
    final player = AudioCache();
    //Pegando o arquivo desejado para reproduzir
    player.play("musica.mp3");
  }

  @override
  Widget build(BuildContext context) {
    _executar();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Playing Sound"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
