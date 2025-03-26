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
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop()
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Sim"),
              onPressed: () => API.rebootSystem()
            )
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(Icons.refresh_rounded, size: 32)],
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
            children: [FadeIn(duration: 1500, startDelay: 500, child: OpalaLogo())],
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
    const gaugeSize = 300.0;

    return Stack(
      children: [
        // Texto flutuante da tensão da bateria
        Center(
          child: Text(
            "${ecuData.batteryVoltage.toStringAsFixed(2)} V",
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Digital',
            ),
          ),
        ),

        // Medidores radiais
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Linha 1: Temperatura do ar e Pressão (KPA)
              Row(
                spacing: 56,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptimizedRadialGauge(
                    title: "Temperatura admissão",
                    value: ecuData.matCelsius,
                    min: -10,
                    max: 100,
                    size: gaugeSize,
                    unit: "°C",
                  ),
                  _buildOptimizedRadialGauge(
                    title: "Pressão coletor",
                    value: ecuData.mapKpa,
                    min: 0,
                    max: 200,
                    size: gaugeSize,
                    unit: "kPa",
                  ),
                ],
              ),

              // Linha 2: Pressão (BAR) e Pressão (PSI)
              Row(
                spacing: 56,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptimizedRadialGauge(
                    title: "Pressão coletor",
                    value: ecuData.mapBar,
                    min: 0,
                    max: 2,
                    size: gaugeSize,
                    unit: "bar",
                  ),
                  _buildOptimizedRadialGauge(
                    title: "Pressão coletor",
                    value: ecuData.mapPsi,
                    min: 0,
                    max: 30,
                    size: gaugeSize,
                    unit: "psi",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptimizedRadialGauge({
    required String title,
    required double value,
    required double min,
    required double max,
    required double size,
    required String unit,
  }) {
    return RepaintBoundary(
      child: SizedBox(
        width: size,
        height: size,
        child: SfRadialGauge(
          enableLoadingAnimation: false,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: min,
              maximum: max,
              labelOffset: 25,
              showLastLabel: true,
              axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.03,
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
              axisLabelStyle: const GaugeTextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
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
                  knobStyle: const KnobStyle(knobRadius: 0.09),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    "${value.toStringAsFixed(1)} $unit",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.65,
                ),
                GaugeAnnotation(
                  widget: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.9,
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