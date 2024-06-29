import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';

class Game extends StatefulWidget {
  String nome;
  String tamTabuleiro;
  String simbJogador;

  Game(this.nome, this.tamTabuleiro, this.simbJogador);

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}

class GameState extends State<Game> {
  final String _jogador = "Jogador atual:  ";
  final String _resultado = "Jogador vencedor:  ";

  int pontuacaoJogador = 0;
  int pontuacaoPC = 0;
  int countCasas = 0;
  int minhaJogada = -1;
  bool fimJogo = false;

  String turno = "jogador";
  String simbPC = "";
  String vencedor = "";

  List<String> tabuleiro3 = ['', '', '', '', '', '', '', '', ''];
  List<String> tabuleiro4 = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    // pegar símbolo oposto para o pc
    if (widget.simbJogador == "x") {
      simbPC = "o";
    } else if (widget.simbJogador == "o") {
      simbPC = "x";
    }

    // "loop" do jogo que chama as funções que jogam no tabuleiro
    if (!fimJogo) {
      if (widget.tamTabuleiro == "3x") {
        _jogo3x3();
      } else if (widget.tamTabuleiro == "4x") {
        _jogo4x4();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da velha"),
        backgroundColor: Colors.pink[50],
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  _jogador,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                if (turno == "jogador")
                  Text(
                    widget.nome,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                else if (turno == "pc")
                  Text(
                    "computador",
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )
              ]),
              if (fimJogo)
                Text(
                  _resultado + vencedor,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              if (widget.tamTabuleiro == "3x")
                Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 100,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                minhaJogada = index;
                              });
                            },
                            child: Container(
                              color: Colors.pink,
                              child: Text(
                                tabuleiro3[index],
                                style: TextStyle(
                                    fontSize: 60,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }))
              else if (widget.tamTabuleiro == "4x")
                Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: 16,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisExtent: 100,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                minhaJogada = index;
                              });
                            },
                            child: Container(
                              color: Colors.pink,
                              child: Text(
                                tabuleiro4[index],
                                style: TextStyle(
                                    fontSize: 60,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        })),
            ],
          ),
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

  void _jogo3x3() {
    setState(() {
      if (turno == "jogador") {
        if (minhaJogada != -1 && tabuleiro3[minhaJogada] == "") {
          tabuleiro3[minhaJogada] = widget.simbJogador;
          countCasas++;
          Future.delayed(const Duration(milliseconds: 10), () {
            turno = "pc";
          });
        }
      }

      if (turno == "pc") {
        bool pcJogou = false;
        int jogada = Random().nextInt(9);

        while (!pcJogou) {
          if (tabuleiro3[jogada] == "") {
            pcJogou = true;
          } else {
            jogada = Random().nextInt(9);
          }
        }

        tabuleiro3[jogada] = simbPC;
        countCasas++;

        Future.delayed(const Duration(milliseconds: 10), () {
          turno = "jogador";
        });
      }
    });

    checaVencedor3x3();
  }

  void _jogo4x4() {
    setState(() {
      if (turno == "jogador") {
        if (minhaJogada != -1 && tabuleiro4[minhaJogada] == "") {
          tabuleiro4[minhaJogada] = widget.simbJogador;
          countCasas++;
          Future.delayed(const Duration(milliseconds: 10), () {
            turno = "pc";
          });
        }
      }

      if (turno == "pc") {
        bool pcJogou = false;
        int jogada = Random().nextInt(15);

        while (!pcJogou) {
          if (tabuleiro4[jogada] == "") {
            pcJogou = true;
          } else {
            jogada = Random().nextInt(15);
          }
        }

        tabuleiro4[jogada] = simbPC;
        countCasas++;

        Future.delayed(const Duration(milliseconds: 10), () {
          turno = "jogador";
        });
      }
    });

    checaVencedor4x4();
  }

  void checaVencedor3x3() {
    // linhas //
    if (tabuleiro3[0] == widget.simbJogador &&
        tabuleiro3[1] == widget.simbJogador &&
        tabuleiro3[2] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[0] == simbPC &&
        tabuleiro3[1] == simbPC &&
        tabuleiro3[2] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro3[3] == widget.simbJogador &&
        tabuleiro3[4] == widget.simbJogador &&
        tabuleiro3[5] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[3] == simbPC &&
        tabuleiro3[4] == simbPC &&
        tabuleiro3[5] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro3[6] == widget.simbJogador &&
        tabuleiro3[7] == widget.simbJogador &&
        tabuleiro3[8] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[6] == simbPC &&
        tabuleiro3[7] == simbPC &&
        tabuleiro3[8] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    // colunas //
    if (tabuleiro3[0] == widget.simbJogador &&
        tabuleiro3[3] == widget.simbJogador &&
        tabuleiro3[6] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[0] == simbPC &&
        tabuleiro3[3] == simbPC &&
        tabuleiro3[6] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro3[1] == widget.simbJogador &&
        tabuleiro3[4] == widget.simbJogador &&
        tabuleiro3[7] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[1] == simbPC &&
        tabuleiro3[4] == simbPC &&
        tabuleiro3[7] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro3[2] == widget.simbJogador &&
        tabuleiro3[5] == widget.simbJogador &&
        tabuleiro3[8] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[2] == simbPC &&
        tabuleiro3[5] == simbPC &&
        tabuleiro3[8] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    // diagonais //
    if (tabuleiro3[0] == widget.simbJogador &&
        tabuleiro3[4] == widget.simbJogador &&
        tabuleiro3[8] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[0] == simbPC &&
        tabuleiro3[4] == simbPC &&
        tabuleiro3[8] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro3[2] == widget.simbJogador &&
        tabuleiro3[4] == widget.simbJogador &&
        tabuleiro3[6] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro3[2] == simbPC &&
        tabuleiro3[4] == simbPC &&
        tabuleiro3[6] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    // checa velha //
    if (countCasas == 9 && vencedor == "") {
      vencedor = "velha";
      fimJogo = true;
    }
  }

  void checaVencedor4x4() {
    // linhas //
    if (tabuleiro4[0] == widget.simbJogador &&
        tabuleiro4[1] == widget.simbJogador &&
        tabuleiro4[2] == widget.simbJogador &&
        tabuleiro4[3] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[0] == simbPC &&
        tabuleiro4[1] == simbPC &&
        tabuleiro4[2] == simbPC &&
        tabuleiro4[3] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[4] == widget.simbJogador &&
        tabuleiro4[5] == widget.simbJogador &&
        tabuleiro4[6] == widget.simbJogador &&
        tabuleiro4[7] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[4] == simbPC &&
        tabuleiro4[5] == simbPC &&
        tabuleiro4[6] == simbPC &&
        tabuleiro4[7] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[8] == widget.simbJogador &&
        tabuleiro4[9] == widget.simbJogador &&
        tabuleiro4[10] == widget.simbJogador &&
        tabuleiro4[11] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[8] == simbPC &&
        tabuleiro4[9] == simbPC &&
        tabuleiro4[10] == simbPC &&
        tabuleiro4[11] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[12] == widget.simbJogador &&
        tabuleiro4[13] == widget.simbJogador &&
        tabuleiro4[14] == widget.simbJogador &&
        tabuleiro4[15] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[12] == simbPC &&
        tabuleiro4[13] == simbPC &&
        tabuleiro4[14] == simbPC &&
        tabuleiro4[15] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    // colunas //
    if (tabuleiro4[0] == widget.simbJogador &&
        tabuleiro4[4] == widget.simbJogador &&
        tabuleiro4[8] == widget.simbJogador &&
        tabuleiro4[12] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[0] == simbPC &&
        tabuleiro4[4] == simbPC &&
        tabuleiro4[8] == simbPC &&
        tabuleiro4[12] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[1] == widget.simbJogador &&
        tabuleiro4[5] == widget.simbJogador &&
        tabuleiro4[9] == widget.simbJogador &&
        tabuleiro4[13] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[1] == simbPC &&
        tabuleiro4[5] == simbPC &&
        tabuleiro4[9] == simbPC &&
        tabuleiro4[13] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[2] == widget.simbJogador &&
        tabuleiro4[6] == widget.simbJogador &&
        tabuleiro4[10] == widget.simbJogador &&
        tabuleiro4[14] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[2] == simbPC &&
        tabuleiro4[6] == simbPC &&
        tabuleiro4[10] == simbPC &&
        tabuleiro4[14] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[3] == widget.simbJogador &&
        tabuleiro4[7] == widget.simbJogador &&
        tabuleiro4[11] == widget.simbJogador &&
        tabuleiro4[15] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[3] == simbPC &&
        tabuleiro4[7] == simbPC &&
        tabuleiro4[11] == simbPC &&
        tabuleiro4[15] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    // diagonais //
    if (tabuleiro4[0] == widget.simbJogador &&
        tabuleiro4[5] == widget.simbJogador &&
        tabuleiro4[10] == widget.simbJogador &&
        tabuleiro4[15] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[0] == simbPC &&
        tabuleiro4[5] == simbPC &&
        tabuleiro4[10] == simbPC &&
        tabuleiro4[15] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    if (tabuleiro4[3] == widget.simbJogador &&
        tabuleiro4[6] == widget.simbJogador &&
        tabuleiro4[9] == widget.simbJogador &&
        tabuleiro4[12] == widget.simbJogador) {
      vencedor = widget.nome;
      fimJogo = true;
    } else if (tabuleiro4[3] == simbPC &&
        tabuleiro4[6] == simbPC &&
        tabuleiro4[9] == simbPC &&
        tabuleiro4[12] == simbPC) {
      vencedor = "computador";
      fimJogo = true;
    }

    // checa velha //
    if (countCasas == 16 && vencedor == "") {
      vencedor = "velha";
      fimJogo = true;
    }
  }
}
