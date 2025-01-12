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
  final passwordRegex = RegExp(r'^.{4,}$');
  if (!passwordRegex.hasMatch(value)) {
    return 'La contraseña debe tener al menos 4 caracteres.';
  }
  return null;
}
