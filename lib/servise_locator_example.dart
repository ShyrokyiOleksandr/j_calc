class Oil {
  void pour() {
    print('Oil poured');
  }
}

class EngineV8 {
  final Oil oil;

  EngineV8(this.oil);

  void start() {
    print('EngineV8 started');
  }
}

class AudiA6 {
  // <- class
  final EngineV8 engine;

  AudiA6(this.engine);

  void start() {
    engine.start();
  }
}

class AudiA8 {
  final EngineV8 engine;

  AudiA8(this.engine);

  void start() {
    engine.start();
  }
}

// Завод Ауді
// Креслення (модель) - клас - описання моделі обʼєкта
// Обʼєкт (ака екземпляр, ака інстанс) - це конкретний обʼєкт, який створений на основі креслення

final audiA6_1 = AudiA6(EngineV8(Oil()));
final audiA6_2 = AudiA6(EngineV8(Oil()));
final audiA8_1 = AudiA8(EngineV8(Oil()));

// Процес - сервіс локація
