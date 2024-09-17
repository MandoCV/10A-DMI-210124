void main() {
  //dynamic null
  dynamic errorMessage;

  print(""" El valor inicial de errorMessage es:
  $errorMessage
  que por defecto permite establecer valores nulos
""");

  errorMessage = "El usuario y contraseña no coinciden";

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  en este caso asignado String
""");

  errorMessage = 404;

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  en algunos sistemas los errores pueden controlarse por codigos numericos
""");

  errorMessage = false;

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  ahora le asignamos un valor booleano""");

  // Asignar un valor de tipo lista
  errorMessage = [1, 2, 3, 4, 5];

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  ahora le asignamos una lista de números enteros
""");

  errorMessage = (125, "Usuario no encontrado", true, -2231, "&");

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  ahora le asignamos un conjunto SET
 
""");
  errorMessage = () => true;

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  ahora le asignamos arrow function
 
""");

  // Asignar un valor de tipo mapa
  errorMessage = {"error_code": 404, "message": "Not Found"};

  print(""" El nuevo valor de errorMessage es:
  $errorMessage
  ahora le asignamos un mapa con código de error y mensaje
""");
}
