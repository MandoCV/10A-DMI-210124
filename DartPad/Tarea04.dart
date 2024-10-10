// Enum para Estatus Médico
enum EstatusMedico { Vivo, Finado, Coma, Vegetativo }

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
  String nombre;
  String primerApellido;
  String? segundoApellido;
  Genero genero;
  GrupoSanguineo grupoSanguineo;
  DateTime fechaNacimiento;
  bool estaActivo;
  DateTime fechaRegistro;

  Persona({
    required this.nombre,
    required this.primerApellido,
    this.segundoApellido,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    this.estaActivo = true,
    DateTime? fechaRegistro,
  }) : fechaRegistro = fechaRegistro ?? DateTime.now();

  @override
  String toString() {
    String estado = estaActivo ? "Activo" : "Inactivo";
    return """
      -----------------------------------
      DATOS DE LA PERSONA
      -----------------------------------
      Nombre: $nombre $primerApellido ${segundoApellido ?? ''}
      Género: ${genero.toString().split('.').last}
      Grupo Sanguíneo: ${grupoSanguineo.toString().split('.').last.replaceAll('Positivo', '+').replaceAll('Negativo', '-') }
      Fecha de nacimiento: ${fechaNacimiento.day.toString().padLeft(2, '0')}/${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}
      Estatus: $estado
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
  String nss; // Número de Seguro Social
  String tipoSeguro;
  EstatusMedico estatusMedico; // Uso del enum
  DateTime? fechaAlta;
  DateTime? fechaUltimaCita;

  Paciente({
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    required Genero genero,
    required GrupoSanguineo grupoSanguineo,
    required DateTime fechaNacimiento,
    required this.nss,
    required this.tipoSeguro,
    this.estatusMedico = EstatusMedico.Vivo, // Valor por defecto
    this.fechaUltimaCita,
    DateTime? fechaAlta,
    bool estaActivo = true,
    DateTime? fechaRegistro,
  })  : fechaAlta = fechaAlta,
        super(
          nombre: nombre,
          primerApellido: primerApellido,
          segundoApellido: segundoApellido,
          genero: genero,
          grupoSanguineo: grupoSanguineo,
          fechaNacimiento: fechaNacimiento,
          estaActivo: estaActivo,
          fechaRegistro: fechaRegistro ?? DateTime.now(),
        );

  @override
  String toString() {
    return super.toString() + // Sobreescritura de la Función
        """
      -----------------------------------
      DATOS DEL PACIENTE
      -----------------------------------
      NSS: $nss
      Tipo de Seguro: $tipoSeguro
      Estatus Médico: ${estatusMedico.toString().split('.').last}
      Fecha de Alta: ${fechaAlta != null ? '${fechaAlta!.day.toString().padLeft(2, '0')}/${fechaAlta!.month.toString().padLeft(2, '0')}/${fechaAlta!.year}' : 'No disponible'}
      Fecha Última Cita: ${fechaUltimaCita != null ? '${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year}' : 'No disponible'}
      Fecha de Registro: ${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}
      ------------------------------------
    """;
  }

  // 4.Implementación del método de la interfaz Defuncion
  @override
  void registrarDefuncion() {
    estatusMedico = EstatusMedico.Finado;
    estaActivo = false; // Se considera inactivo al fallecer
  }
}

// 6. Gestor de Pacientes CRUD
class GestorPacientes {
  List<Paciente> pacientes = [];

  // Método CRUD de la Clase (crear)
  void crearPaciente(Paciente paciente) {
    pacientes.add(paciente);
  }

  // Método para mostrar pacientes
  void mostrarPacientes() {
    if (pacientes.isEmpty) {
      print('No hay pacientes registrados.');
    } else {
      pacientes.forEach((paciente) => print(paciente));
    }
  }

  // Método CRUD de la Clase (consultar)
  Paciente? consultarPaciente(String nss) {
    try {
      return pacientes.firstWhere(
        (paciente) => paciente.nss == nss,
      );
    } catch (e) {
      return null; // Si no encuentra, retorna null
    }
  }

  //  Método CRUD de la Clase (actualizar)
  void actualizarPaciente(String nss, Paciente nuevoPaciente) {
    for (var i = 0; i < pacientes.length; i++) {
      if (pacientes[i].nss == nss) {
        pacientes[i] = nuevoPaciente;
        break;
      }
    }
  }

  // Método CRUD de la Clase (eliminar)
  void eliminarPaciente(String nss) {
    pacientes.removeWhere((p) => p.nss == nss);
  }
}

// 8, 9 y 10.- CASOS Pacientes
void main() {
  final gestor = GestorPacientes();

  // Caso de Prueba 1: Un paciente que se registra el día de hoy
  print("Caso 1: Paciente que se registra el día de hoy.");
  final paciente1 = Paciente(
    nombre: "Miranda",
    primerApellido: "Lebrao",
    genero: Genero.F,
    grupoSanguineo: GrupoSanguineo.BPositivo,
    fechaNacimiento: DateTime(2000, 10, 9), // Fecha de nacimiento
    nss: "1234280383034",
    tipoSeguro: "Privado",
    fechaAlta: DateTime.now(),
    fechaRegistro: DateTime.now(),
  );
  gestor.crearPaciente(paciente1);
  print(paciente1);

  // Caso de Prueba 2: Paciente nuevo que alguna vez fue trabajador del hospital
  print("Caso 2: Paciente que alguna vez fue trabajador del hospital.");
  final paciente2 = Paciente(
    nombre: "Gala",
    primerApellido: "Varo",
    genero: Genero.F,
    grupoSanguineo: GrupoSanguineo.OPositivo,
    fechaNacimiento: DateTime(1996, 10, 9), // Fecha de nacimiento
    nss: "7538280389034",
    tipoSeguro: "Seguro Social",
    fechaAlta: DateTime(2024, 1, 5),
    fechaUltimaCita: DateTime(2024, 9, 15, 10, 0),
    fechaRegistro: DateTime(2022, 12, 5),
  );
  gestor.crearPaciente(paciente2);
  print(paciente2);

  // Caso de Prueba 3: Un paciente que acaba de fallecer
  print("Caso 3: Paciente que acaba de fallecer.");
  final paciente3 = Paciente(
    nombre: "RuPaul",
    primerApellido: "Charles",
    genero: Genero.M,
    grupoSanguineo: GrupoSanguineo.APositivo,
    fechaNacimiento: DateTime(1957, 9, 17), // Fecha de nacimiento
    nss: "5538230389035",
    tipoSeguro: "Seguro Social",
    fechaAlta: DateTime(2023, 6, 15, 9, 15),
    fechaUltimaCita: DateTime.now(),
    fechaRegistro: DateTime(2023, 5, 12),
  );
  gestor.crearPaciente(paciente3);
  paciente3.registrarDefuncion(); // Registrar defunción
  print(paciente3); // Mostrar el paciente 3

  // Caso de Prueba 4: Actualizar el nombre de un paciente
  print("Caso 4: Actualizar el nombre de un paciente.");
  String nssParaActualizar = "7538280389034"; // NSS del paciente a actualizar

  // Consultar el paciente actual
  Paciente? pacienteActual = gestor.consultarPaciente(nssParaActualizar);
  if (pacienteActual != null) {
    // Crear un nuevo paciente con el nombre actualizado
    final pacienteActualizado = Paciente(
      nombre: "Gala Altagracia", // Nuevo nombre
      primerApellido: pacienteActual.primerApellido,
      segundoApellido: pacienteActual.segundoApellido,
      genero: pacienteActual.genero,
      grupoSanguineo: pacienteActual.grupoSanguineo,
      fechaNacimiento: pacienteActual.fechaNacimiento,
      nss: pacienteActual.nss,
      tipoSeguro: pacienteActual.tipoSeguro,
      estatusMedico: pacienteActual.estatusMedico,
      fechaAlta: pacienteActual.fechaAlta,
      fechaUltimaCita: pacienteActual.fechaUltimaCita,
      fechaRegistro: pacienteActual.fechaRegistro,
    );

    // Actualizar el paciente en el gestor
    gestor.actualizarPaciente(nssParaActualizar, pacienteActualizado);

    print("Paciente actualizado:");
    print(pacienteActualizado);
  } else {
    print("Paciente no encontrado.");
  }

  // Mostrar los pacientes después de la actualización
  print("Pacientes registrados después de actualizar:");
  gestor.mostrarPacientes();

  // Caso de Prueba 5: Eliminar un paciente
  print("Caso 5: Eliminar un paciente.");
  print("Eliminar un paciente");
  print(paciente3);

  String nssParaEliminar = "5538230389035"; // Asegúrate de que el NSS sea un String


  // Eliminar el paciente
  gestor.eliminarPaciente(nssParaEliminar);

  // Mostrar los pacientes después de la eliminación
  print("Pacientes registrados después de eliminar:");
  gestor.mostrarPacientes();
}
