class ChartConfig {
  late String chartType; // Ex: 'RADIAL', 'MINMAX'
  late String metricName; // Ex: 'Rpm', 'Temperatura ar'
  late String metricId; // Ex: 'rpm', 'temp'
  late double? minValue; // Valor mínimo
  late double? maxValue; // Valor máximo
  late String unit; // Unidade de medida ('RPM', '°C')
  late int decimalPlaces; // Casas decimais (0, 1, 2)
  late double valueInterval; // Intervalo entre os valores no gráfico

  ChartConfig({
    required this.chartType,
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
      "chartType": chartType,
      "metricName": metricName,
      "metricId": metricId,
      "minValue": minValue,
      "maxValue": maxValue,
      "unit": unit,
      "decimalPlaces": decimalPlaces,
      "valueInterval": valueInterval,
    };
  }

  factory ChartConfig.fromMap(Map<String, dynamic> map) {
    return ChartConfig(
      chartType: map["chartType"],
      metricName: map["metricName"],
      metricId: map["metricId"],
      minValue: map["minValue"],
      maxValue: map["maxValue"],
      unit: map["unit"],
      decimalPlaces: map["decimalPlaces"],
      valueInterval: map["valueInterval"],
    );
  }

  @override
  String toString() {
    return '''
      ChartConfig {
        chartType: $chartType,
        name: $metricName,
        metric: $metricId,
        min: $minValue,
        max: $maxValue,
        unit: $unit,
        decimals: $decimalPlaces,
        valueInterval: $valueInterval
      }''';
  }

  ChartConfig copyWith({
    String? chartType,
    String? metricName,
    String? metricId,
    double? minValue,
    double? maxValue,
    String? unit,
    int? decimalPlaces,
    double? valueInterval,
  }) {
    return ChartConfig(
      chartType: chartType ?? this.chartType,
      metricName: metricName ?? this.metricName,
      metricId: metricId ?? this.metricId,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      unit: unit ?? this.unit,
      decimalPlaces: decimalPlaces ?? this.decimalPlaces,
      valueInterval: valueInterval ?? this.valueInterval,
    );
  }
}
