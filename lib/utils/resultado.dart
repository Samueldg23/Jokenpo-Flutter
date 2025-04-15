import 'package:apm_251_pr01_samuelduartegomes/models/escolha.dart';

String verificarResultado(Escolha jogador, Escolha maquina) {
  if (jogador == maquina) {
    return 'Empate!';
  }
  if ((jogador == Escolha.pedra && maquina == Escolha.tesoura) ||
      (jogador == Escolha.papel && maquina == Escolha.pedra) ||
      (jogador == Escolha.tesoura && maquina == Escolha.papel)) {
    return 'Você ganhou!';
  }
  return 'Você perdeu!';
}