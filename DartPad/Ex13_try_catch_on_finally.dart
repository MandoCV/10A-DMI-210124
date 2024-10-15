void main() async {
  // La función main es asíncrona (async) para poder usar 'await'

  print('Inicio del programa');
  // Imprime un mensaje indicando el inicio del programa

  try {
    // Intenta hacer la petición HTTP simulada usando 'await'
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Si la petición es exitosa, imprime el valor devuelto
    print('éxito: $value');
    
  } on Exception catch(err) {
    // Captura específicamente las excepciones del tipo Exception
    print('Tenemos una Exception: $err');
    
  } catch (err) {
    // Captura cualquier otro tipo de error no cubierto por el bloque anterior
    print('OOP!! algo terrible pasó: $err');
    
  } finally {
    // El bloque finally se ejecuta siempre, haya o no un error
    print('Fin del try y catch');
  }

  print('Fin del programa');
  // Imprime un mensaje indicando el fin del programa
}

// Función que simula una petición HTTP que retorna un Future<String>
Future<String> httpGet(String url) async {
  
  // Simula un retraso de 1 segundo antes de continuar
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanza una excepción del tipo Exception con un mensaje personalizado
  throw Exception('No hay parámetros en el URL');
  
  // Si no se lanzara la excepción, esta sería la respuesta:
  // return 'Tenemos un valor de la petición';
  
  // Otra opción es lanzar un error no tipado:
  // throw 'Error en la petición';
}
