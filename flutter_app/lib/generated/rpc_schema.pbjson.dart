//
//  Generated code. Do not modify.
//  source: rpc_schema.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use ecuDataDescriptor instead')
const EcuData$json = {
  '1': 'EcuData',
  '2': [
    {'1': 'segundos_motor_ligado', '3': 1, '4': 1, '5': 2, '10': 'segundosMotorLigado'},
    {'1': 'larg_pulso_bancada_1', '3': 2, '4': 1, '5': 2, '10': 'largPulsoBancada1'},
    {'1': 'larg_pulso_bancada_2', '3': 3, '4': 1, '5': 2, '10': 'largPulsoBancada2'},
    {'1': 'rpm', '3': 4, '4': 1, '5': 2, '10': 'rpm'},
    {'1': 'avanco_ignicao', '3': 5, '4': 1, '5': 2, '10': 'avancoIgnicao'},
    {'1': 'status_motor', '3': 6, '4': 1, '5': 11, '6': '.DashElixirFlutter.StatusMotor', '10': 'statusMotor'},
    {'1': 'afr_alvo_bancada_1', '3': 7, '4': 1, '5': 2, '10': 'afrAlvoBancada1'},
    {'1': 'afr_alvo_bancada_2', '3': 8, '4': 1, '5': 2, '10': 'afrAlvoBancada2'},
    {'1': 'pressao_coletor', '3': 9, '4': 1, '5': 2, '10': 'pressaoColetor'},
    {'1': 'temp_ar_coletor', '3': 10, '4': 1, '5': 2, '10': 'tempArColetor'},
    {'1': 'temp_agua', '3': 11, '4': 1, '5': 2, '10': 'tempAgua'},
    {'1': 'tps', '3': 12, '4': 1, '5': 2, '10': 'tps'},
    {'1': 'tensao_bateria', '3': 13, '4': 1, '5': 2, '10': 'tensaoBateria'},
    {'1': 'sonda_banco_1', '3': 14, '4': 1, '5': 2, '10': 'sondaBanco1'},
    {'1': 'sonda_banco_2', '3': 15, '4': 1, '5': 2, '10': 'sondaBanco2'},
    {'1': 'correcao_banco_1', '3': 16, '4': 1, '5': 2, '10': 'correcaoBanco1'},
    {'1': 'correcao_banco_2', '3': 17, '4': 1, '5': 2, '10': 'correcaoBanco2'},
    {'1': 'correcao_ar', '3': 18, '4': 1, '5': 2, '10': 'correcaoAr'},
    {'1': 'correcao_aquecimento', '3': 19, '4': 1, '5': 2, '10': 'correcaoAquecimento'},
    {'1': 'correcao_rapida', '3': 20, '4': 1, '5': 2, '10': 'correcaoRapida'},
    {'1': 'cutoff_tps', '3': 21, '4': 1, '5': 2, '10': 'cutoffTps'},
    {'1': 'correcao_combs_baro', '3': 22, '4': 1, '5': 2, '10': 'correcaoCombsBaro'},
    {'1': 'correcao_combs_total', '3': 23, '4': 1, '5': 2, '10': 'correcaoCombsTotal'},
    {'1': 'valor_ve_bancada_1', '3': 24, '4': 1, '5': 2, '10': 'valorVeBancada1'},
    {'1': 'valor_ve_bancada_2', '3': 25, '4': 1, '5': 2, '10': 'valorVeBancada2'},
    {'1': 'controle_marcha_lenta', '3': 26, '4': 1, '5': 2, '10': 'controleMarchaLenta'},
    {'1': 'avanco_ignicao_frio', '3': 27, '4': 1, '5': 2, '10': 'avancoIgnicaoFrio'},
    {'1': 'tps_variacao', '3': 28, '4': 1, '5': 2, '10': 'tpsVariacao'},
    {'1': 'map_variacao', '3': 29, '4': 1, '5': 2, '10': 'mapVariacao'},
    {'1': 'dwell', '3': 30, '4': 1, '5': 2, '10': 'dwell'},
    {'1': 'carga_combustivel', '3': 31, '4': 1, '5': 2, '10': 'cargaCombustivel'},
    {'1': 'atualizacoes_amc', '3': 32, '4': 1, '5': 13, '10': 'atualizacoesAmc'},
    {'1': 'kpaix_nao_usado', '3': 33, '4': 1, '5': 13, '10': 'kpaixNaoUsado'},
    {'1': 'leitura_tps_adc', '3': 34, '4': 1, '5': 2, '10': 'leituraTpsAdc'},
    {'1': 'carga_combustivel_alg2', '3': 35, '4': 1, '5': 2, '10': 'cargaCombustivelAlg2'},
    {'1': 'carga_ignicao_alg1', '3': 36, '4': 1, '5': 2, '10': 'cargaIgnicaoAlg1'},
    {'1': 'carga_ignicao_alg2', '3': 37, '4': 1, '5': 2, '10': 'cargaIgnicaoAlg2'},
    {'1': 'contador_sincronismo', '3': 38, '4': 1, '5': 13, '10': 'contadorSincronismo'},
    {'1': 'erro_tempo_ignicao_pct', '3': 39, '4': 1, '5': 2, '10': 'erroTempoIgnicaoPct'},
    {'1': 'tempo_entre_pulsos_us', '3': 40, '4': 1, '5': 13, '10': 'tempoEntrePulsosUs'},
    {'1': 'combustivel_parede_us', '3': 41, '4': 1, '5': 13, '10': 'combustivelParedeUs'},
    {'1': 'entrada_analogica_0', '3': 42, '4': 1, '5': 2, '10': 'entradaAnalogica0'},
    {'1': 'entrada_analogica_1', '3': 43, '4': 1, '5': 2, '10': 'entradaAnalogica1'},
    {'1': 'entrada_analogica_2', '3': 44, '4': 1, '5': 2, '10': 'entradaAnalogica2'},
    {'1': 'connected', '3': 45, '4': 1, '5': 8, '10': 'connected'},
  ],
};

