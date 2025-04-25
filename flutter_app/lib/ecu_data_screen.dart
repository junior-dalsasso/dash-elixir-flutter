import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:flutter_app/opala_logo.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_app/fade_in.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EcuDataScreen extends StatelessWidget {
  const EcuDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _intro(),
        FadeIn(
          duration: 1500,
          startDelay: 3000,
          child: Scaffold(
            body: StreamBuilder<EcuData>(
              stream: API.streamEcuData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) return const Center(child: Text("Erro na conexão"));

                return _buildPage(snapshot.data, context);
              },
            ),
          ),
        ),
      ],
    );
  }

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
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Sim"),
              onPressed: () => API.rebootSystem(),
            )
          ],
        );
      },
    );
  }

  Color _getBatteryColor(double value) {
    if (value > 13) return Colors.green;
    if (value > 12.2) return Colors.blue;
    return Colors.red;
  }

  Color _getRpmColor(double value) {
    if (value > 4000) return Colors.red;
    if (value > 2000) return Colors.blue;
    return Colors.green;
  }

  Color _getTempColor(double value) {
    if (value > 90) return Colors.red;
    if (value > 40) return Colors.green;
    return Colors.blue;
  }

  Color _getTpsColor(double value) {
    if (value > 80) return Colors.red;
    if (value > 40) return Colors.blue;
    return Colors.green;
  }

  Icon _getRpiBatteryColorAndIcon(double value) {
    if (value > 99) return const Icon(Icons.battery_full_rounded, color: Colors.green);
    if (value > 80) return const Icon(Icons.battery_6_bar_rounded, color: Colors.green);
    if (value > 70) return const Icon(Icons.battery_5_bar_rounded, color: Colors.blue);
    if (value > 50) return const Icon(Icons.battery_4_bar_rounded, color: Colors.blue);
    if (value > 35) return const Icon(Icons.battery_3_bar_rounded, color: Colors.red);
    if (value > 20) return const Icon(Icons.battery_2_bar_rounded, color: Colors.red);
    if (value > 10) return const Icon(Icons.battery_1_bar_rounded, color: Colors.red);

    return const Icon(Icons.battery_0_bar_rounded, color: Colors.red);
  }

  Icon _getRpiConnectionColorAndIcon(bool value) {
    return value
      ? const Icon(Icons.signal_wifi_4_bar, color: Colors.green)
      : const Icon(Icons.signal_wifi_connected_no_internet_4_rounded, color: Colors.red);
  }

  Widget _intro() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [FadeIn(duration: 1500, startDelay: 500, child: OpalaLogo())],
    );
  }

  Widget _buildPage(EcuData? ecuData, BuildContext context) {
    const gaugeSize = 240.0;
    DateTime now = DateTime.now().subtract(const Duration(hours: 3));

    ecuData ??= EcuData();

    return Row(
      children: [
        // Sidebar
        Container(
          color: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat("HH:mm:ss").format(now),
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("dd/MM/yyyy").format(now),
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.electric_car, color: _getBatteryColor(ecuData.batteryVoltage)),
                        const SizedBox(width: 8),
                        Text(
                          "${ecuData.batteryVoltage.toStringAsFixed(2)} V",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.speed, color: _getRpmColor(ecuData.rpm)),
                        const SizedBox(width: 8),
                        Text(
                          "${ecuData.rpm.toInt()} RPM",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.thermostat, color: _getTempColor(ecuData.coolant)),
                        const SizedBox(width: 8),
                        Text(
                          "${ecuData.coolant.toStringAsFixed(2)} °C",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.airlines_outlined, color: _getTpsColor(ecuData.tps)),
                        const SizedBox(width: 8),
                        Text(
                          "${ecuData.tps > 100 ? 100 : ecuData.tps.toInt()} %",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _getRpiBatteryColorAndIcon(ecuData.rpiBatteryPerc),
                        const SizedBox(width: 8),
                        Text(
                          "${ecuData.rpiBatteryPerc.toInt()} %",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _getRpiConnectionColorAndIcon(ecuData.connected),
                        const SizedBox(width: 8),
                        Text(
                          ecuData.connected ? "Conectado" : "Desconectado",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () => showRebootConfirm(context),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text("Reiniciar", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(180, 50)),
                ),
              ],
            ),
          ),
        ),
        // Main content
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Row(
                    spacing: 36,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRadialGauge(
                        title: "Temp. admissão",
                        value: ecuData.matCelsius,
                        min: -10,
                        max: 100,
                        size: gaugeSize,
                        unit: "°C",
                        interval: 10,
                      ),
                      _buildRadialGauge(
                        title: "Pressão coletor",
                        value: ecuData.mapKpa,
                        min: 0,
                        max: 200,
                        size: gaugeSize,
                        unit: "kPa",
                        interval: 20,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 36,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRadialGauge(
                          title: "Pressão coletor",
                          value: ecuData.mapBar,
                          min: 0,
                          max: 2,
                          size: gaugeSize,
                          unit: "bar",
                          interval: 0.2,
                          decimals: 2),
                      _buildRadialGauge(
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
              SizedBox(
                width: 120,
                height: 120,
                child: SvgPicture.asset("images/D6_logo.svg"),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRadialGauge(
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
          widget: Text(
            i.toStringAsFixed(decimals == 1 ? 0 : decimals),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
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
