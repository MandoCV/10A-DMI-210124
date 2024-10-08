abstract class Animal {}

abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

mixin Volador {
  void volar() => print('Estoy volando!');
}

mixin Caminante {
  void caminar() => print('Estoy caminando!');
}

mixin Nadador {
  void nadar() => print('Estoy nadando!');
}

// Clases de mamíferos
class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Caminante, Volador {}
class Gato extends Mamifero with Caminante {}

// Clases de aves
class Paloma extends Ave with Caminante, Volador {}
class Pato extends Ave with Caminante, Volador, Nadador {}

// Clases de peces
class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Volador, Nadador {}

void main() {
  print("Instanciando clase Delfin y accediendo a sus funciones");
  final flipper = Delfin();
  flipper.nadar();
  print("_______________________________________________");

  print("Instanciando clase Murcielago y accediendo a sus funciones");
  final batman = Murcielago();
  batman.caminar();
  batman.volar();
  print("_______________________________________________");

  print("Instanciando clase Pato y accediendo a sus funciones");
  final namor = Pato();
  namor.volar();
  namor.caminar();
  namor.nadar();
}
