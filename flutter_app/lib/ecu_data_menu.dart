import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:flutter_app/rpi_connection_btn.dart';
import 'package:intl/intl.dart';

class EcuDataMenu extends StatefulWidget {
  final EcuData ecuData;
  final ConsumptionData consData;

  const EcuDataMenu({super.key, required this.ecuData, required this.consData});

  @override
  State<EcuDataMenu> createState() => _EcuDataMenuState();
}

class _EcuDataMenuState extends State<EcuDataMenu> {
  final DateTime now = DateTime.now();
  bool isShowingHodometer = true;

  final ValueNotifier<EcuData?> ecuDataNotifier = ValueNotifier(null);

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

  void resetValuesConfirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Limpar informações ${isShowingHodometer ? "do hodômetro?" : "da viagem?"}"),
          content: const Text("Tem certeza que deseja limpar as informações de quilometragem e consumo?"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Sim"),
              onPressed: () =>
                  {isShowingHodometer ? API.resetHodometer() : API.resetTrip(), Navigator.of(context).pop()},
            )
          ],
        );
      },
    );
  }

  void calibrateModal(BuildContext context) {
    late bool localIsCalibrating = false;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mantenha 40 km/h${localIsCalibrating ? "" : " e confirme no botão"}",
                            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 26),
                          ElevatedButton.icon(
                            onPressed: () => {
                              setModalState(() => localIsCalibrating = true),
                              API.startCalibration(),
                              Timer(const Duration(seconds: 2), () {
                                setModalState(() => localIsCalibrating = false);
                                Navigator.pop(context);
                              }),
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey[800],
                              minimumSize: const Size(440, 180),
                            ),
                            label: localIsCalibrating
                                ? const SizedBox(height: 120.0, width: 120.0, child: CircularProgressIndicator())
                                : const Text("Calibrar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 56)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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

  Color _getSpeedColor(double value) {
    if (value > 80) return Colors.red;
    if (value > 40) return Colors.green;
    return Colors.blue;
  }

  String getMotorStatus() {
    if (widget.ecuData.statusMotor.motorEmPartida) return "Motor em partida";
    if (widget.ecuData.statusMotor.cicloAquecimento) return "Motor aquecendo";
    if (widget.ecuData.statusMotor.motorPronto) return "Motor ligado";

    return "";
  }

  String getMotorActions() {
    if (widget.ecuData.largPulsoBancada1 == 0 && widget.ecuData.rpm > 500) return "Cut off ativo";

    return "";
  }

  Map<String, dynamic> ecuDataToMap(StreamData data) {
    return {
      "Segundos ECU ligada": data.ecuData.segundosMotorLigado,
      "Largura pulso bancada 01": data.ecuData.largPulsoBancada1,
      "Largura pulso bancada 02": data.ecuData.largPulsoBancada2,
      "RPM": data.ecuData.rpm,
      "Avanço ignição": data.ecuData.avancoIgnicao,
      "AFR alvo bancada 01": data.ecuData.afrAlvoBancada1,
      "AFR alvo bancada 02": data.ecuData.afrAlvoBancada2,
      "Pressão coletor": data.ecuData.pressaoColetor,
      "Temperatura ar coletor": data.ecuData.tempArColetor,
      "Temperatura água": data.ecuData.tempAgua,
      "TPS": data.ecuData.tps,
      "Tensão bateria": data.ecuData.tensaoBateria,
      "Sonda banco 01": data.ecuData.sondaBanco1,
      "Sonda banco 02": data.ecuData.sondaBanco2,
      "Correção banco 01": data.ecuData.correcaoBanco1,
      "Correção banco 02": data.ecuData.correcaoBanco2,
      "Correção ar": data.ecuData.correcaoAr,
      "Correção aquecimento": data.ecuData.correcaoAquecimento,
      "Correção rápida": data.ecuData.correcaoRapida,
      "Cutoff TPS": data.ecuData.cutoffTps,
      "Correção combustível baro": data.ecuData.correcaoCombsBaro,
      "Correção combustível total": data.ecuData.correcaoCombsTotal,
      "Valor VE bancada 01": data.ecuData.valorVeBancada1,
      "Valor VE bancada 02": data.ecuData.valorVeBancada2,
      "Controle marcha lenta": data.ecuData.controleMarchaLenta,
      "Avanço ignição frio": data.ecuData.avancoIgnicaoFrio,
      "TPS variação": data.ecuData.tpsVariacao,
      "MAP variação": data.ecuData.mapVariacao,
      "Dwell": data.ecuData.dwell,
      "Carga combustível": data.ecuData.cargaCombustivel,
      // 'Atualizações Amc': data.atualizacoesAmc,
      // 'kpaixNaoUsado': data.kpaixNaoUsado,
      // 'leituraTpsAdc': data.leituraTpsAdc,
      // 'cargaCombustivelAlg2': data.cargaCombustivelAlg2,
      // 'cargaIgnicaoAlg1': data.cargaIgnicaoAlg1,
      // 'cargaIgnicaoAlg2': data.cargaIgnicaoAlg2,
      // 'Contador sincronismo': data.contadorSincronismo,
      // 'Erro tempo ignição %': data.erroTempoIgnicaoPct,
      // 'tempoEntrePulsosUs': data.tempoEntrePulsosUs,
      // 'combustivelParedeUs': data.combustivelParedeUs,
      "Entrada analógica 0": data.ecuData.entradaAnalogica0,
      "Entrada analógica 1": data.ecuData.entradaAnalogica1,
      "Entrada analógica 2": data.ecuData.entradaAnalogica2,
      // 'connected': data.connected,
      "Motor pronto": data.ecuData.statusMotor.motorPronto,
      "Motor dando partida": data.ecuData.statusMotor.motorEmPartida,
      "Motor partida com enriquecimento": data.ecuData.statusMotor.enriquecimentoPartida,
      "Motor aquecendo": data.ecuData.statusMotor.cicloAquecimento,
      "Hodômetro": data.consumptionData.hodometer.toStringAsFixed(2),
      "Consumo total": data.consumptionData.hodometerConsumed.toStringAsFixed(2),
      "Consumo médio total": data.consumptionData.hodometerFuelByDistance.toStringAsFixed(2),
      "Viagem": data.consumptionData.trip.toStringAsFixed(2),
      "Consumo viagem": data.consumptionData.tripConsumed.toStringAsFixed(2),
      "Consumo médio viagem": data.consumptionData.tripFuelByDistance.toStringAsFixed(2),
      "Velocidade atual": data.consumptionData.currentSpeed.toStringAsFixed(2),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat("HH:mm:ss").format(now),
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    RpiConnectionBtn(isConnected: widget.ecuData.connected, context: context)
                  ],
                ),
                Text(
                  DateFormat("dd/MM/yyyy").format(now),
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 0.5),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Icon(Icons.electric_car, color: _getBatteryColor(widget.ecuData.tensaoBateria)),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.ecuData.tensaoBateria.toStringAsFixed(2)} V",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.speed, color: _getRpmColor(widget.ecuData.rpm)),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.ecuData.rpm.toInt()} RPM",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.thermostat, color: _getTempColor(widget.ecuData.tempAgua)),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.ecuData.tempAgua.toStringAsFixed(2)} °C",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.rocket_launch, color: _getSpeedColor(widget.consData.currentSpeed)),
                    const SizedBox(width: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.consData.currentSpeed.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(" km/h", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.9)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(isShowingHodometer ? Icons.directions_car : Icons.sports_score, color: Colors.blue),
                    const SizedBox(width: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (isShowingHodometer
                              ? widget.consData.hodometer.toInt().toString()
                              : widget.consData.trip.toStringAsFixed(2)),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(" km", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.9)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(isShowingHodometer ? Icons.local_gas_station : Icons.local_gas_station_outlined,
                        color: Colors.red),
                    const SizedBox(width: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (isShowingHodometer
                                  ? widget.consData.hodometerFuelByDistance
                                  : widget.consData.tripFuelByDistance)
                              .toStringAsFixed(1),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(" km/L", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.9)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => isShowingHodometer = !isShowingHodometer),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(50, 50), padding: EdgeInsets.zero),
                      child: const Icon(Icons.swap_horiz, size: 22),
                    ),
                    ElevatedButton(
                      onPressed: () => calibrateModal(context),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(50, 50), padding: EdgeInsets.zero),
                      child: const Icon(Icons.tune, size: 22),
                    ),
                    ElevatedButton(
                      onPressed: () => resetValuesConfirm(context),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(50, 50), padding: EdgeInsets.zero),
                      child: const Icon(Icons.cleaning_services, size: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                if (getMotorStatus().isNotEmpty) ...[
                  Center(
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
                      padding: const EdgeInsets.all(1),
                      label: Text(getMotorStatus()),
                      labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
                const SizedBox(height: 6),
                if (getMotorActions().isNotEmpty) ...[
                  Center(
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
                      padding: const EdgeInsets.all(1),
                      label: Text(getMotorActions()),
                      labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ]
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return StreamBuilder<StreamData>(
                          stream: API.streamData(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const CircularProgressIndicator();

                            final mappedData = ecuDataToMap(snapshot.data ?? StreamData());

                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.9,
                              builder: (context, scrollController) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Dados da ECU",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close, color: Colors.white),
                                            onPressed: () => Navigator.pop(context),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Expanded(
                                        child: ListView.separated(
                                          controller: scrollController,
                                          itemCount: mappedData.length,
                                          separatorBuilder: (_, __) => const Divider(color: Colors.white24),
                                          itemBuilder: (context, index) {
                                            final entry = mappedData.entries.elementAt(index);
                                            return Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    entry.key,
                                                    style: const TextStyle(
                                                      color: Colors.white70,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Flexible(
                                                  child: Text(
                                                    entry.value.toString(),
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(minimumSize: const Size(70, 50), padding: EdgeInsets.zero),
                  child: const Icon(Icons.remove_red_eye, size: 30),
                ),
                ElevatedButton(
                  onPressed: () => showRebootConfirm(context),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(70, 50), padding: EdgeInsets.zero),
                  child: const Icon(Icons.refresh_rounded, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
