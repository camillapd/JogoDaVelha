import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';

class Game extends StatefulWidget {
  String nome;
  String radioTabuleiro;
  String radioSimbolo;
  List<String> tabuleiro3 = ['', '', '', '', '', '', '', '', ''];

  Game(this.nome, this.radioTabuleiro, this.radioSimbolo);

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}

class GameState extends State<Game> {
  String jogada = "";
  final String _jogador = "Jogador atual:  ";
  final String _resultado = "Resultado da partida:  ";
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da velha"),
        backgroundColor: Colors.pink[50],
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                _jogador,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.nome,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            ]),
            if (widget.radioTabuleiro == "3x")
              Container(
                  padding: EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      )
                    ],
                  ))
            else if (widget.radioTabuleiro == "4x")
              Container(
                  padding: EdgeInsets.all(10),
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              color: Colors.pink,
                              width: 50,
                              height: 50,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jogada = "x";
                                    });
                                  },
                                  child: Center(
                                    child: Text(jogada,
                                        style: TextStyle(
                                          fontSize: 24,
                                        )),
                                  ))),
                          Spacer(),
                          Container(
                            color: Colors.pink,
                            width: 50,
                            height: 50,
                            child: Text("aaa"),
                          ),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50),
                          Spacer(),
                          Container(color: Colors.pink, width: 50, height: 50)
                        ],
                      )
                    ],
                  )),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pinkAccent[50],
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent[50],
            textStyle: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          child: const Text("Novo jogo"),
        ),
      ),
    );
  }
}
