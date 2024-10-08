// Enum para Estatus Médico
enum EstatusMedico { Vivo, Finado, Coma, Vegetativo }

// Enum para Género
enum Genero { M, F, NB }

// Enum para Grupo Sanguíneo
enum GrupoSanguineo { APositivo, ANegativo, BPositivo, BNegativo, OPositivo, ONegativo, ABPositivo, ABNegativo }

// Clase Abstracta Persona
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
      Nombre: $nombre $primerApellido $segundoApellido
      Género: ${genero.toString().split('.').last}
      Grupo Sanguíneo: ${grupoSanguineo.toString().split('.').last}
      Fecha de nacimiento: ${fechaNacimiento.day.toString().padLeft(2, '0')}/${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}
      Estatus: $estado
      ------------------------------------
    """;
  }
}

// Clase Paciente (extiende de Persona)
class Paciente extends Persona {
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
  }) : fechaAlta = fechaAlta,
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

  void registrarDefuncion() {
    estatusMedico = EstatusMedico.Finado;
    estaActivo = false; // Se considera inactivo al fallecer
  }

  @override
  String toString() {
    return super.toString() +
        """
      -----------------------------------
      DATOS DEL PACIENTE
      -----------------------------------
      NSS: $nss
      Tipo de Seguro: $tipoSeguro
      Estatus Médico: ${estatusMedico.toString().split('.').last}
      Fecha de Alta: ${fechaAlta?.day.toString().padLeft(2, '0')}/${fechaAlta?.month.toString().padLeft(2, '0')}/${fechaAlta?.year} ${fechaAlta?.hour.toString().padLeft(2, '0')}:${fechaAlta?.minute.toString().padLeft(2, '0')}
      Fecha Última Cita: ${fechaUltimaCita != null ? '${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year}' : 'No disponible'}
      Fecha de Registro: ${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}
      ------------------------------------
    """;
  }
}

// Interfaz para Paciente 3
abstract class PacienteInterface {
  void registrarDefuncion();
  void actualizarDatos(Paciente paciente);
}

// Clase Paciente 3 (implementa PacienteInterface)
class Paciente3 implements PacienteInterface {
  String nss;
  String nombre;
  String primerApellido;
  String? segundoApellido;
  Genero genero;
  GrupoSanguineo grupoSanguineo;
  DateTime fechaNacimiento;
  EstatusMedico estatusMedico; // Uso del enum
  bool estaActivo;
  
  Paciente3({
    required this.nombre,
    required this.primerApellido,
    this.segundoApellido,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    required this.nss,
    this.estatusMedico = EstatusMedico.Vivo, // Valor por defecto
    this.estaActivo = true,
  });

  @override
  void registrarDefuncion() {
    estatusMedico = EstatusMedico.Finado;
    estaActivo = false; // Se considera inactivo al fallecer
  }

  @override
  void actualizarDatos(Paciente paciente) {
    nombre = paciente.nombre;
    primerApellido = paciente.primerApellido;
    segundoApellido = paciente.segundoApellido;
    genero = paciente.genero;
    grupoSanguineo = paciente.grupoSanguineo;
    fechaNacimiento = paciente.fechaNacimiento;
    estatusMedico = paciente.estatusMedico;
    estaActivo = paciente.estaActivo;
  }

  @override
  String toString() {
    return """
      -----------------------------------
      DATOS DEL PACIENTE 3
      -----------------------------------
      NSS: $nss
      Nombre: $nombre $primerApellido $segundoApellido
      Género: ${genero.toString().split('.').last}
      Grupo Sanguíneo: ${grupoSanguineo.toString().split('.').last}
      Fecha de Nacimiento: ${fechaNacimiento.day.toString().padLeft(2, '0')}/${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}
      Estatus de Vida: ${estatusMedico.toString().split('.').last}
      Estatus: ${estaActivo ? "Activo" : "Inactivo"}
      ------------------------------------
    """;
  }
}

// Gestor de Pacientes
class GestorPacientes {
  List<Paciente> pacientes = [];

  void crearPaciente(Paciente paciente) {
    pacientes.add(paciente);
  }

  Paciente? leerPaciente(String nss) {
    return pacientes.firstWhere((p) => p.nss == nss, orElse: () => null);
  }

  void actualizarPaciente(String nss, Paciente nuevoPaciente) {
    for (var i = 0; i < pacientes.length; i++) {
      if (pacientes[i].nss == nss) {
        pacientes[i] = nuevoPaciente;
        break;
      }
    }
  }

  void eliminarPaciente(String nss) {
    pacientes.removeWhere((p) => p.nss == nss);
  }
}

// Ejemplo de uso
void main() {
  final gestor = GestorPacientes();

  // Paciente 1
  final paciente1 = Paciente(
    nombre: "Miranda",
    primerApellido: "Lebrao",
    genero: Genero.F,
    grupoSanguineo: GrupoSanguineo.BPositivo,
    fechaNacimiento: DateTime.now().subtract(Duration(days: 24 * 365)),
    nss: "1234280383034",
    tipoSeguro: "Privado",
  );
  gestor.crearPaciente(paciente1);
  print("Paciente 1:");
  print(paciente1);

  // Paciente 2
  final paciente2 = Paciente(
    nombre: "Gala",
    primerApellido: "Varo",
    genero: Genero.F,
    grupoSanguineo: GrupoSanguineo.OPositivo,
    fechaNacimiento: DateTime.now().subtract(Duration(days: 28 * 365)),
    nss: "7538280389034",
    tipoSeguro: "Seguro Social",
  );
  gestor.crearPaciente(paciente2);
  print("\nPaciente 2:");
  print(paciente2);

  // Paciente 3
  final paciente3 = Paciente3(
    nombre: "RuPaul",
    primerApellido: "Charles",
    genero: Genero.M,
    grupoSanguineo: GrupoSanguineo.APositivo,
    fechaNacimiento: DateTime.now().subtract(Duration(days: 67 * 365)),
    nss: "5538230389035",
  );
  print("\nPaciente 3:");
  print(paciente3);
  
  // Registrar defunción para Paciente 3
  paciente3.registrarDefuncion();
  print("\nDespués de registrar defunción:");
  print(paciente3);
}