/// Descriptor for `EcuData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ecuDataDescriptor = $convert.base64Decode(
    'CgdFY3VEYXRhEjIKFXNlZ3VuZG9zX21vdG9yX2xpZ2FkbxgBIAEoAlITc2VndW5kb3NNb3Rvck'
    'xpZ2FkbxIvChRsYXJnX3B1bHNvX2JhbmNhZGFfMRgCIAEoAlIRbGFyZ1B1bHNvQmFuY2FkYTES'
    'LwoUbGFyZ19wdWxzb19iYW5jYWRhXzIYAyABKAJSEWxhcmdQdWxzb0JhbmNhZGEyEhAKA3JwbR'
    'gEIAEoAlIDcnBtEiUKDmF2YW5jb19pZ25pY2FvGAUgASgCUg1hdmFuY29JZ25pY2FvEkEKDHN0'
    'YXR1c19tb3RvchgGIAEoCzIeLkRhc2hFbGl4aXJGbHV0dGVyLlN0YXR1c01vdG9yUgtzdGF0dX'
    'NNb3RvchIrChJhZnJfYWx2b19iYW5jYWRhXzEYByABKAJSD2FmckFsdm9CYW5jYWRhMRIrChJh'
    'ZnJfYWx2b19iYW5jYWRhXzIYCCABKAJSD2FmckFsdm9CYW5jYWRhMhInCg9wcmVzc2FvX2NvbG'
    'V0b3IYCSABKAJSDnByZXNzYW9Db2xldG9yEiYKD3RlbXBfYXJfY29sZXRvchgKIAEoAlINdGVt'
    'cEFyQ29sZXRvchIbCgl0ZW1wX2FndWEYCyABKAJSCHRlbXBBZ3VhEhAKA3RwcxgMIAEoAlIDdH'
    'BzEiUKDnRlbnNhb19iYXRlcmlhGA0gASgCUg10ZW5zYW9CYXRlcmlhEiIKDXNvbmRhX2JhbmNv'
    'XzEYDiABKAJSC3NvbmRhQmFuY28xEiIKDXNvbmRhX2JhbmNvXzIYDyABKAJSC3NvbmRhQmFuY2'
    '8yEigKEGNvcnJlY2FvX2JhbmNvXzEYECABKAJSDmNvcnJlY2FvQmFuY28xEigKEGNvcnJlY2Fv'
    'X2JhbmNvXzIYESABKAJSDmNvcnJlY2FvQmFuY28yEh8KC2NvcnJlY2FvX2FyGBIgASgCUgpjb3'
    'JyZWNhb0FyEjEKFGNvcnJlY2FvX2FxdWVjaW1lbnRvGBMgASgCUhNjb3JyZWNhb0FxdWVjaW1l'
    'bnRvEicKD2NvcnJlY2FvX3JhcGlkYRgUIAEoAlIOY29ycmVjYW9SYXBpZGESHQoKY3V0b2ZmX3'
    'RwcxgVIAEoAlIJY3V0b2ZmVHBzEi4KE2NvcnJlY2FvX2NvbWJzX2Jhcm8YFiABKAJSEWNvcnJl'
    'Y2FvQ29tYnNCYXJvEjAKFGNvcnJlY2FvX2NvbWJzX3RvdGFsGBcgASgCUhJjb3JyZWNhb0NvbW'
    'JzVG90YWwSKwoSdmFsb3JfdmVfYmFuY2FkYV8xGBggASgCUg92YWxvclZlQmFuY2FkYTESKwoS'
    'dmFsb3JfdmVfYmFuY2FkYV8yGBkgASgCUg92YWxvclZlQmFuY2FkYTISMgoVY29udHJvbGVfbW'
    'FyY2hhX2xlbnRhGBogASgCUhNjb250cm9sZU1hcmNoYUxlbnRhEi4KE2F2YW5jb19pZ25pY2Fv'
    'X2ZyaW8YGyABKAJSEWF2YW5jb0lnbmljYW9GcmlvEiEKDHRwc192YXJpYWNhbxgcIAEoAlILdH'
    'BzVmFyaWFjYW8SIQoMbWFwX3ZhcmlhY2FvGB0gASgCUgttYXBWYXJpYWNhbxIUCgVkd2VsbBge'
    'IAEoAlIFZHdlbGwSKwoRY2FyZ2FfY29tYnVzdGl2ZWwYHyABKAJSEGNhcmdhQ29tYnVzdGl2ZW'
    'wSKQoQYXR1YWxpemFjb2VzX2FtYxggIAEoDVIPYXR1YWxpemFjb2VzQW1jEiYKD2twYWl4X25h'
    'b191c2FkbxghIAEoDVINa3BhaXhOYW9Vc2FkbxImCg9sZWl0dXJhX3Rwc19hZGMYIiABKAJSDW'
    'xlaXR1cmFUcHNBZGMSNAoWY2FyZ2FfY29tYnVzdGl2ZWxfYWxnMhgjIAEoAlIUY2FyZ2FDb21i'
    'dXN0aXZlbEFsZzISLAoSY2FyZ2FfaWduaWNhb19hbGcxGCQgASgCUhBjYXJnYUlnbmljYW9BbG'
    'cxEiwKEmNhcmdhX2lnbmljYW9fYWxnMhglIAEoAlIQY2FyZ2FJZ25pY2FvQWxnMhIxChRjb250'
    'YWRvcl9zaW5jcm9uaXNtbxgmIAEoDVITY29udGFkb3JTaW5jcm9uaXNtbxIzChZlcnJvX3RlbX'
    'BvX2lnbmljYW9fcGN0GCcgASgCUhNlcnJvVGVtcG9JZ25pY2FvUGN0EjEKFXRlbXBvX2VudHJl'
    'X3B1bHNvc191cxgoIAEoDVISdGVtcG9FbnRyZVB1bHNvc1VzEjIKFWNvbWJ1c3RpdmVsX3Bhcm'
    'VkZV91cxgpIAEoDVITY29tYnVzdGl2ZWxQYXJlZGVVcxIuChNlbnRyYWRhX2FuYWxvZ2ljYV8w'
    'GCogASgCUhFlbnRyYWRhQW5hbG9naWNhMBIuChNlbnRyYWRhX2FuYWxvZ2ljYV8xGCsgASgCUh'
    'FlbnRyYWRhQW5hbG9naWNhMRIuChNlbnRyYWRhX2FuYWxvZ2ljYV8yGCwgASgCUhFlbnRyYWRh'
    'QW5hbG9naWNhMhIcCgljb25uZWN0ZWQYLSABKAhSCWNvbm5lY3RlZA==');

