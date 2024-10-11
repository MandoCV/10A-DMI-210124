//DESARROLLO MOVIL INTEGRAL - TAREA 4
//Armando Carrasco Vargas - 210124 10A IDGS

// Declaración del enum para estatus de vida
enum EstatusVida { Vivo, Finado, Coma, Vegetativo }

// Declaración del enum para estatus médico
enum EstatusMedico { Activo, Inactivo }

// Enum para Género
enum Genero { M, F, NB }

// Enum para Grupo Sanguíneo
enum GrupoSanguineo {
  APositivo, // A+
  ANegativo, // A-
  BPositivo, // B+
  BNegativo, // B-
  OPositivo, // O+
  ONegativo, // O-
  ABPositivo, // AB+
  ABNegativo, // AB-
}

// 1. Definición de la Clase Abstracta <Persona>
abstract class Persona {
  int id; // Identificador único
  String? cortesyTitle; // Título de cortesía opcional
  String nombre;
  String primerApellido;
  String? segundoApellido;
  String? curp; // CURP opcional
  Genero genero;
  GrupoSanguineo grupoSanguineo;
  DateTime fechaNacimiento;
  bool estaActivo;
  DateTime fechaRegistro;

  Persona({
    required id, // Parámetro opcional para el ID
    this.cortesyTitle,
    required this.nombre,
    required this.primerApellido,
    this.segundoApellido,
    this.curp,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    this.estaActivo = true,
    DateTime? fechaRegistro,
  })  : id = id, // Asigna el ID si se proporciona
        fechaRegistro = fechaRegistro ?? DateTime.now();

  @override
  String toString() {
    String estado = estaActivo ? "Activo" : "Inactivo";
    return """
      -----------------------------------
      DATOS DE LA PERSONA
      -----------------------------------
      ID: $id
      Título: ${cortesyTitle ?? 'N/A'}
      Nombre: $nombre $primerApellido ${segundoApellido ?? ''}
      CURP: ${curp ?? 'No disponible'}
      Género: ${genero.toString().split('.').last}
      Grupo Sanguíneo: ${grupoSanguineo.toString().split('.').last.replaceAll('Positivo', '+').replaceAll('Negativo', '-')}
      Fecha de nacimiento: ${fechaNacimiento.day.toString().padLeft(2, '0')}/${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}
      Estatus: $estado
      Fecha de Registro: ${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}:${fechaRegistro.second.toString().padLeft(2, '0')}
      ------------------------------------
    """;
  }
}

// 2. Definición de la Interfaz para registrar la defunción
abstract class Defuncion {
  void registrarDefuncion(); // Método abstracto para registrar defunciones
}

// 3. Clase Paciente que implementa la interfaz Defuncion
class Paciente extends Persona implements Defuncion {
  String? nss; // Número de Seguro Social, ahora opcional
  String tipoSeguro;
  EstatusVida estatusVida; // Uso del enum
  DateTime? fechaAlta;
  EstatusMedico estatusMedico;
  DateTime? fechaUltimaCita;
  DateTime? fechaActualizacion; // Nueva fecha para cambios realizados

  Paciente({
    int? id, // Agrega el parámetro id
    String? cortesyTitle,
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    String? curp,
    required Genero genero,
    required GrupoSanguineo grupoSanguineo,
    required DateTime fechaNacimiento,
    this.nss, // NSS es opcional
    required this.tipoSeguro,
    this.estatusVida = EstatusVida.Vivo, // Valor por defecto
    this.estatusMedico = EstatusMedico.Inactivo,
    this.fechaUltimaCita,
    DateTime? fechaAlta,
    DateTime? fechaRegistro,
    this.fechaActualizacion, // Solo se verá si hay cambios
    bool estaActivo = true,
  })  : fechaAlta = fechaAlta,
        super(
          id: id,
          cortesyTitle: cortesyTitle,
          nombre: nombre,
          primerApellido: primerApellido,
          segundoApellido: segundoApellido,
          curp: curp,
          genero: genero,
          grupoSanguineo: grupoSanguineo,
          fechaNacimiento: fechaNacimiento,
          estaActivo: estaActivo,
          fechaRegistro: fechaRegistro,
        );

  // Sobreescritura de propiedades
  @override
  String get nombre => super.nombre; // Propiedad sobreescrita

