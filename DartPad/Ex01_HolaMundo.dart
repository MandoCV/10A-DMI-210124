void main(){
  // Variable para almacenar mi nombre
  var myName = 'Armando';
  String myLastName = 'Carrasco';
  final int myDNI = 210124;
  //late final int myAge;
  
  //Corregir mi nombre
  myName = "Armando Carrasco Vargas";
  //myDNI = 210124; Esto ocasiono un error porque la variable  esta definida como final
  
  print('Hola, $myName $myLastName, tu matricula es $myDNI y tu edad aún no la conozco, por que no se cuando naciste');
  
  //Interpolando el valor  de las variables con metodos de manipulacion o transformacion
    print('\nHola, ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste');
}

// git commit -m "Practica 03" -m "Agregación de la carpeta de DARTPAD con el ejemplo de HolaMundo"sssdfsf222d