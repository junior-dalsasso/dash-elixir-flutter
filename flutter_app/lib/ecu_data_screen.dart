import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:flutter_app/loader.dart';
import 'package:flutter_app/opala_logo.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_app/fade_in.dart';

class EcuDataScreen extends StatelessWidget {
  const EcuDataScreen({super.key});

  void showRebootConfirm(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Deseja reiniciar o dispositivo?"),
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge),
                    child: const Text("Cancelar"),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge),
                    child: const Text("Sim"),
                    onPressed: () => API.rebootSystem())
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FadeIn(
        duration: 1500,
        startDelay: 3000,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => showRebootConfirm(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.refresh_rounded, size: 32)],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeIn(duration: 1500, startDelay: 500, child: OpalaLogo())
            ],
          ),
          FadeIn(
            duration: 1500,
            startDelay: 3000,
            child: Container(
              color: ThemeData.dark().scaffoldBackgroundColor,
              child: StreamBuilder<EcuData>(
                stream: API.streamEcuData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Loader());
                  }

                  final ecuData = snapshot.data!;
                  return _buildGauges(ecuData);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGauges(EcuData ecuData) {
    const gaugeSize = 240.0;

    return Stack(
      children: [
        Center(
          child: Text(
            "${ecuData.batteryVoltage.toStringAsFixed(2)} V",
            style: const TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                spacing: 110,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptimizedRadialGauge(
                      title: "Temp. admissão",
                      value: ecuData.matCelsius,
                      min: -10,
                      max: 100,
                      size: gaugeSize,
                      unit: "°C",
                      interval: 10),
                  _buildOptimizedRadialGauge(
                      title: "Pressão coletor",
                      value: ecuData.mapKpa,
                      min: 0,
                      max: 200,
                      size: gaugeSize,
                      unit: "kPa",
                      interval: 20),
                ],
              ),
              Row(
                spacing: 110,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptimizedRadialGauge(
                      title: "Pressão coletor",
                      value: ecuData.mapBar,
                      min: 0,
                      max: 2,
                      size: gaugeSize,
                      unit: "bar",
                      interval: 0.2,
                      decimals: 2),
                  _buildOptimizedRadialGauge(
                      title: "Pressão coletor",
                      value: ecuData.mapPsi,
                      min: 0,
                      max: 30,
                      size: gaugeSize,
                      unit: "psi",
                      interval: 5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptimizedRadialGauge(
      {required String title,
      required double value,
      required double min,
      required double max,
      required double size,
      required String unit,
      required double interval,
      int decimals = 1}) {
    List<GaugeAnnotation> annotations = [];

    for (double i = min; i <= max; i += interval) {
      annotations.add(
        GaugeAnnotation(
          widget: Text(i.toStringAsFixed(decimals == 1 ? 0 : decimals), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          ),
          angle: ((i - min) / (max - min) * 276) - 228,
          positionFactor: 0.75,
        ),
      );
    }

    return RepaintBoundary(
      child: SizedBox(
        width: size,
        height: size,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: min,
              maximum: max,
              interval: interval,
              showLabels: false,
              // showLastLabel: true,
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
              // axisLabelStyle: const GaugeTextStyle(
              //   fontWeight: FontWeight.bold,
              //   fontSize: 14,
              // ),
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
                    "${value.toStringAsFixed(decimals)} $unit",
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
                    title,
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
                  startValue: min,
                  endValue: max,
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
    );
  }
}
