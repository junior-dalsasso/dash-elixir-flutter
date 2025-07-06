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
  late TextEditingController chartTypeController;
  late TextEditingController metricIdController;
  late TextEditingController minController;
  late TextEditingController maxController;
  late TextEditingController unitController;
  late TextEditingController decimalsController;
  late TextEditingController intervalController;

  bool showVirtualKeyboard = false;
  TextEditingController? currentTextController;

  final FocusNode unitFocusNode = FocusNode();
  final FocusNode minFocusNode = FocusNode();
  final FocusNode maxFocusNode = FocusNode();
  final FocusNode decimalsFocusNode = FocusNode();
  final FocusNode intervalFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Inicialize os controllers com os valores atuais
    chartTypeController = TextEditingController(text: widget.config.chartType);
    metricIdController = TextEditingController(text: widget.config.metricId);
    minController = TextEditingController(text: widget.config.minValue.toString());
    maxController = TextEditingController(text: widget.config.maxValue.toString());
    unitController = TextEditingController(text: widget.config.unit);
    decimalsController = TextEditingController(text: widget.config.decimalPlaces.toString());
    intervalController = TextEditingController(text: widget.config.valueInterval.toString());
  }

  @override
  void dispose() {
    chartTypeController.dispose();
    metricIdController.dispose();
    minController.dispose();
    maxController.dispose();
    unitController.dispose();
    decimalsController.dispose();
    intervalController.dispose();

    unitFocusNode.dispose();
    minFocusNode.dispose();
    maxFocusNode.dispose();
    decimalsFocusNode.dispose();
    intervalFocusNode.dispose();

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
        // Tipo de gráfico
        if (!showVirtualKeyboard) ...[
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: chartTypeController.text,
                  decoration: const InputDecoration(labelText: "Tipo do gráfico", border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem<String>(
                      value: "RADIAL",
                      child: Text("Ponteiro"),
                    ),
                    DropdownMenuItem<String>(
                      value: "MINMAX",
                      child: Text("Mínimo e máximo"),
                    ),
                  ],
                  onChanged: (newValue) => {
                    chartTypeController.text = newValue!,
                    setState(() {}),
                  },
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 6),

        // Informação e Unidade
        Row(
          children: [
            if (!showVirtualKeyboard) ...[
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: widget.config.metricId,
                  decoration: const InputDecoration(labelText: "Informação", border: OutlineInputBorder()),
                  items: _buildAvailableMetrics(),
                  onChanged: (newValue) => {
                    metricIdController.text = newValue!,
                    setState(() {}),
                  },
                ),
              ),
              const SizedBox(width: 16),
            ],
            if ((showVirtualKeyboard && currentTextController == unitController) || !showVirtualKeyboard) ...[
              Expanded(
                child: TextFormField(
                  controller: unitController,
                  decoration: const InputDecoration(labelText: "Unidade", border: OutlineInputBorder()),
                  focusNode: unitFocusNode,
                  onTap: () => _handleFieldTap(unitController, unitFocusNode),
                ),
              ),
            ]
          ],
        ),

        if (chartTypeController.text == "RADIAL") ...[
          const SizedBox(height: 6),
          // Valor mínimo e máximo
          Row(
            children: [
              if ((showVirtualKeyboard && currentTextController == minController) || !showVirtualKeyboard) ...[
                Expanded(
                  child: TextFormField(
                    controller: minController,
                    decoration: const InputDecoration(labelText: "Valor mínimo", border: OutlineInputBorder()),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    focusNode: minFocusNode,
                    onTap: () => _handleFieldTap(minController, minFocusNode),
                  ),
                ),
              ],
              const SizedBox(width: 16),
              if ((showVirtualKeyboard && currentTextController == maxController) || !showVirtualKeyboard) ...[
                Expanded(
                  child: TextFormField(
                    controller: maxController,
                    decoration: const InputDecoration(labelText: "Valor máximo", border: OutlineInputBorder()),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    focusNode: maxFocusNode,
                    onTap: () => _handleFieldTap(maxController, maxFocusNode),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),

          // Casas decimais e intervalo
          Row(
            children: [
              if ((showVirtualKeyboard && currentTextController == decimalsController) || !showVirtualKeyboard) ...[
                Expanded(
                  child: TextFormField(
                    controller: decimalsController,
                    decoration: const InputDecoration(labelText: "Casas decimais", border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    focusNode: decimalsFocusNode,
                    onTap: () => _handleFieldTap(decimalsController, decimalsFocusNode),
                  ),
                ),
              ],
              const SizedBox(width: 16),
              if ((showVirtualKeyboard && currentTextController == intervalController) || !showVirtualKeyboard) ...[
                Expanded(
                  child: TextFormField(
                    controller: intervalController,
                    decoration: const InputDecoration(labelText: "Intervalo de valores", border: OutlineInputBorder()),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    focusNode: intervalFocusNode,
                    onTap: () => _handleFieldTap(intervalController, intervalFocusNode),
                  ),
                ),
              ],
            ],
          ),
        ]
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (showVirtualKeyboard) ...[
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => showVirtualKeyboard = false),
                child: const Text("Fechar teclado", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 8),
          ],
          if (!showVirtualKeyboard) ...[
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[900]),
                onPressed: _saveSettings,
                child: const Text("Salvar", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ]
        ],
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

  void _handleFieldTap(TextEditingController controller, FocusNode node) {
    FocusScope.of(context).unfocus();

    setState(() {
      showVirtualKeyboard = true;
      currentTextController = controller;
      node.requestFocus();
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
    final bool isRadial = chartTypeController.text == "RADIAL";

    final double? min = isRadial ? double.tryParse(minController.text) ?? widget.config.minValue : null;
    final double? max = isRadial ? double.tryParse(maxController.text) ?? widget.config.maxValue : null;

    final newConfig = ChartConfig(
      chartType: chartTypeController.text,
      metricName: _getMetrics().firstWhere((x) => x["value"] == metricId)["label"]!,
      metricId: metricIdController.text,
      minValue: min,
      maxValue: max,
      unit: unitController.text,
      decimalPlaces: int.tryParse(decimalsController.text) ?? widget.config.decimalPlaces,
      valueInterval: double.tryParse(intervalController.text) ?? widget.config.valueInterval,
    );

    final currentConfigs = widget.preferencesService.getChartConfigs();
    widget.preferencesService.saveChartConfigs({...currentConfigs, widget.chartId: newConfig});
    Navigator.pop(context);
  }
}