@$core.Deprecated('Use statusMotorDescriptor instead')
const StatusMotor$json = {
  '1': 'StatusMotor',
  '2': [
    {'1': 'motor_pronto', '3': 1, '4': 1, '5': 8, '10': 'motorPronto'},
    {'1': 'motor_em_partida', '3': 2, '4': 1, '5': 8, '10': 'motorEmPartida'},
    {'1': 'enriquecimento_partida', '3': 3, '4': 1, '5': 8, '10': 'enriquecimentoPartida'},
    {'1': 'ciclo_aquecimento', '3': 4, '4': 1, '5': 8, '10': 'cicloAquecimento'},
  ],
};

/// Descriptor for `StatusMotor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusMotorDescriptor = $convert.base64Decode(
    'CgtTdGF0dXNNb3RvchIhCgxtb3Rvcl9wcm9udG8YASABKAhSC21vdG9yUHJvbnRvEigKEG1vdG'
    '9yX2VtX3BhcnRpZGEYAiABKAhSDm1vdG9yRW1QYXJ0aWRhEjUKFmVucmlxdWVjaW1lbnRvX3Bh'
    'cnRpZGEYAyABKAhSFWVucmlxdWVjaW1lbnRvUGFydGlkYRIrChFjaWNsb19hcXVlY2ltZW50bx'
    'gEIAEoCFIQY2ljbG9BcXVlY2ltZW50bw==');

