class ImcModel {
  final double altura;
  final double peso;
  final double imc;
  final String categoria;

  ImcModel({
    required this.altura,
    required this.peso,
    required this.imc,
    required this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'peso': peso,
      'altura': altura,
      'imc': imc,
      'categoria': categoria,
    };
  }
}
