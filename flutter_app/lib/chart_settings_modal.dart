import "package:flutter/material.dart";
import "package:flutter_app/chart_config.dart";
import "package:flutter_app/preferences_service.dart";
import "package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart";

class ChartSettingsModal extends StatefulWidget {
  final int chartId;
  final ChartConfig config;
  final PreferencesService preferencesService;

  const ChartSettingsModal({super.key, required this.chartId, required this.config, required this.preferencesService});

  @override
  State<ChartSettingsModal> createState() => _ChartSettingsModalState();
}

class _ChartSettingsModalState extends State<ChartSettingsModal> {
  late TextEditingController metricIdController;
  late TextEditingController minController;
  late TextEditingController maxController;
  late TextEditingController unitController;
  late TextEditingController decimalsController;
  late TextEditingController intervalController;

  bool showVirtualKeyboard = false;
  TextEditingController? currentTextController;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Inicialize os controllers com os valores atuais
    metricIdController = TextEditingController(text: widget.config.metricId);
    minController = TextEditingController(text: widget.config.minValue.toString());
    maxController = TextEditingController(text: widget.config.maxValue.toString());
    unitController = TextEditingController(text: widget.config.unit);
    decimalsController = TextEditingController(text: widget.config.decimalPlaces.toString());
    intervalController = TextEditingController(text: widget.config.valueInterval.toString());
  }

  @override
  void dispose() {
    // Limpe todos os controllers e focus nodes
    metricIdController.dispose();
    minController.dispose();
    maxController.dispose();
    unitController.dispose();
    decimalsController.dispose();
    intervalController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cabeçalho
          Row(
            children: [
              const Expanded(
                child: Text("Configurações do Gráfico", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
                onPressed: () => _resetToDefaults(),
                child: const Text("Limpar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Corpo do formulário
          _buildFormFields(),

          // Teclado virtual (se necessário)
          if (showVirtualKeyboard) _buildVirtualKeyboard(),

          // Botão de salvar
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        // Linha 1: Dropdown e Unidade
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: widget.config.metricId,
                decoration: const InputDecoration(labelText: "Informação", border: OutlineInputBorder()),
                items: _buildAvailableMetrics(),
                onChanged: (newValue) => metricIdController.text = newValue!,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: unitController,
                decoration: const InputDecoration(labelText: "Unidade", border: OutlineInputBorder()),
                focusNode: focusNode,
                onTap: () => _handleFieldTap(unitController),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // Linha 2: Valor mínimo e máximo
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: minController,
                decoration: const InputDecoration(labelText: "Valor mínimo", border: OutlineInputBorder()),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                focusNode: focusNode,
                onTap: () => _handleFieldTap(minController),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: maxController,
                decoration: const InputDecoration(labelText: "Valor máximo", border: OutlineInputBorder()),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                focusNode: focusNode,
                onTap: () => _handleFieldTap(maxController),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // Linha 3: Casas decimais e intervalo
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: decimalsController,
                decoration: const InputDecoration(labelText: "Casas decimais", border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                focusNode: focusNode,
                onTap: () => _handleFieldTap(decimalsController),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: intervalController,
                decoration: const InputDecoration(labelText: "Intervalo de valores", border: OutlineInputBorder()),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                focusNode: focusNode,
                onTap: () => _handleFieldTap(intervalController),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVirtualKeyboard() {
    return VirtualKeyboard(
      height: 220,
      textColor: Colors.white,
      type: VirtualKeyboardType.Custom,
      textController: currentTextController,
      keys: currentTextController == unitController ? _buildAlphanumericLayout() : _buildNumericLayout(),
    );
  }

  List<List<String>> _buildNumericLayout() {
    return [
      ["7", "8", "9"],
      ["4", "5", "6"],
      ["1", "2", "3"],
      ["-", "0", ".", "BACKSPACE"],
    ];
  }

  List<List<String>> _buildAlphanumericLayout() {
    return [
      ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
      ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "BACKSPACE"],
      ["a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "\"", "RETURN"],
      ["SHIFT", "z", "x", "c", "v", "b", "n", "m", ",", ".", "/", "SHIFT"],
      ["°", "ª", "SPACE", "&", "_"]
    ];
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[900]),
        onPressed: _saveSettings,
        child: const Text("Salvar", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  List<Map<String, String>> _getMetrics() {
    return [
      {"value": "segundosMotorLigado", "label": "Segundos ECU ligada"},
      {"value": "largPulsoBancada1", "label": "Largura pulso bancada 01"},
      {"value": "largPulsoBancada2", "label": "Largura pulso bancada 02"},
      {"value": "rpm", "label": "RPM"},
      {"value": "avancoIgnicao", "label": "Avanço ignição"},
      {"value": "afrAlvoBancada1", "label": "AFR alvo bancada 01"},
      {"value": "afrAlvoBancada2", "label": "AFR alvo bancada 02"},
      {"value": "pressaoColetor", "label": "Pressão coletor"},
      {"value": "tempArColetor", "label": "Temperatura ar coletor"},
      {"value": "tempAgua", "label": "Temperatura água"},
      {"value": "tps", "label": "TPS"},
      {"value": "tensaoBateria", "label": "Tensão bateria"},
      {"value": "sondaBanco1", "label": "Sonda banco 01"},
      {"value": "sondaBanco2", "label": "Sonda banco 02"},
      {"value": "correcaoBanco1", "label": "Correção banco 01"},
      {"value": "correcaoBanco2", "label": "Correção banco 02"},
      {"value": "correcaoAr", "label": "Correção ar"},
      {"value": "correcaoAquecimento", "label": "Correção aquecimento"},
      {"value": "correcaoRapida", "label": "Correção rápida"},
      {"value": "cutoffTps", "label": "Cutoff TPS"},
      {"value": "correcaoCombsBaro", "label": "Correção combustível baro"},
      {"value": "correcaoCombsTotal", "label": "Correção combustível total"},
      {"value": "valorVeBancada1", "label": "Valor VE bancada 01"},
      {"value": "valorVeBancada2", "label": "Valor VE bancada 02"},
      {"value": "controleMarchaLenta", "label": "Controle marcha lenta"},
      {"value": "avancoIgnicaoFrio", "label": "Avanço ignição frio"},
      {"value": "tpsVariacao", "label": "TPS variação"},
      {"value": "mapVariacao", "label": "MAP variação"},
      {"value": "dwell", "label": "Dwell"},
      {"value": "cargaCombustivel", "label": "Carga combustível"},
      {"value": "entradaAnalogica0", "label": "Entrada analógica 0"},
      {"value": "entradaAnalogica1", "label": "Entrada analógica 1"},
      {"value": "entradaAnalogica2", "label": "Entrada analógica 2"},
    ];
  }

  List<DropdownMenuItem<String>> _buildAvailableMetrics() {
    return _getMetrics()
        .map(
          (metric) => DropdownMenuItem<String>(
            value: metric["value"],
            child: Text(metric["label"]!),
          ),
        )
        .toList();
  }

  void _handleFieldTap(TextEditingController controller) {
    setState(() {
      showVirtualKeyboard = true;
      currentTextController = controller;
      focusNode.requestFocus();
    });
  }

  void _resetToDefaults() {
    final currentConfigs = widget.preferencesService.getChartConfigs();
    final defaultConf = widget.preferencesService.getDefaultConfigs();

    widget.preferencesService.saveChartConfigs({...currentConfigs, widget.chartId: defaultConf[widget.chartId]!});
    Navigator.pop(context);
  }

  void _saveSettings() {
    final metricId = metricIdController.text;

    final newConfig = ChartConfig(
      metricName: _getMetrics().firstWhere((x) => x["value"] == metricId)["label"]!,
      metricId: metricIdController.text,
      minValue: double.tryParse(minController.text) ?? widget.config.minValue,
      maxValue: double.tryParse(maxController.text) ?? widget.config.maxValue,
      unit: unitController.text,
      decimalPlaces: int.tryParse(decimalsController.text) ?? widget.config.decimalPlaces,
      valueInterval: double.tryParse(intervalController.text) ?? widget.config.valueInterval,
    );

    final currentConfigs = widget.preferencesService.getChartConfigs();
    widget.preferencesService.saveChartConfigs({...currentConfigs, widget.chartId: newConfig});
    Navigator.pop(context);
  }
}

  // void _showChartSettings(BuildContext context, int chartId, ChartConfig config) {
  //   final metricIdController = TextEditingController(text: config.metricId);
  //   final minController = TextEditingController(text: config.minValue.toString());
  //   final maxController = TextEditingController(text: config.maxValue.toString());
  //   final unitController = TextEditingController(text: config.unit);
  //   final decimalsController = TextEditingController(text: config.decimalPlaces.toString());
  //   final intervalController = TextEditingController(text: config.valueInterval.toString());
  //   final availableMetrics = [
  //     const DropdownMenuItem<String>(value: "segundosMotorLigado", child: Text("Segundos ECU ligada")),
  //     const DropdownMenuItem<String>(value: "largPulsoBancada1", child: Text("Largura pulso bancada 01")),
  //     const DropdownMenuItem<String>(value: "largPulsoBancada2", child: Text("Largura pulso bancada 02")),
  //     const DropdownMenuItem<String>(value: "rpm", child: Text("RPM")),
  //     const DropdownMenuItem<String>(value: "avancoIgnicao", child: Text("Avanço ignição")),
  //     const DropdownMenuItem<String>(value: "afrAlvoBancada1", child: Text("AFR alvo bancada 01")),
  //     const DropdownMenuItem<String>(value: "afrAlvoBancada2", child: Text("AFR alvo bancada 02")),
  //     const DropdownMenuItem<String>(value: "pressaoColetor", child: Text("Pressão coletor")),
  //     const DropdownMenuItem<String>(value: "tempArColetor", child: Text("Temperatura ar coletor")),
  //     const DropdownMenuItem<String>(value: "tempAgua", child: Text("Temperatura água")),
  //     const DropdownMenuItem<String>(value: "tps", child: Text("TPS")),
  //     const DropdownMenuItem<String>(value: "tensaoBateria", child: Text("Tensão bateria")),
  //     const DropdownMenuItem<String>(value: "sondaBanco1", child: Text("Sonda banco 01")),
  //     const DropdownMenuItem<String>(value: "sondaBanco2", child: Text("Sonda banco 02")),
  //     const DropdownMenuItem<String>(value: "correcaoBanco1", child: Text("Correção banco 01")),
  //     const DropdownMenuItem<String>(value: "correcaoBanco2", child: Text("Correção banco 02")),
  //     const DropdownMenuItem<String>(value: "correcaoAr", child: Text("Correção ar")),
  //     const DropdownMenuItem<String>(value: "correcaoAquecimento", child: Text("Correção aquecimento")),
  //     const DropdownMenuItem<String>(value: "correcaoRapida", child: Text("Correção rápida")),
  //     const DropdownMenuItem<String>(value: "cutoffTps", child: Text("Cutoff TPS")),
  //     const DropdownMenuItem<String>(value: "correcaoCombsBaro", child: Text("Correção combustível baro")),
  //     const DropdownMenuItem<String>(value: "correcaoCombsTotal", child: Text("Correção combustível total")),
  //     const DropdownMenuItem<String>(value: "valorVeBancada1", child: Text("Valor VE bancada 01")),
  //     const DropdownMenuItem<String>(value: "valorVeBancada2", child: Text("Valor VE bancada 02")),
  //     const DropdownMenuItem<String>(value: "controleMarchaLenta", child: Text("Controle marcha lenta")),
  //     const DropdownMenuItem<String>(value: "avancoIgnicaoFrio", child: Text("Avanço ignição frio")),
  //     const DropdownMenuItem<String>(value: "tpsVariacao", child: Text("TPS variação")),
  //     const DropdownMenuItem<String>(value: "mapVariacao", child: Text("MAP variação")),
  //     const DropdownMenuItem<String>(value: "dwell", child: Text("Dwell")),
  //     const DropdownMenuItem<String>(value: "cargaCombustivel", child: Text("Carga combustível")),
  //     const DropdownMenuItem<String>(value: "entradaAnalogica0", child: Text("Entrada analógica 0")),
  //     const DropdownMenuItem<String>(value: "entradaAnalogica1", child: Text("Entrada analógica 1")),
  //     const DropdownMenuItem<String>(value: "entradaAnalogica2", child: Text("Entrada analógica 2")),
  //   ];
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.grey[900],
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(8),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             Row(
  //               children: [
  //                 const Expanded(
  //                   child: Text(
  //                     "Configurações do Gráfico",
  //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
  //                   child: const Text("Limpar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  //                   onPressed: () {
  //                     final defaultConf = preferencesService.getDefaultConfigs();
  //                     preferencesService.saveChartConfigs({...defaultConf, chartId: defaultConf[chartId]!});
  //                     Navigator.pop(context);
  //                   },
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 8),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: DropdownButtonFormField<String>(
  //                     value: config.metricId,
  //                     decoration: const InputDecoration(labelText: "Informação", border: OutlineInputBorder()),
  //                     items: availableMetrics,
  //                     onChanged: (newValue) => metricIdController.text = newValue!,
  //                   ),
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: unitController,
  //                     decoration: const InputDecoration(labelText: "Unidade", border: OutlineInputBorder()),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 8),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: minController,
  //                     decoration: const InputDecoration(labelText: "Valor mínimo", border: OutlineInputBorder()),
  //                     keyboardType: const TextInputType.numberWithOptions(decimal: true),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: maxController,
  //                     decoration: const InputDecoration(labelText: "Valor máximo", border: OutlineInputBorder()),
  //                     keyboardType: const TextInputType.numberWithOptions(decimal: true),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 8),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: decimalsController,
  //                     decoration: const InputDecoration(labelText: "Casas decimais", border: OutlineInputBorder()),
  //                     keyboardType: TextInputType.number,
  //                   ),
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: intervalController,
  //                     decoration:
  //                         const InputDecoration(labelText: "Intervalo de valores", border: OutlineInputBorder()),
  //                     keyboardType: const TextInputType.numberWithOptions(decimal: true),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 8),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.,
  //               children: [
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[900]),
  //                   child: const Text("Salvar", style: TextStyle(fontWeight: FontWeight.bold)),
  //                   onPressed: () {
  //                     final newConfig = ChartConfig(
  //                       metricName: config.metricName,
  //                       metricId: metricIdController.text,
  //                       minValue: double.tryParse(minController.text) ?? config.minValue,
  //                       maxValue: double.tryParse(maxController.text) ?? config.maxValue,
  //                       unit: unitController.text,
  //                       decimalPlaces: int.tryParse(decimalsController.text) ?? config.decimalPlaces,
  //                       valueInterval: double.tryParse(intervalController.text) ?? config.valueInterval,
  //                     );
  //                     final currentConfigs = preferencesService.getChartConfigs();
  //                     preferencesService.saveChartConfigs({...currentConfigs, chartId: newConfig});
  //                     Navigator.pop(context);
  //                   },
  //                 )
  //               ],
  //             ),
  //             const SizedBox(height: 2),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }