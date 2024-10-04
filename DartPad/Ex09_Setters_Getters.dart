void main() {
  final mySquare = Square(side: 18);
  
  // Usamos el setter aquí para asignar un nuevo valor
  try {
    mySquare.side = -32; // Esto debería lanzar una excepción
  } catch (e) {
    print(e); // Imprime el error de validación del setter
  }

  print("""Lado del Cuadrado: ${mySquare.side}
Área que ocupa: ${mySquare.calculateArea()}""");
}

class Square {
  double _side;

  // Constructor con inicialización adecuada del campo _side
  Square({required double side}) : _side = side;

  // Getter para el área
  double get area {
    return _side * _side;
  }

  // Setter con validación
  set side(double value) {
    print("Asignando un nuevo valor al lado: $value");
    if (value < 0) throw 'El valor del lado debe ser mayor a 0.';
    _side = value;
  }

  // Getter para el lado (para que sea accesible externamente)
  double get side => _side;

  // Método para calcular el área usando el valor de side
  double calculateArea() {
    return _side * _side;
  }
}
