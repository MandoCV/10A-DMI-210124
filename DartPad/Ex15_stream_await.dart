void main() {
  // Se llama a la función emitNumber() que devuelve un Stream<int>
  // .listen() permite suscribirse al Stream y recibir los valores emitidos
  emitNumber().listen((int value) {
    // Cada vez que el Stream emite un valor, se imprime en la consola
    print('Stream value: $value');
  }); 
}


Stream<int> emitNumber() async* {
  // Lista de valores que el Stream va a emitir
  final valuesToEmit = [1, 2, 3, 4, 5];
  
  // Itera sobre los valores de la lista
  for (int i in valuesToEmit) {
    // Espera 1 segundo antes de emitir cada valor
    await Future.delayed(const Duration(seconds: 1));
    // 'yield' emite el valor actual en el Stream
    yield i;
  }
}
