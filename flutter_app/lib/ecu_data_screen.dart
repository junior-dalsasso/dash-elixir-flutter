import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/ecu_data_main_view.dart';
import 'package:flutter_app/ecu_data_menu.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:flutter_app/opala_logo.dart';
import 'package:flutter_app/fade_in.dart';
import 'package:flutter_app/preferences_service.dart';

class EcuDataScreen extends StatelessWidget {
  final PreferencesService preferencesService;
  const EcuDataScreen({super.key, required this.preferencesService});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _intro(),
        FadeIn(
          duration: 1500,
          startDelay: 3000,
          child: Scaffold(
            body: StreamBuilder<StreamData>(
              stream: API.streamData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Center(child: Text("Erro na conexão"));
                return _buildPage(snapshot.data, context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _intro() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [FadeIn(duration: 1500, startDelay: 500, child: OpalaLogo())],
    );
  }

  Widget _buildPage(StreamData? data, BuildContext context) {
    data ??= StreamData();
    var ecuData = data.ecuData;

    return Row(children: [
      EcuDataMenu(ecuData: ecuData),
      EcuDataMainView(ecuData: ecuData, preferencesService: preferencesService)
    ]);
  }
}
