String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu correo electrónico.';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Por favor, ingresa un correo válido.';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa una contraseña.';
  }
  final passwordRegex = RegExp(r'^.{6,}$');
  if (!passwordRegex.hasMatch(value)) {
    return 'La contraseña debe tener al menos 6 caracteres.';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, llena este campo.';
  }
  final passwordRegex = RegExp(r'^[a-zA-Z]{3,20}$');
  if (!passwordRegex.hasMatch(value)) {
    return 'El nombre debe tener de 3 a 20 caracteres';
  }
  return null;
}