@$core.Deprecated('Use streamDataDescriptor instead')
const StreamData$json = {
  '1': 'StreamData',
  '2': [
    {'1': 'ecu_data', '3': 1, '4': 1, '5': 11, '6': '.DashElixirFlutter.EcuData', '10': 'ecuData'},
  ],
};

/// Descriptor for `StreamData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDataDescriptor = $convert.base64Decode(
    'CgpTdHJlYW1EYXRhEjUKCGVjdV9kYXRhGAEgASgLMhouRGFzaEVsaXhpckZsdXR0ZXIuRWN1RG'
    'F0YVIHZWN1RGF0YQ==');

@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = {
  '1': 'Device',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USEgoEbmFtZRgBIAEoCVIEbmFtZRIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNz');

@$core.Deprecated('Use deviceListDescriptor instead')
const DeviceList$json = {
  '1': 'DeviceList',
  '2': [
    {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.DashElixirFlutter.Device', '10': 'devices'},
  ],
};

/// Descriptor for `DeviceList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceListDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VMaXN0EjMKB2RldmljZXMYASADKAsyGS5EYXNoRWxpeGlyRmx1dHRlci5EZXZpY2'
    'VSB2RldmljZXM=');

@$core.Deprecated('Use actionResultDescriptor instead')
const ActionResult$json = {
  '1': 'ActionResult',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
  ],
};

/// Descriptor for `ActionResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionResultDescriptor = $convert.base64Decode(
    'CgxBY3Rpb25SZXN1bHQSFgoGcmVzdWx0GAEgASgIUgZyZXN1bHQ=');