  set nombre(String nuevoNombre) {
    super.nombre = nuevoNombre; // Sobreescritura del setter
  }

  @override
  bool get estaActivo => super.estaActivo; // Propiedad sobreescrita

  set estaActivo(bool nuevoEstatus) {
    super.estaActivo = nuevoEstatus; // Sobreescritura del setter
  }

  @override
  String toString() {
    String actualizacion = fechaActualizacion != null
        ? """
      Fecha de Actualización: ${fechaActualizacion!.day.toString().padLeft(2, '0')}/${fechaActualizacion!.month.toString().padLeft(2, '0')}/${fechaActualizacion!.year} ${fechaActualizacion!.hour.toString().padLeft(2, '0')}:${fechaActualizacion!.minute.toString().padLeft(2, '0')}:${fechaActualizacion!.second.toString().padLeft(2, '0')}
      """
        : "No hay actualizaciones registradas";

    return super.toString() + // Sobreescritura de la Función
        """
      -----------------------------------
      DATOS DEL PACIENTE
      -----------------------------------
      NSS: ${nss ?? 'No disponible'}
      Tipo de Seguro: $tipoSeguro
      Estatus de Vida: ${estatusVida.toString().split('.').last}
      Estatus Médico: ${estatusMedico.toString().split('.').last}
      Fecha de Alta: ${fechaAlta != null ? '${fechaAlta!.day.toString().padLeft(2, '0')}/${fechaAlta!.month.toString().padLeft(2, '0')}/${fechaAlta!.year} ${fechaAlta!.hour.toString().padLeft(2, '0')}:${fechaAlta!.minute.toString().padLeft(2, '0')}:${fechaAlta!.second.toString().padLeft(2, '0')}' : 'No disponible'}
      Fecha Última Cita: ${fechaUltimaCita != null ? '${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year} ${fechaUltimaCita!.hour.toString().padLeft(2, '0')}:${fechaUltimaCita!.minute.toString().padLeft(2, '0')}:${fechaUltimaCita!.second.toString().padLeft(2, '0')}' : 'No disponible'}
      $actualizacion
      ------------------------------------
    """;
  }

  // Método privado para calcular el estatus médico
  bool _calcularEstatusMedico() {
    return (fechaAlta != null && estatusVida != EstatusVida.Finado) ||
        (nss != null);
  }

  // 4. Implementación del método de la interfaz Defuncion
  @override
  void registrarDefuncion() {
    if (estatusVida == EstatusVida.Finado) {
      print("El paciente ya está registrado como finado.");

      return; // Salimos si el paciente ya está finado
    }
    estatusMedico =
        EstatusMedico.Inactivo; // Cambia el estatus médico a Inactivo
    estatusVida = EstatusVida.Finado; // Cambia el estatus de vida a Finado
    estaActivo = false; // Cambia el estatus de la persona a Inactivo
    fechaActualizacion =
        DateTime.now(); // Registra la fecha de la actualización
  }

  // Método para actualizar datos y registrar la fecha de actualización
  void actualizarDatos({String? nuevoNombre, String? nuevoTipoSeguro}) {
    if (nuevoNombre != null) nombre = nuevoNombre;
    if (nuevoTipoSeguro != null) tipoSeguro = nuevoTipoSeguro;
    fechaActualizacion =
        DateTime.now(); // Se registra la fecha de actualización
  }
}

class GestorPacientes {
  List<Paciente> pacientes = [];

  // Método para crear un nuevo paciente
  void crearPaciente(Paciente paciente) {
    pacientes.add(paciente);
  }

  // Método para actualizar un paciente
  void actualizarPaciente(Paciente paciente) {
    // Encuentra el índice del paciente a actualizar
    int index = pacientes.indexWhere((p) => p.nss == paciente.nss);
    if (index != -1) {
      pacientes[index] = paciente; // Actualiza el paciente en la lista
    } else {
      print("Paciente no encontrado.");
    }
  }

