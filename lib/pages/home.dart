import 'package:flutter/material.dart';
import 'package:hello_world/pages/game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  String? radioTabuleiro;
  String? radioSimbolo;
  final String _tabuleiro = "Escolha o tipo de tabuleiro:";
  final String _simbolo = "Escolha o símbolo:";
  TextEditingController nomeController = TextEditingController();
  String dados = "";

  void _save() {
    print("Save: ${nomeController.text}");
    dados = nomeController.text;

    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da velha"),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
          child: Container(
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Digite o nome do jogador: ",
                  labelStyle: TextStyle(fontSize: 20)),
              style: TextStyle(fontSize: 20),
              maxLength: 10,
            ),
            Text(
              _tabuleiro,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
            RadioListTile(
              title: const Text("3x3"),
              value: "3x",
              groupValue: radioTabuleiro,
              onChanged: (String? value) {
                radioTabuleiro = value;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("4x4"),
              value: "4x",
              groupValue: radioTabuleiro,
              onChanged: (String? value) {
                radioTabuleiro = value;
                setState(() {});
              },
            ),
            Text(
              _simbolo,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
            RadioListTile(
              title: const Text("X"),
              value: "x",
              groupValue: radioSimbolo,
              onChanged: (String? value) {
                radioSimbolo = value;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("O"),
              value: "o",
              groupValue: radioSimbolo,
              onChanged: (String? value) {
                radioSimbolo = value;
                setState(() {});
              },
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pinkAccent[50],
        child: ElevatedButton(
          onPressed: () {
            _save();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Game(
                      nomeController.text, radioTabuleiro!, radioSimbolo!)),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent[100],
            textStyle: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          child: const Text("Jogar"),
        ),
      ),
    );
  }
}
