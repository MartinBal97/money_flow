class LevelSystem {
  final int xp;

  LevelSystem(this.xp);

  int get level => _calculateLevel();

  int _calculateLevel() {
    // Fórmula de progresión: cada nivel requiere 100 XP más
    return (xp / 100).floor() + 1;
  }

  int xpToNextLevel() {
    int currentLevel = level;
    int requiredXp = currentLevel * 100; // XP necesaria para el próximo nivel
    return requiredXp - xp; // Cuánta XP falta
  }
}
