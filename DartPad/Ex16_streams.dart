void main() {
  // Llama a la función emitNumbers() que retorna un Stream<int>
  // .listen() permite suscribirse al Stream y recibir los valores emitidos
  emitNumbers().listen( (value) {
     // Cada vez que el Stream emite un valor, se imprime en la consola
     print('Stream value: $value');
  });
}


Stream<int> emitNumbers() {
  // Crea un Stream que emite valores periódicos cada 1 segundo
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // 'value' es el número emitido, comenzando desde 0 e incrementándose
    return value;
  }).take(5); 
  // .take(5) indica que solo se tomarán los primeros 5 valores del Stream
}
