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

String? dateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, llena este campo.';
  }
  final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!dateRegex.hasMatch(value)) {
    return 'La fecha debe tener el formato dd/mm/yyyy.';
  }

  try {
    final parts = value.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    final date = DateTime(year, month, day);

    // Verifica si la fecha es válida
    if (date.year != year || date.month != month || date.day != day) {
      return 'La fecha no es válida.';
    }
  } catch (_) {
    return 'La fecha no es válida.';
  }

  return null;
}

String? moneyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, llena este campo.';
  }
  // Expresión regular para validar números enteros o decimales (con punto o coma como separador)
  final moneyRegex = RegExp(r'^\d+([.,]\d{1,2})?$');
  if (!moneyRegex.hasMatch(value)) {
    return 'Ingresa una cantidad válida. Ejemplo: 1234, 1234.56, 1234,56';
  }

  // Reemplaza la coma por un punto para trabajar con decimales si es necesario
  final sanitizedValue = value.replaceAll(',', '.');
  try {
    final amount = double.parse(sanitizedValue);
    if (amount < 0) {
      return 'La cantidad no puede ser negativa.';
    }
  } catch (_) {
    return 'Ingresa una cantidad válida.';
  }

  return null;
}
