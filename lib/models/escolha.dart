enum Escolha {
  pedra,
  papel,
  tesoura;

  String get nome {
    switch (this) {
      case pedra:
        return 'Pedra';
      case papel:
        return 'Papel';
      case tesoura:
        return 'Tesoura';
    }
  }

  String get imagem {
    return 'assets/${nome}.png';
  }
}