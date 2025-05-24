import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:intl/intl.dart';

class EcuDataMenu extends StatelessWidget {
  final EcuData ecuData;
  final DateTime now = DateTime.now();

  EcuDataMenu({super.key, required this.ecuData});

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

  Icon _getRpiConnectionColorAndIcon(bool value) {
    return value
        ? const Icon(Icons.bluetooth_connected, color: Colors.green, size: 32)
        : const Icon(Icons.bluetooth_disabled, color: Colors.red, size: 32);
  }

  String getMotorStatus() {
    if (ecuData.statusMotor.motorEmFuncionamento) return "Em funcionamento";
    if (ecuData.statusMotor.aquecendo) return "Motor aquecendo";

    return "Motor parado";
  }

  String getMotorActions() {
    // 'Motor sincronismo Ok': data.statusMotor.sincronismoOk,

    if (ecuData.statusMotor.corteCombustivelAtivo) return "Cut off ativo";
    if (ecuData.statusMotor.ignicaoAtiva) return "Ignição ativa";
    if (ecuData.statusMotor.erroDetectado) return "Erro detectado";
    if (ecuData.statusMotor.injetandoCombustivel) return "Injetando";

    return "";
  }

  Map<String, dynamic> ecuDataToMap(EcuData data) {
    return {
      'Segundos ECU ligada': data.segundosMotorLigado,
      'Largura pulso bancada 01': data.largPulsoBancada1,
      'Largura pulso bancada 02': data.largPulsoBancada2,
      'RPM': data.rpm,
      'Avanço ignição': data.avancoIgnicao,
      'AFR alvo bancada 01': data.afrAlvoBancada1,
      'AFR alvo bancada 02': data.afrAlvoBancada2,
      'Pressão coletor': data.pressaoColetor,
      'Temperatura ar coletor': data.tempArColetor,
      'Temperatura água': data.tempAgua,
      'TPS': data.tps,
      'Tensão bateria': data.tensaoBateria,
      'Sonda banco 01': data.sondaBanco1,
      'Sonda banco 02': data.sondaBanco2,
      'Correção banco 01': data.correcaoBanco1,
      'Correção banco 02': data.correcaoBanco2,
      'Correção ar': data.correcaoAr,
      'Correção aquecimento': data.correcaoAquecimento,
      'Correção rápida': data.correcaoRapida,
      'Cutoff TPS': data.cutoffTps,
      'Correção combustível baro': data.correcaoCombsBaro,
      'Correção combustível total': data.correcaoCombsTotal,
      'Valor VE bancada 01': data.valorVeBancada1,
      'Valor VE bancada 02': data.valorVeBancada2,
      'Controle marcha lenta': data.controleMarchaLenta,
      'Avanço ignição frio': data.avancoIgnicaoFrio,
      'TPS variação': data.tpsVariacao,
      'MAP variação': data.mapVariacao,
      'Dwell': data.dwell,
      'Carga combustível': data.cargaCombustivel,
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
      'Entrada analógica 0': data.entradaAnalogica0,
      'Entrada analógica 1': data.entradaAnalogica1,
      'Entrada analógica 2': data.entradaAnalogica2,
      // 'connected': data.connected,
      'Motor parado': data.statusMotor.motorParado,
      'Motor em funcionamento': data.statusMotor.motorEmFuncionamento,
      'Motor sincronismo Ok': data.statusMotor.sincronismoOk,
      'Motor aquecendo': data.statusMotor.aquecendo,
      'Motor cutOff ativo': data.statusMotor.corteCombustivelAtivo,
      'Motor injetando combustível': data.statusMotor.injetandoCombustivel,
      'Motor ignição ativa': data.statusMotor.ignicaoAtiva,
      'Motor erro detectado': data.statusMotor.erroDetectado,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                    _getRpiConnectionColorAndIcon(ecuData.connected)
                  ],
                ),
                Text(
                  DateFormat("dd/MM/yyyy").format(now),
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.electric_car, color: _getBatteryColor(ecuData.tensaoBateria)),
                    const SizedBox(width: 8),
                    Text(
                      "${ecuData.tensaoBateria.toStringAsFixed(2)} V",
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
                    Icon(Icons.thermostat, color: _getTempColor(ecuData.tempAgua)),
                    const SizedBox(width: 8),
                    Text(
                      "${ecuData.tempAgua.toStringAsFixed(2)} °C",
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
                const SizedBox(height: 20),
                Center(
                  child: Chip(
                    backgroundColor: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
                    padding: const EdgeInsets.all(1),
                    label: Text(getMotorStatus()),
                    labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                getMotorActions().isNotEmpty
                    ? Center(
                        child: Chip(
                          backgroundColor: Theme.of(context).primaryColorLight.withValues(alpha: 0.2),
                          padding: const EdgeInsets.all(1),
                          label: Text(getMotorActions()),
                          labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.grey[900],
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return StreamBuilder<StreamData>(
                          stream: API.streamData(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const CircularProgressIndicator();

                            final mappedData = ecuDataToMap(snapshot.data?.ecuData ?? EcuData());

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
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text("Visualizar dados", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(180, 50)),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => showRebootConfirm(context),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text("Reiniciar", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(180, 50)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
