import 'dart:math';

import 'package:apm_251_pr01_samuelduartegomes/models/escolha.dart';
import 'package:apm_251_pr01_samuelduartegomes/utils/resultado.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Escolha? escolhaJogador;
  Escolha? escolhaMaquina;
  String resultado = '';

  void jogar() {
    if (escolhaJogador == null) return;

    final random = Random();
    escolhaMaquina = Escolha.values[random.nextInt(3)];

    resultado = verificarResultado(escolhaJogador!, escolhaMaquina!);

    setState(() {});
  }
  Widget botaoEscolha (Escolha escolha) {
    final selecionado = escolhaJogador == escolha;

    return GestureDetector(
      onTap: () {
        setState(() {
          escolhaJogador = escolha;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selecionado ? Colors.blue : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child:Image.asset(escolha.imagem, width: 80),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Escolha sua jogada:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                botaoEscolha(Escolha.pedra),
                botaoEscolha(Escolha.papel),
                botaoEscolha(Escolha.tesoura),
              ],
            ),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: jogar,
              child: const Text('JOGAR'),
            ),
            const SizedBox(height: 30),
            if (escolhaJogador != null)
              Column(
                children: [
                  Text('Sua jogada: ${escolhaJogador!.nome}'),
                  Image.asset(escolhaJogador!.imagem, width: 60),
                ],
              ),
            const SizedBox(height: 10),
            if (escolhaMaquina != null)
              Column(
                children: [
                  Text('Máquina: ${escolhaMaquina!.nome}'),
                  Image.asset(escolhaMaquina!.imagem, width: 60),
                ],
              ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}