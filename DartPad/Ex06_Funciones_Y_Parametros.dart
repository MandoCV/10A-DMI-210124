void main() {
  //1. Llamado de una funcion sin parametros
  greetEveryone();
  
  //2. LLAMADO DE UNA FUNCION QUE RETORNA VALORESsss
  //A)  SIN ALMACENAR EL VALOR DE UNA VARIABLE
  print("hoy es el dia numero: ${getDayNumber()} del mes.");
  //B) ALAMACENADO EL VALOR DE LA FUNCION EN UNA NUEVA VARIABLE
  final int diaMes;
  diaMes = getDayNumber();
  print("Entre tres dias sera: ${diaMes+3}");

//3. LLAMADO DE UNA FUNCION CON SOLO PARAMETRO OBLIGATORIOssss

//A) LLAMADO CORRECTO
print(greetSomeone("Mando"));
//B) DECALARDO COMO DYNAMIC
print(greetSomeone(4));
print(greetSomeone(-312));
print(greetSomeone(3.1415));
print(greetSomeone(true));
print("-----------------------------------------------------------------");

//C) MISMO EXPERIMENTO PERO AHORA CON LA FUNCION  PARAMETROS TIPADOS
/*print(greetSomeoneTyped("Bruno"));
print(greetSomeoneTyped(4));
print(greetSomeoneTyped(-312));
print(greetSomeoneTyped(3.1415));
print(greetSomeoneTyped(true));
*/
/*3.2
 print(greetSomeone()); Esta no se puede ejecutar porque si no se define 
 los parametros de una funcion por defaul estan definidos como obligatorios
 */
  //4. Llamado de una funcion con parametros opcionales
  //4.1 ENCVIANDO AMBOS PARAMETROS
  print(greetHourOfDay("Barrios",9));
  //4.2 SOLO ENVIADO EL OBLIGATORIO
  print(greetHourOfDay("Julissa", null));
}

//FUNCIONES Y PARAMETROS 
  
  //DECLARACION
  
  //1. FUNCION SIN PARAMETROS
void greetEveryone()

{
  print("Hola a todas, todos y todes c=3");
}
//2. Funcion sin parametro, que retorna datos 
getDayNumber()
{
  DateTime now = DateTime.now();
  int day = now.day;
  return day;
}

//3. FUNCION QUE RECIBE UN PARAMETRO, EN DART SI NO SE ESPECIFICA COMO OPCIONAL SIEMPRE SERA OBLIGATORIO
String greetSomeone(personName)
{
  return("Hola, ${personName}");
}

String greetSomeoneTyped(String personName)
{
  return("Hola, ${personName}");
}

// 4. FUNCIÓN CON PARÁMETROS OPCIONALES
String greetHourOfDay(String personName, int? hora) {
  hora ??= DateTime.now().hour; // Asignar la hora actual si hora es nulo
  String saludo;

  if (hora >= 6 && hora < 12) {
    saludo = "Buenos Días";
  } else if (hora >= 12 && hora < 18) {
    saludo = "Buenas Tardes";
  } else {
    saludo = "Buenas Noches";
  }

  return "$saludo, $personName";
  
}
