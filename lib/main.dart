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
  AudioCache audioCache = AudioCache();
  AudioPlayer player = AudioPlayer();
  bool primeiraExecucao = true;
  double _volume = 0.5; //Volume intermediario (50)
  //Executando o som
  _executar() async {
    //Pegando o arquivo desejado para reproduzir
    player.setVolume(_volume);
    if (primeiraExecucao) {
      player = await audioCache.play("fear.mp3");
      primeiraExecucao = false;
    } else {
      player.resume();
    }
  }

  //Pausar o som
  _pausar() async {
    int resultado = await player.pause();
    if (resultado == 1) {}
  }

  //Parando a reproducao
  _parar() async {
    int resultado = await player.stop();
    if (resultado == 1) {}
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
              Slider(
                  value: 0,
                  _volume: 0,
                  max: 1,
                  onChanged: (novoVolume) {
                    setState(() {
                      _volume = novoVolume;
                    });
                    player.setVolume(novoVolume);
                  }),
              GestureDetector(
                child: Image.asset("images/executar.png"),
                onTap: () {
                  _executar();
                },
              ),
              GestureDetector(
                child: Image.asset("images/pausar.png"),
                onTap: () {
                  _pausar();
                },
              ),
              GestureDetector(
                child: Image.asset("images/parar.png"),
                onTap: () {
                  _parar();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
