void main() {
  final String pokemon = 'kunno';
  final int hp = 100;
  final bool isAlive = true;

    final habilities = ['Impact: trueno', 'Cola de hierro','Ataque Rapido'];
  final sprites = <String> ['charizar_front.png', 'charizar_back.png'];

  print(""" Ek pokemon que  elegiste es:
  
  $pokemon, las caracteristicas de $pokemon, son: vida (hp) $hp
  Estiatus de vida: $isAlive.
  sus habilidades son: $habilities
  y su apariencia ess: $sprites
""");
}