  // Método para eliminar (inactivar) un paciente
  void eliminarPaciente(int id) {
    // Encuentra el índice del paciente a eliminar
    int index = pacientes.indexWhere((p) => p.id == id);

    if (index != -1) {
      // Obtén el paciente para actualizar su estatus
      Paciente paciente = pacientes[index];

      // Marcar como inactivo y registrar fecha de actualización
      paciente.estaActivo = false; // El paciente se inactiva
      paciente.estatusMedico = EstatusMedico.Inactivo;
      paciente.fechaActualizacion = DateTime.now(); // Fecha de actualización

      print("Paciente con ID: ${paciente.id} ha sido marcado como inactivo.");
    } else {
      print("Paciente con ID: $id no encontrado.");
    }
  }

  // Método para mostrar todos los pacientes
  void mostrarPacientes() {
    for (var paciente in pacientes) {
      print(paciente);
    }
  }
}

void main() {
  final gestor = GestorPacientes();

  // Caso de Prueba 1: Un paciente que se registra el día de hoy
  print("Caso 1: Paciente que se registra el día de hoy.");
  final paciente1 = Paciente(
    id: 1,
    nombre: "Miranda",
    primerApellido: "Lebrao",
    curp: "LEBM001009HDFRMR01", // Ejemplo de CURP
    genero: Genero.F,
    grupoSanguineo: GrupoSanguineo.BPositivo,
    fechaNacimiento: DateTime(2000, 10, 9), // Fecha de nacimiento
    nss: "1234280383034",
    tipoSeguro: "Privado",
    estatusMedico: EstatusMedico.Activo,

    estaActivo: true, // Paciente activo
    fechaAlta: DateTime.now(),
  );
  gestor.crearPaciente(paciente1);
  print(paciente1);

  // Caso de Prueba 2: Paciente nuevo que alguna vez fue trabajador del hospital
  print("Caso 2: Paciente que alguna vez fue trabajador del hospital.");
  final paciente2 = Paciente(
    id: 2,
    cortesyTitle: "Dra.",
    nombre: "Gala",
    primerApellido: "Varo",
    curp: "VARG961009HDFRGA02", // Ejemplo de CURP
    genero: Genero.F,
    grupoSanguineo: GrupoSanguineo.OPositivo,
    fechaNacimiento: DateTime(1996, 10, 9), // Fecha de nacimiento
    nss: "7538280389034",
    tipoSeguro: "Seguro Social",
    estatusMedico: EstatusMedico.Activo,
    estaActivo: true, // Paciente activo
    fechaAlta: DateTime(2024, 1, 5),
    fechaRegistro:
        DateTime(2023, 12, 1), // Fecha de registro anterior a la fecha de alta
    fechaUltimaCita: DateTime.now(),
  );
  gestor.crearPaciente(paciente2);
  print(paciente2);

  // Caso de Prueba 3: Un paciente que acaba de fallecer
  print("Caso 3: Paciente que acaba de fallecer.");
  final paciente3 = Paciente(
    id: 3,
    cortesyTitle: "Sr.", // Si no se necesita, puedes dejarlo vacío
    nombre: "RuPaul",
    primerApellido: "Charles",
    curp: "CHAR570917HDFRRP03", // Ejemplo de CURP
    genero: Genero.M,
    grupoSanguineo: GrupoSanguineo.APositivo,
    fechaNacimiento: DateTime(1957, 9, 17), // Fecha de nacimiento
    nss: "5538230389035",
    tipoSeguro: "Seguro Social",
    estaActivo: false, // Paciente fallecido
    estatusMedico: EstatusMedico.Activo,
    fechaAlta: DateTime(2023, 6, 15, 9, 15),
    fechaUltimaCita: DateTime.now(),
  );
  gestor.crearPaciente(paciente3);
  print(paciente3);

  // Ejemplo de actualización de un paciente
  print("Ejemplo de actualización de paciente.");
  print("Paciente a actualizar: $paciente1");

  paciente1.actualizarDatos(
      nuevoNombre: "Miranda Lebrao Davenport", nuevoTipoSeguro: "Público");
  print("Paciente actualizado: $paciente1");

  // finar un paciente

  print("Paciente a finar: $paciente3");

  paciente3.registrarDefuncion();
  print("Paciente finado: $paciente3");

  print(paciente3);

  // Ejemplo de eliminación de un paciente
  print("Ejemplo de eliminación de un paciente.");
  print("Paciente a eliminar: ${paciente2}");

  gestor.eliminarPaciente(2);
  print("Paciente eliminado:  ${paciente2}");
}
