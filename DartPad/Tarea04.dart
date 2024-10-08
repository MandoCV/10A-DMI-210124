// Clase Abstracta Persona
abstract class Persona {
  String nombre;
  String primerApellido;
  String? segundoApellido;
  String genero;
  String grupoSanguineo;
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
      Género: $genero
      Grupo Sanguíneo: $grupoSanguineo
      Fecha de nacimiento: ${fechaNacimiento.day.toString().padLeft(2, '0')}/${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}
      Estatus: $estado
      ------------------------------------
    """;
  }
}

// Clase Paciente
class Paciente extends Persona {
  String nss; // Número de Seguro Social
  String tipoSeguro;
  String estatusVida; // Ejemplo: "Vivo" o "Fallecido"
  String estatusMedico; // Ejemplo: "Activo" o "Inactivo"
  DateTime? fechaAlta;
  DateTime? fechaUltimaCita;

  Paciente({
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    required String genero,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
    required this.nss,
    required this.tipoSeguro,
    this.estatusVida = "Vivo",
    this.estatusMedico = "Activo",
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
          fechaRegistro: fechaRegistro ?? DateTime.now(), // Asegura que la fecha de registro sea correcta
        );

  void registrarDefuncion() {
    estatusVida = "Fallecido";
    estaActivo = false; // Se considera inactivo al fallecer
    estatusMedico = "Inactivo"; // Actualiza el estatus médico al fallecer
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
      Estatus de Vida: $estatusVida
      Estatus Médico: $estatusMedico
      Fecha de Alta: ${fechaAlta?.day.toString().padLeft(2, '0')}/${fechaAlta?.month.toString().padLeft(2, '0')}/${fechaAlta?.year} ${fechaAlta?.hour.toString().padLeft(2, '0')}:${fechaAlta?.minute.toString().padLeft(2, '0')}
      Fecha Última Cita: ${fechaUltimaCita != null ? '${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year}' : 'No disponible'}
      Fecha de Registro: ${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}
      ------------------------------------
    """;
  }
}

// Ejemplo de uso (Casos de prueba)
void main() {
  // Caso 1: Paciente registrado hoy y dado de alta el mismo día
  final pacienteNuevo = Paciente(
    nombre: "Miranda",
    primerApellido: "Lebrao",
    genero: "Mujer",
    grupoSanguineo: "B+",
    fechaNacimiento: DateTime.now().subtract(Duration(days: 24 * 365)), // 24 años
    nss: "1234280383034",
    tipoSeguro: "Privado",
    fechaAlta: DateTime.now(), // Fecha de alta como paciente
    fechaRegistro: DateTime.now(), // Fecha de registro igual a la fecha de alta
  );

  print("Caso 1: Paciente nuevo");
  print(pacienteNuevo);

  // Caso 2: Paciente ya registrado antes de su alta
  final pacienteExistente = Paciente(
    nombre: "Gala",
    primerApellido: "Varo",
    genero: "Mujer",
    grupoSanguineo: "O+",
    fechaNacimiento: DateTime.now().subtract(Duration(days: 28 * 365)), // 28 años
    nss: "7538280389034",
    tipoSeguro: "Seguro Social",
    fechaAlta: DateTime(2024, 1, 5), // Fecha de alta como paciente
    fechaUltimaCita: DateTime(2024, 9, 15, 10, 0), // Fecha de última cita
    estaActivo: true,
    fechaRegistro:
        DateTime(2020, 9, 12), // Fecha de registro anterior a la fecha de alta
  );

  print("\nCaso 2: Paciente ya registrado");
  print(pacienteExistente);

  // Caso 3: Paciente que acaba de fallecer
  final pacienteFallecido = Paciente(
    nombre: "RuPaul",
    primerApellido: "Charles",
    genero: "Hombre",
    grupoSanguineo: "A+",
    fechaNacimiento: DateTime.now().subtract(Duration(days: 67 * 365)), // 67 años
    nss: "5538230389035",
    tipoSeguro: "IMSS",
    fechaAlta: DateTime(2023, 6, 15, 9, 15), // Fecha de alta como paciente
    fechaUltimaCita: null, // No disponible
    estaActivo: false,
    fechaRegistro:
        DateTime(2020, 9, 12), // Fecha de registro anterior a la fecha de alta
  );

  // Registrar defunción
  pacienteFallecido.registrarDefuncion();

  print("\nCaso 3: Paciente fallecido");
  print(pacienteFallecido);
}
