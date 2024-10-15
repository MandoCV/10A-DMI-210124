void main() {
  // Este es el punto de entrada del programa

  print('Inicio del programa');
  // Imprime un mensaje indicando el inicio del programa

  // Llamada a la función httpGet, que devuelve un Future<String>
  // Se usa .then para manejar el resultado exitoso de la petición
  httpGet('https://fernando-herrera.com/cursos')
    .then( 
      (value) {
        // Cuando la petición es exitosa, imprime el valor devuelto
        print(value);
      }
    )
    // Maneja cualquier error que ocurra durante la petición
    .catchError( (err) {
      // Imprime el error capturado
      print('Error: $err');
    });

  print('Fin del programa');
  // Imprime un mensaje indicando el final del programa
}

// Esta función simula una petición HTTP que retorna un Future<String>
Future<String> httpGet(String url) {
  
  // Simula un retraso de 1 segundo antes de completar el Future
  return Future.delayed(const Duration(seconds: 1), () {
    
    // Lanza una excepción simulando un error en la petición HTTP
    throw 'Error en la petición http';
    
    // Si no se lanzara la excepción, retornaría esta respuesta:
    // return 'Respuesta de la petición http';
    
  });
}
