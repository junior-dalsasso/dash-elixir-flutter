import 'package:flutter/material.dart';
import 'package:flutter_app/chart_config.dart';
import 'package:flutter_app/chart_settings_modal.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:flutter_app/preferences_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class EcuDataMainView extends StatefulWidget {
  final EcuData ecuData;
  final double gaugeSize;
  final PreferencesService preferencesService;

  const EcuDataMainView({
    super.key,
    required this.ecuData,
    required this.preferencesService,
    this.gaugeSize = 240.0,
  });

  @override
  State<EcuDataMainView> createState() => _EcuDataMainViewState();
}

class _EcuDataMainViewState extends State<EcuDataMainView> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await widget.preferencesService.init();
    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) return const CircularProgressIndicator();

    final chartConfigs = widget.preferencesService.getChartConfigs();

    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              for (int row = 0; row <= 1; row++)
                Row(
                  spacing: 36,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int column = row * 2 + 1; column <= row * 2 + 2; column++)
                      _buildGauge(chartConfigs: chartConfigs[column]!, context: context, chartId: column)
                  ],
                ),
            ],
          ),
          SizedBox(width: 120, height: 120, child: SvgPicture.asset("images/D6_logo.svg")),
        ],
      ),
    );
  }

  Widget _buildGauge({
    required ChartConfig chartConfigs,
    required BuildContext context,
    required int chartId,
  }) {
    if (chartConfigs.chartType == "RADIAL") {
      return _buildRadialGauge(chartConfigs: chartConfigs, context: context, chartId: chartId);
    } else {
      return _buildMinMaxGauge(chartConfigs: chartConfigs, context: context, chartId: chartId);
    }
  }

  Widget _buildRadialGauge({required ChartConfig chartConfigs, required BuildContext context, required int chartId}) {
    double value = widget.ecuData.getField(widget.ecuData.getTagNumber(chartConfigs.metricId) ?? 1);
    List<GaugeAnnotation> annotations = [];
    double minValue = chartConfigs.minValue ?? 0;
    double maxValue = chartConfigs.maxValue ?? 0;
    if (minValue > maxValue) minValue = maxValue - 1;

    for (double i = minValue; i <= maxValue; i += chartConfigs.valueInterval) {
      final decimalFixed = chartConfigs.decimalPlaces > 2 ? 2 : chartConfigs.decimalPlaces;

      annotations.add(
        GaugeAnnotation(
          widget: Text(
            i.toStringAsFixed(decimalFixed == 1 ? 0 : decimalFixed),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          ),
          angle: ((i - minValue) / (maxValue - minValue) * 276) - 228,
          positionFactor: 0.75,
        ),
      );
    }

    return RepaintBoundary(
      child: Stack(
        children: [
          SizedBox(
            width: widget.gaugeSize,
            height: widget.gaugeSize,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: minValue,
                  maximum: maxValue,
                  interval: chartConfigs.valueInterval,
                  showLabels: false,
                  axisLineStyle: const AxisLineStyle(
                    thicknessUnit: GaugeSizeUnit.factor,
                    thickness: 0.06,
                  ),
                  majorTickStyle: const MajorTickStyle(
                    length: 6,
                    thickness: 4,
                    color: Colors.white,
                  ),
                  minorTickStyle: const MinorTickStyle(
                    length: 3,
                    thickness: 3,
                    color: Colors.white,
                  ),
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: value,
                      needleLength: 0.95,
                      enableAnimation: true,
                      animationDuration: 300,
                      animationType: AnimationType.ease,
                      needleStartWidth: 1.5,
                      needleEndWidth: 6,
                      needleColor: Colors.red,
                      knobStyle: const KnobStyle(knobRadius: 0.1),
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    ...annotations,
                    GaugeAnnotation(
                      widget: Text(
                        "${value.toStringAsFixed(chartConfigs.decimalPlaces > 2 ? 2 : chartConfigs.decimalPlaces)} ${chartConfigs.unit}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.76,
                    ),
                    GaugeAnnotation(
                      widget: Text(
                        chartConfigs.metricName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.95,
                    ),
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: minValue,
                      endValue: maxValue,
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.03,
                      endWidth: 0.03,
                      gradient: const SweepGradient(
                        colors: <Color>[Colors.green, Colors.yellow, Colors.red],
                        stops: <double>[0.0, 0.5, 1.0],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: chartId.isOdd ? 0 : null,
            right: chartId.isEven ? 0 : null,
            child: IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 24,
              onPressed: () => _showChartSettings(context, chartId, chartConfigs),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMinMaxGauge({required ChartConfig chartConfigs, required BuildContext context, required int chartId}) {
    double value = widget.ecuData.getField(widget.ecuData.getTagNumber(chartConfigs.metricId) ?? 1);
    final int decimalPlaces = chartConfigs.decimalPlaces > 2 ? 2 : chartConfigs.decimalPlaces;

    bool changed = false;

    if (widget.ecuData.connected) {
      if (chartConfigs.maxValue == null || value > chartConfigs.maxValue!) {
        chartConfigs.maxValue = value;
        changed = true;
      }

      if (chartConfigs.minValue == null || value < chartConfigs.minValue!) {
        chartConfigs.minValue = value;
        changed = true;
      }

      if (changed) {
        final configs = widget.preferencesService.getChartConfigs();
        configs[chartId] = chartConfigs;
        widget.preferencesService.saveChartConfigs(configs);
      }
    }

    String formattedValue(double val) => "${val.toStringAsFixed(decimalPlaces)} ${chartConfigs.unit}";

    return RepaintBoundary(
      child: Stack(
        children: [
          SizedBox(
            width: widget.gaugeSize,
            height: widget.gaugeSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  formattedValue(chartConfigs.maxValue ?? 0),
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 32, color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Text(
                  formattedValue(value),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
                Text(
                  formattedValue(chartConfigs.minValue ?? 0),
                  style: const TextStyle(fontSize: 32, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  chartConfigs.metricName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            left: chartId.isOdd ? 46 : null,
            right: chartId.isEven ? 46 : null,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              iconSize: 24,
              onPressed: () => _restartMinMaxGauge(chartId, chartConfigs),
            ),
          ),
          Positioned(
            left: chartId.isOdd ? 0 : null,
            right: chartId.isEven ? 0 : null,
            child: IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 24,
              onPressed: () => _showChartSettings(context, chartId, chartConfigs),
            ),
          ),
        ],
      ),
    );
  }

  void _showChartSettings(BuildContext context, int chartId, ChartConfig config) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      builder: (context) {
        return ChartSettingsModal(
          chartId: chartId,
          config: config,
          preferencesService: widget.preferencesService,
        );
      },
    );
  }

  void _restartMinMaxGauge(int chartId, ChartConfig chartConfigs) {
    chartConfigs.maxValue = null;
    chartConfigs.minValue = null;

    final configs = widget.preferencesService.getChartConfigs();
    configs[chartId] = chartConfigs;
    widget.preferencesService.saveChartConfigs(configs);
  }
}
