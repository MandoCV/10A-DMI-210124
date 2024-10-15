
void main() async {
  // La función main es marcada como async, permitiendo el uso de 'await'

  print('Inicio del programa');
  // Imprime un mensaje indicando el inicio del programa

  try {
    // Intenta hacer la petición HTTP simulada usando 'await'
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Si la petición es exitosa, imprime el valor devuelto
    print(value);
  } catch (err) {
    // Si hay un error, lo captura e imprime un mensaje con el error
    print('Tenemos un error: $err');
  }

  print('Fin del programa');
  // Imprime un mensaje indicando el fin del programa
}

// Función que simula una petición HTTP que retorna un Future<String>
Future<String> httpGet(String url) async {
  
  // Simula un retraso de 1 segundo antes de continuar
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanza una excepción simulando un error en la petición
  throw 'Error en la petición';
  
  // Si no se lanzara la excepción, esta sería la respuesta:
  // return 'Tenemos un valor de la petición';
}
