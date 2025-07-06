import "dart:convert";
import "dart:io";
import "package:flutter/foundation.dart";
import "package:path_provider/path_provider.dart";
import "../chart_config.dart";

class PreferencesService {
  static const _chartConfigsKey = "chart_configs";
  late final File _prefsFile;
  late Map<String, dynamic> _prefsData;

  Future<void> init() async {
    try {
      final directory = kDebugMode ? (await getApplicationDocumentsDirectory()).path : "/data";
      _prefsFile = File("$directory/app_preferences.json");

      if (await _prefsFile.exists()) {
        final contents = await _prefsFile.readAsString();
        _prefsData = json.decode(contents);
      } else {
        _prefsData = {};
        await _prefsFile.writeAsString(json.encode(_prefsData));
      }
    } catch (e) {
      _prefsData = {};
    }
  }

  Future<void> _saveToFile() async {
    await _prefsFile.writeAsString(json.encode(_prefsData));
  }

  String? getString(String key) {
    return _prefsData[key] as String?;
  }

  Future<bool> setString(String key, String value) async {
    _prefsData[key] = value;
    await _saveToFile();
    return true;
  }

  Future<void> saveChartConfigs(Map<int, ChartConfig> configs) async {
    final configsMap = configs.map((key, value) => MapEntry(key.toString(), value.toMap()));
    await setString(_chartConfigsKey, json.encode(configsMap));
  }

  Map<int, ChartConfig> getChartConfigs() {
    final defaultConfigs = getDefaultConfigs();

    final jsonString = getString(_chartConfigsKey);
    if (jsonString == null) return getDefaultConfigs();

    try {
      final configsMap = Map<String, dynamic>.from(json.decode(jsonString));
      final Map<int, ChartConfig> finalConfigs = {};

      for (int i = 1; i <= 4; i++) {
        if (configsMap.containsKey(i.toString())) {
          finalConfigs[i] = ChartConfig.fromMap(configsMap[i.toString()]);
        } else {
          finalConfigs[i] = defaultConfigs[i]!;
        }
      }

      return finalConfigs;
    } catch (e) {
      return defaultConfigs;
    }
  }

  Map<int, ChartConfig> getDefaultConfigs() {
    return {
      1: ChartConfig(
        chartType: "RADIAL",
        metricName: "Pressão coletor",
        metricId: "pressaoColetor",
        minValue: 0,
        maxValue: 2,
        unit: "bar",
        decimalPlaces: 2,
        valueInterval: 0.2,
      ),
      2: ChartConfig(
        chartType: "RADIAL",
        metricName: "Rpm",
        metricId: "rpm",
        minValue: 0,
        maxValue: 6,
        unit: "rpm",
        valueInterval: 1,
      ),
      3: ChartConfig(
        chartType: "RADIAL",
        metricName: "Temp. admissão",
        metricId: "tempArColetor",
        minValue: -10,
        maxValue: 100,
        unit: "°C",
        valueInterval: 10,
      ),
      4: ChartConfig(
        chartType: "RADIAL",
        metricName: "Tensão",
        metricId: "tensaoBateria",
        minValue: 8,
        maxValue: 15,
        unit: "V",
        decimalPlaces: 2,
        valueInterval: 1,
      ),
    };
  }
}
