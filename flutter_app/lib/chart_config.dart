class ChartConfig {
  final String metricName; // Ex: 'Rpm', 'Temperatura ar'
  final String metricId; // Ex: 'rpm', 'temp'
  final double minValue; // Valor mínimo
  final double maxValue; // Valor máximo
  final String unit; // Unidade de medida ('RPM', '°C')
  final int decimalPlaces; // Casas decimais (0, 1, 2)
  final double valueInterval; // Intervalo entre os valores no gráfico

  ChartConfig({
    required this.metricName,
    required this.metricId,
    required this.minValue,
    required this.maxValue,
    required this.unit,
    this.decimalPlaces = 0,
    this.valueInterval = 0.2,
  });

  // Conversão para/do Map (para shared_preferences)
  Map<String, dynamic> toMap() {
    return {
      'metricName': metricName,
      'metricId': metricId,
      'minValue': minValue,
      'maxValue': maxValue,
      'unit': unit,
      'decimalPlaces': decimalPlaces,
      'valueInterval': valueInterval,
    };
  }

  factory ChartConfig.fromMap(Map<String, dynamic> map) {
    return ChartConfig(
      metricName: map['metricName'],
      metricId: map['metricId'],
      minValue: map['minValue'],
      maxValue: map['maxValue'],
      unit: map['unit'],
      decimalPlaces: map['decimalPlaces'],
      valueInterval: map['valueInterval'],
    );
  }

  @override
  String toString() {
    return '''
      ChartConfig {
        name: $metricName,
        metric: $metricId,
        min: $minValue,
        max: $maxValue,
        unit: $unit,
        decimals: $decimalPlaces,
        valueInterval: $valueInterval
      }''';
  }
}
