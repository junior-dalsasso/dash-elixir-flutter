import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/ecu_data_main_view.dart';
import 'package:flutter_app/ecu_data_menu.dart';
import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:flutter_app/opala_logo.dart';
import 'package:flutter_app/fade_in.dart';

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
    var consData = data.consumptionData;

    return Row(children: [
      EcuDataMenu(ecuData: ecuData, consData: consData),
      EcuDataMainView(ecuData: ecuData)
    ]);
  }
}
