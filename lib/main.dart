import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
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
  //Instanciando a classe
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  //Verificando se e a primeira vez a ser executada
  //
  //Executando o som
  _executar() async {
    //Pegando o arquivo desejado para reproduzir
    audioPlayer.play("fear.mp3");
  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Playing Sound"),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Image.asset("images/executar.png"),
                onTap: () {
                  _executar();
                },
              ),
              GestureDetector(
                child: Image.asset("images/pausar.png"),
                onTap: () {},
              ),
              GestureDetector(
                child: Image.asset("images/parar.png"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
