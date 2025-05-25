//
//  Generated code. Do not modify.
//  source: rpc_schema.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class EcuData extends $pb.GeneratedMessage {
  factory EcuData({
    $core.double? segundosMotorLigado,
    $core.double? largPulsoBancada1,
    $core.double? largPulsoBancada2,
    $core.double? rpm,
    $core.double? avancoIgnicao,
    StatusMotor? statusMotor,
    $core.double? afrAlvoBancada1,
    $core.double? afrAlvoBancada2,
    $core.double? pressaoColetor,
    $core.double? tempArColetor,
    $core.double? tempAgua,
    $core.double? tps,
    $core.double? tensaoBateria,
    $core.double? sondaBanco1,
    $core.double? sondaBanco2,
    $core.double? correcaoBanco1,
    $core.double? correcaoBanco2,
    $core.double? correcaoAr,
    $core.double? correcaoAquecimento,
    $core.double? correcaoRapida,
    $core.double? cutoffTps,
    $core.double? correcaoCombsBaro,
    $core.double? correcaoCombsTotal,
    $core.double? valorVeBancada1,
    $core.double? valorVeBancada2,
    $core.double? controleMarchaLenta,
    $core.double? avancoIgnicaoFrio,
    $core.double? tpsVariacao,
    $core.double? mapVariacao,
    $core.double? dwell,
    $core.double? cargaCombustivel,
    $core.int? atualizacoesAmc,
    $core.int? kpaixNaoUsado,
    $core.double? leituraTpsAdc,
    $core.double? cargaCombustivelAlg2,
    $core.double? cargaIgnicaoAlg1,
    $core.double? cargaIgnicaoAlg2,
    $core.int? contadorSincronismo,
    $core.double? erroTempoIgnicaoPct,
    $core.int? tempoEntrePulsosUs,
    $core.int? combustivelParedeUs,
    $core.double? entradaAnalogica0,
    $core.double? entradaAnalogica1,
    $core.double? entradaAnalogica2,
    $core.bool? connected,
  }) {
    final $result = create();
    if (segundosMotorLigado != null) {
      $result.segundosMotorLigado = segundosMotorLigado;
    }
    if (largPulsoBancada1 != null) {
      $result.largPulsoBancada1 = largPulsoBancada1;
    }
    if (largPulsoBancada2 != null) {
      $result.largPulsoBancada2 = largPulsoBancada2;
    }
    if (rpm != null) {
      $result.rpm = rpm;
    }
    if (avancoIgnicao != null) {
      $result.avancoIgnicao = avancoIgnicao;
    }
    if (statusMotor != null) {
      $result.statusMotor = statusMotor;
    }
    if (afrAlvoBancada1 != null) {
      $result.afrAlvoBancada1 = afrAlvoBancada1;
    }
    if (afrAlvoBancada2 != null) {
      $result.afrAlvoBancada2 = afrAlvoBancada2;
    }
    if (pressaoColetor != null) {
      $result.pressaoColetor = pressaoColetor;
    }
    if (tempArColetor != null) {
      $result.tempArColetor = tempArColetor;
    }
    if (tempAgua != null) {
      $result.tempAgua = tempAgua;
    }
    if (tps != null) {
      $result.tps = tps;
    }
    if (tensaoBateria != null) {
      $result.tensaoBateria = tensaoBateria;
    }
    if (sondaBanco1 != null) {
      $result.sondaBanco1 = sondaBanco1;
    }
    if (sondaBanco2 != null) {
      $result.sondaBanco2 = sondaBanco2;
    }
    if (correcaoBanco1 != null) {
      $result.correcaoBanco1 = correcaoBanco1;
    }
    if (correcaoBanco2 != null) {
      $result.correcaoBanco2 = correcaoBanco2;
    }
    if (correcaoAr != null) {
      $result.correcaoAr = correcaoAr;
    }
    if (correcaoAquecimento != null) {
      $result.correcaoAquecimento = correcaoAquecimento;
    }
    if (correcaoRapida != null) {
      $result.correcaoRapida = correcaoRapida;
    }
    if (cutoffTps != null) {
      $result.cutoffTps = cutoffTps;
    }
    if (correcaoCombsBaro != null) {
      $result.correcaoCombsBaro = correcaoCombsBaro;
    }
    if (correcaoCombsTotal != null) {
      $result.correcaoCombsTotal = correcaoCombsTotal;
    }
    if (valorVeBancada1 != null) {
      $result.valorVeBancada1 = valorVeBancada1;
    }
    if (valorVeBancada2 != null) {
      $result.valorVeBancada2 = valorVeBancada2;
    }
    if (controleMarchaLenta != null) {
      $result.controleMarchaLenta = controleMarchaLenta;
    }
    if (avancoIgnicaoFrio != null) {
      $result.avancoIgnicaoFrio = avancoIgnicaoFrio;
    }
    if (tpsVariacao != null) {
      $result.tpsVariacao = tpsVariacao;
    }
    if (mapVariacao != null) {
      $result.mapVariacao = mapVariacao;
    }
    if (dwell != null) {
      $result.dwell = dwell;
    }
    if (cargaCombustivel != null) {
      $result.cargaCombustivel = cargaCombustivel;
    }
    if (atualizacoesAmc != null) {
      $result.atualizacoesAmc = atualizacoesAmc;
    }
    if (kpaixNaoUsado != null) {
      $result.kpaixNaoUsado = kpaixNaoUsado;
    }
    if (leituraTpsAdc != null) {
      $result.leituraTpsAdc = leituraTpsAdc;
    }
    if (cargaCombustivelAlg2 != null) {
      $result.cargaCombustivelAlg2 = cargaCombustivelAlg2;
    }
    if (cargaIgnicaoAlg1 != null) {
      $result.cargaIgnicaoAlg1 = cargaIgnicaoAlg1;
    }
    if (cargaIgnicaoAlg2 != null) {
      $result.cargaIgnicaoAlg2 = cargaIgnicaoAlg2;
    }
    if (contadorSincronismo != null) {
      $result.contadorSincronismo = contadorSincronismo;
    }
    if (erroTempoIgnicaoPct != null) {
      $result.erroTempoIgnicaoPct = erroTempoIgnicaoPct;
    }
    if (tempoEntrePulsosUs != null) {
      $result.tempoEntrePulsosUs = tempoEntrePulsosUs;
    }
    if (combustivelParedeUs != null) {
      $result.combustivelParedeUs = combustivelParedeUs;
    }
    if (entradaAnalogica0 != null) {
      $result.entradaAnalogica0 = entradaAnalogica0;
    }
    if (entradaAnalogica1 != null) {
      $result.entradaAnalogica1 = entradaAnalogica1;
    }
    if (entradaAnalogica2 != null) {
      $result.entradaAnalogica2 = entradaAnalogica2;
    }
    if (connected != null) {
      $result.connected = connected;
    }
    return $result;
  }
  EcuData._() : super();
  factory EcuData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EcuData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EcuData', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'segundosMotorLigado', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'largPulsoBancada1', $pb.PbFieldType.OF, protoName: 'larg_pulso_bancada_1')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'largPulsoBancada2', $pb.PbFieldType.OF, protoName: 'larg_pulso_bancada_2')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'rpm', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'avancoIgnicao', $pb.PbFieldType.OF)
    ..aOM<StatusMotor>(6, _omitFieldNames ? '' : 'statusMotor', subBuilder: StatusMotor.create)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'afrAlvoBancada1', $pb.PbFieldType.OF, protoName: 'afr_alvo_bancada_1')
    ..a<$core.double>(8, _omitFieldNames ? '' : 'afrAlvoBancada2', $pb.PbFieldType.OF, protoName: 'afr_alvo_bancada_2')
    ..a<$core.double>(9, _omitFieldNames ? '' : 'pressaoColetor', $pb.PbFieldType.OF)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'tempArColetor', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'tempAgua', $pb.PbFieldType.OF)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'tps', $pb.PbFieldType.OF)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'tensaoBateria', $pb.PbFieldType.OF)
    ..a<$core.double>(14, _omitFieldNames ? '' : 'sondaBanco1', $pb.PbFieldType.OF, protoName: 'sonda_banco_1')
    ..a<$core.double>(15, _omitFieldNames ? '' : 'sondaBanco2', $pb.PbFieldType.OF, protoName: 'sonda_banco_2')
    ..a<$core.double>(16, _omitFieldNames ? '' : 'correcaoBanco1', $pb.PbFieldType.OF, protoName: 'correcao_banco_1')
    ..a<$core.double>(17, _omitFieldNames ? '' : 'correcaoBanco2', $pb.PbFieldType.OF, protoName: 'correcao_banco_2')
    ..a<$core.double>(18, _omitFieldNames ? '' : 'correcaoAr', $pb.PbFieldType.OF)
    ..a<$core.double>(19, _omitFieldNames ? '' : 'correcaoAquecimento', $pb.PbFieldType.OF)
    ..a<$core.double>(20, _omitFieldNames ? '' : 'correcaoRapida', $pb.PbFieldType.OF)
    ..a<$core.double>(21, _omitFieldNames ? '' : 'cutoffTps', $pb.PbFieldType.OF)
    ..a<$core.double>(22, _omitFieldNames ? '' : 'correcaoCombsBaro', $pb.PbFieldType.OF)
    ..a<$core.double>(23, _omitFieldNames ? '' : 'correcaoCombsTotal', $pb.PbFieldType.OF)
    ..a<$core.double>(24, _omitFieldNames ? '' : 'valorVeBancada1', $pb.PbFieldType.OF, protoName: 'valor_ve_bancada_1')
    ..a<$core.double>(25, _omitFieldNames ? '' : 'valorVeBancada2', $pb.PbFieldType.OF, protoName: 'valor_ve_bancada_2')
    ..a<$core.double>(26, _omitFieldNames ? '' : 'controleMarchaLenta', $pb.PbFieldType.OF)
    ..a<$core.double>(27, _omitFieldNames ? '' : 'avancoIgnicaoFrio', $pb.PbFieldType.OF)
    ..a<$core.double>(28, _omitFieldNames ? '' : 'tpsVariacao', $pb.PbFieldType.OF)
    ..a<$core.double>(29, _omitFieldNames ? '' : 'mapVariacao', $pb.PbFieldType.OF)
    ..a<$core.double>(30, _omitFieldNames ? '' : 'dwell', $pb.PbFieldType.OF)
    ..a<$core.double>(31, _omitFieldNames ? '' : 'cargaCombustivel', $pb.PbFieldType.OF)
    ..a<$core.int>(32, _omitFieldNames ? '' : 'atualizacoesAmc', $pb.PbFieldType.OU3)
    ..a<$core.int>(33, _omitFieldNames ? '' : 'kpaixNaoUsado', $pb.PbFieldType.OU3)
    ..a<$core.double>(34, _omitFieldNames ? '' : 'leituraTpsAdc', $pb.PbFieldType.OF)
    ..a<$core.double>(35, _omitFieldNames ? '' : 'cargaCombustivelAlg2', $pb.PbFieldType.OF)
    ..a<$core.double>(36, _omitFieldNames ? '' : 'cargaIgnicaoAlg1', $pb.PbFieldType.OF)
    ..a<$core.double>(37, _omitFieldNames ? '' : 'cargaIgnicaoAlg2', $pb.PbFieldType.OF)
    ..a<$core.int>(38, _omitFieldNames ? '' : 'contadorSincronismo', $pb.PbFieldType.OU3)
    ..a<$core.double>(39, _omitFieldNames ? '' : 'erroTempoIgnicaoPct', $pb.PbFieldType.OF)
    ..a<$core.int>(40, _omitFieldNames ? '' : 'tempoEntrePulsosUs', $pb.PbFieldType.OU3)
    ..a<$core.int>(41, _omitFieldNames ? '' : 'combustivelParedeUs', $pb.PbFieldType.OU3)
    ..a<$core.double>(42, _omitFieldNames ? '' : 'entradaAnalogica0', $pb.PbFieldType.OF, protoName: 'entrada_analogica_0')
    ..a<$core.double>(43, _omitFieldNames ? '' : 'entradaAnalogica1', $pb.PbFieldType.OF, protoName: 'entrada_analogica_1')
    ..a<$core.double>(44, _omitFieldNames ? '' : 'entradaAnalogica2', $pb.PbFieldType.OF, protoName: 'entrada_analogica_2')
    ..aOB(45, _omitFieldNames ? '' : 'connected')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EcuData clone() => EcuData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EcuData copyWith(void Function(EcuData) updates) => super.copyWith((message) => updates(message as EcuData)) as EcuData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EcuData create() => EcuData._();
  EcuData createEmptyInstance() => create();
  static $pb.PbList<EcuData> createRepeated() => $pb.PbList<EcuData>();
  @$core.pragma('dart2js:noInline')
  static EcuData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EcuData>(create);
  static EcuData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get segundosMotorLigado => $_getN(0);
  @$pb.TagNumber(1)
  set segundosMotorLigado($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSegundosMotorLigado() => $_has(0);
  @$pb.TagNumber(1)
  void clearSegundosMotorLigado() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get largPulsoBancada1 => $_getN(1);
  @$pb.TagNumber(2)
  set largPulsoBancada1($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLargPulsoBancada1() => $_has(1);
  @$pb.TagNumber(2)
  void clearLargPulsoBancada1() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get largPulsoBancada2 => $_getN(2);
  @$pb.TagNumber(3)
  set largPulsoBancada2($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLargPulsoBancada2() => $_has(2);
  @$pb.TagNumber(3)
  void clearLargPulsoBancada2() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get rpm => $_getN(3);
  @$pb.TagNumber(4)
  set rpm($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRpm() => $_has(3);
  @$pb.TagNumber(4)
  void clearRpm() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get avancoIgnicao => $_getN(4);
  @$pb.TagNumber(5)
  set avancoIgnicao($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvancoIgnicao() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvancoIgnicao() => clearField(5);

  @$pb.TagNumber(6)
  StatusMotor get statusMotor => $_getN(5);
  @$pb.TagNumber(6)
  set statusMotor(StatusMotor v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatusMotor() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatusMotor() => clearField(6);
  @$pb.TagNumber(6)
  StatusMotor ensureStatusMotor() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.double get afrAlvoBancada1 => $_getN(6);
  @$pb.TagNumber(7)
  set afrAlvoBancada1($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAfrAlvoBancada1() => $_has(6);
  @$pb.TagNumber(7)
  void clearAfrAlvoBancada1() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get afrAlvoBancada2 => $_getN(7);
  @$pb.TagNumber(8)
  set afrAlvoBancada2($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAfrAlvoBancada2() => $_has(7);
  @$pb.TagNumber(8)
  void clearAfrAlvoBancada2() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get pressaoColetor => $_getN(8);
  @$pb.TagNumber(9)
  set pressaoColetor($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPressaoColetor() => $_has(8);
  @$pb.TagNumber(9)
  void clearPressaoColetor() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get tempArColetor => $_getN(9);
  @$pb.TagNumber(10)
  set tempArColetor($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTempArColetor() => $_has(9);
  @$pb.TagNumber(10)
  void clearTempArColetor() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get tempAgua => $_getN(10);
  @$pb.TagNumber(11)
  set tempAgua($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTempAgua() => $_has(10);
  @$pb.TagNumber(11)
  void clearTempAgua() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get tps => $_getN(11);
  @$pb.TagNumber(12)
  set tps($core.double v) { $_setFloat(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasTps() => $_has(11);
  @$pb.TagNumber(12)
  void clearTps() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get tensaoBateria => $_getN(12);
  @$pb.TagNumber(13)
  set tensaoBateria($core.double v) { $_setFloat(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTensaoBateria() => $_has(12);
  @$pb.TagNumber(13)
  void clearTensaoBateria() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get sondaBanco1 => $_getN(13);
  @$pb.TagNumber(14)
  set sondaBanco1($core.double v) { $_setFloat(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSondaBanco1() => $_has(13);
  @$pb.TagNumber(14)
  void clearSondaBanco1() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get sondaBanco2 => $_getN(14);
  @$pb.TagNumber(15)
  set sondaBanco2($core.double v) { $_setFloat(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSondaBanco2() => $_has(14);
  @$pb.TagNumber(15)
  void clearSondaBanco2() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get correcaoBanco1 => $_getN(15);
  @$pb.TagNumber(16)
  set correcaoBanco1($core.double v) { $_setFloat(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCorrecaoBanco1() => $_has(15);
  @$pb.TagNumber(16)
  void clearCorrecaoBanco1() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get correcaoBanco2 => $_getN(16);
  @$pb.TagNumber(17)
  set correcaoBanco2($core.double v) { $_setFloat(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasCorrecaoBanco2() => $_has(16);
  @$pb.TagNumber(17)
  void clearCorrecaoBanco2() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get correcaoAr => $_getN(17);
  @$pb.TagNumber(18)
  set correcaoAr($core.double v) { $_setFloat(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasCorrecaoAr() => $_has(17);
  @$pb.TagNumber(18)
  void clearCorrecaoAr() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get correcaoAquecimento => $_getN(18);
  @$pb.TagNumber(19)
  set correcaoAquecimento($core.double v) { $_setFloat(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasCorrecaoAquecimento() => $_has(18);
  @$pb.TagNumber(19)
  void clearCorrecaoAquecimento() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get correcaoRapida => $_getN(19);
  @$pb.TagNumber(20)
  set correcaoRapida($core.double v) { $_setFloat(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasCorrecaoRapida() => $_has(19);
  @$pb.TagNumber(20)
  void clearCorrecaoRapida() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get cutoffTps => $_getN(20);
  @$pb.TagNumber(21)
  set cutoffTps($core.double v) { $_setFloat(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasCutoffTps() => $_has(20);
  @$pb.TagNumber(21)
  void clearCutoffTps() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get correcaoCombsBaro => $_getN(21);
  @$pb.TagNumber(22)
  set correcaoCombsBaro($core.double v) { $_setFloat(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasCorrecaoCombsBaro() => $_has(21);
  @$pb.TagNumber(22)
  void clearCorrecaoCombsBaro() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get correcaoCombsTotal => $_getN(22);
  @$pb.TagNumber(23)
  set correcaoCombsTotal($core.double v) { $_setFloat(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasCorrecaoCombsTotal() => $_has(22);
  @$pb.TagNumber(23)
  void clearCorrecaoCombsTotal() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get valorVeBancada1 => $_getN(23);
  @$pb.TagNumber(24)
  set valorVeBancada1($core.double v) { $_setFloat(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasValorVeBancada1() => $_has(23);
  @$pb.TagNumber(24)
  void clearValorVeBancada1() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get valorVeBancada2 => $_getN(24);
  @$pb.TagNumber(25)
  set valorVeBancada2($core.double v) { $_setFloat(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasValorVeBancada2() => $_has(24);
  @$pb.TagNumber(25)
  void clearValorVeBancada2() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get controleMarchaLenta => $_getN(25);
  @$pb.TagNumber(26)
  set controleMarchaLenta($core.double v) { $_setFloat(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasControleMarchaLenta() => $_has(25);
  @$pb.TagNumber(26)
  void clearControleMarchaLenta() => clearField(26);

  @$pb.TagNumber(27)
  $core.double get avancoIgnicaoFrio => $_getN(26);
  @$pb.TagNumber(27)
  set avancoIgnicaoFrio($core.double v) { $_setFloat(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasAvancoIgnicaoFrio() => $_has(26);
  @$pb.TagNumber(27)
  void clearAvancoIgnicaoFrio() => clearField(27);

  @$pb.TagNumber(28)
  $core.double get tpsVariacao => $_getN(27);
  @$pb.TagNumber(28)
  set tpsVariacao($core.double v) { $_setFloat(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasTpsVariacao() => $_has(27);
  @$pb.TagNumber(28)
  void clearTpsVariacao() => clearField(28);

  @$pb.TagNumber(29)
  $core.double get mapVariacao => $_getN(28);
  @$pb.TagNumber(29)
  set mapVariacao($core.double v) { $_setFloat(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasMapVariacao() => $_has(28);
  @$pb.TagNumber(29)
  void clearMapVariacao() => clearField(29);

  @$pb.TagNumber(30)
  $core.double get dwell => $_getN(29);
  @$pb.TagNumber(30)
  set dwell($core.double v) { $_setFloat(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasDwell() => $_has(29);
  @$pb.TagNumber(30)
  void clearDwell() => clearField(30);

  @$pb.TagNumber(31)
  $core.double get cargaCombustivel => $_getN(30);
  @$pb.TagNumber(31)
  set cargaCombustivel($core.double v) { $_setFloat(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasCargaCombustivel() => $_has(30);
  @$pb.TagNumber(31)
  void clearCargaCombustivel() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get atualizacoesAmc => $_getIZ(31);
  @$pb.TagNumber(32)
  set atualizacoesAmc($core.int v) { $_setUnsignedInt32(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasAtualizacoesAmc() => $_has(31);
  @$pb.TagNumber(32)
  void clearAtualizacoesAmc() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get kpaixNaoUsado => $_getIZ(32);
  @$pb.TagNumber(33)
  set kpaixNaoUsado($core.int v) { $_setUnsignedInt32(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasKpaixNaoUsado() => $_has(32);
  @$pb.TagNumber(33)
  void clearKpaixNaoUsado() => clearField(33);

  @$pb.TagNumber(34)
  $core.double get leituraTpsAdc => $_getN(33);
  @$pb.TagNumber(34)
  set leituraTpsAdc($core.double v) { $_setFloat(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasLeituraTpsAdc() => $_has(33);
  @$pb.TagNumber(34)
  void clearLeituraTpsAdc() => clearField(34);

  @$pb.TagNumber(35)
  $core.double get cargaCombustivelAlg2 => $_getN(34);
  @$pb.TagNumber(35)
  set cargaCombustivelAlg2($core.double v) { $_setFloat(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasCargaCombustivelAlg2() => $_has(34);
  @$pb.TagNumber(35)
  void clearCargaCombustivelAlg2() => clearField(35);

  @$pb.TagNumber(36)
  $core.double get cargaIgnicaoAlg1 => $_getN(35);
  @$pb.TagNumber(36)
  set cargaIgnicaoAlg1($core.double v) { $_setFloat(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasCargaIgnicaoAlg1() => $_has(35);
  @$pb.TagNumber(36)
  void clearCargaIgnicaoAlg1() => clearField(36);

  @$pb.TagNumber(37)
  $core.double get cargaIgnicaoAlg2 => $_getN(36);
  @$pb.TagNumber(37)
  set cargaIgnicaoAlg2($core.double v) { $_setFloat(36, v); }
  @$pb.TagNumber(37)
  $core.bool hasCargaIgnicaoAlg2() => $_has(36);
  @$pb.TagNumber(37)
  void clearCargaIgnicaoAlg2() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get contadorSincronismo => $_getIZ(37);
  @$pb.TagNumber(38)
  set contadorSincronismo($core.int v) { $_setUnsignedInt32(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasContadorSincronismo() => $_has(37);
  @$pb.TagNumber(38)
  void clearContadorSincronismo() => clearField(38);

  @$pb.TagNumber(39)
  $core.double get erroTempoIgnicaoPct => $_getN(38);
  @$pb.TagNumber(39)
  set erroTempoIgnicaoPct($core.double v) { $_setFloat(38, v); }
  @$pb.TagNumber(39)
  $core.bool hasErroTempoIgnicaoPct() => $_has(38);
  @$pb.TagNumber(39)
  void clearErroTempoIgnicaoPct() => clearField(39);

  @$pb.TagNumber(40)
  $core.int get tempoEntrePulsosUs => $_getIZ(39);
  @$pb.TagNumber(40)
  set tempoEntrePulsosUs($core.int v) { $_setUnsignedInt32(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasTempoEntrePulsosUs() => $_has(39);
  @$pb.TagNumber(40)
  void clearTempoEntrePulsosUs() => clearField(40);

  @$pb.TagNumber(41)
  $core.int get combustivelParedeUs => $_getIZ(40);
  @$pb.TagNumber(41)
  set combustivelParedeUs($core.int v) { $_setUnsignedInt32(40, v); }
  @$pb.TagNumber(41)
  $core.bool hasCombustivelParedeUs() => $_has(40);
  @$pb.TagNumber(41)
  void clearCombustivelParedeUs() => clearField(41);

  @$pb.TagNumber(42)
  $core.double get entradaAnalogica0 => $_getN(41);
  @$pb.TagNumber(42)
  set entradaAnalogica0($core.double v) { $_setFloat(41, v); }
  @$pb.TagNumber(42)
  $core.bool hasEntradaAnalogica0() => $_has(41);
  @$pb.TagNumber(42)
  void clearEntradaAnalogica0() => clearField(42);

  @$pb.TagNumber(43)
  $core.double get entradaAnalogica1 => $_getN(42);
  @$pb.TagNumber(43)
  set entradaAnalogica1($core.double v) { $_setFloat(42, v); }
  @$pb.TagNumber(43)
  $core.bool hasEntradaAnalogica1() => $_has(42);
  @$pb.TagNumber(43)
  void clearEntradaAnalogica1() => clearField(43);

  @$pb.TagNumber(44)
  $core.double get entradaAnalogica2 => $_getN(43);
  @$pb.TagNumber(44)
  set entradaAnalogica2($core.double v) { $_setFloat(43, v); }
  @$pb.TagNumber(44)
  $core.bool hasEntradaAnalogica2() => $_has(43);
  @$pb.TagNumber(44)
  void clearEntradaAnalogica2() => clearField(44);

  @$pb.TagNumber(45)
  $core.bool get connected => $_getBF(44);
  @$pb.TagNumber(45)
  set connected($core.bool v) { $_setBool(44, v); }
  @$pb.TagNumber(45)
  $core.bool hasConnected() => $_has(44);
  @$pb.TagNumber(45)
  void clearConnected() => clearField(45);
}

class StatusMotor extends $pb.GeneratedMessage {
  factory StatusMotor({
    $core.bool? motorParado,
    $core.bool? motorEmFuncionamento,
    $core.bool? sincronismoOk,
    $core.bool? aquecendo,
    $core.bool? corteCombustivelAtivo,
    $core.bool? injetandoCombustivel,
    $core.bool? ignicaoAtiva,
    $core.bool? erroDetectado,
  }) {
    final $result = create();
    if (motorParado != null) {
      $result.motorParado = motorParado;
    }
    if (motorEmFuncionamento != null) {
      $result.motorEmFuncionamento = motorEmFuncionamento;
    }
    if (sincronismoOk != null) {
      $result.sincronismoOk = sincronismoOk;
    }
    if (aquecendo != null) {
      $result.aquecendo = aquecendo;
    }
    if (corteCombustivelAtivo != null) {
      $result.corteCombustivelAtivo = corteCombustivelAtivo;
    }
    if (injetandoCombustivel != null) {
      $result.injetandoCombustivel = injetandoCombustivel;
    }
    if (ignicaoAtiva != null) {
      $result.ignicaoAtiva = ignicaoAtiva;
    }
    if (erroDetectado != null) {
      $result.erroDetectado = erroDetectado;
    }
    return $result;
  }
  StatusMotor._() : super();
  factory StatusMotor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatusMotor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StatusMotor', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'motorParado')
    ..aOB(2, _omitFieldNames ? '' : 'motorEmFuncionamento')
    ..aOB(3, _omitFieldNames ? '' : 'sincronismoOk')
    ..aOB(4, _omitFieldNames ? '' : 'aquecendo')
    ..aOB(5, _omitFieldNames ? '' : 'corteCombustivelAtivo')
    ..aOB(6, _omitFieldNames ? '' : 'injetandoCombustivel')
    ..aOB(7, _omitFieldNames ? '' : 'ignicaoAtiva')
    ..aOB(8, _omitFieldNames ? '' : 'erroDetectado')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatusMotor clone() => StatusMotor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatusMotor copyWith(void Function(StatusMotor) updates) => super.copyWith((message) => updates(message as StatusMotor)) as StatusMotor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StatusMotor create() => StatusMotor._();
  StatusMotor createEmptyInstance() => create();
  static $pb.PbList<StatusMotor> createRepeated() => $pb.PbList<StatusMotor>();
  @$core.pragma('dart2js:noInline')
  static StatusMotor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatusMotor>(create);
  static StatusMotor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get motorParado => $_getBF(0);
  @$pb.TagNumber(1)
  set motorParado($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMotorParado() => $_has(0);
  @$pb.TagNumber(1)
  void clearMotorParado() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get motorEmFuncionamento => $_getBF(1);
  @$pb.TagNumber(2)
  set motorEmFuncionamento($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotorEmFuncionamento() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotorEmFuncionamento() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get sincronismoOk => $_getBF(2);
  @$pb.TagNumber(3)
  set sincronismoOk($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSincronismoOk() => $_has(2);
  @$pb.TagNumber(3)
  void clearSincronismoOk() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get aquecendo => $_getBF(3);
  @$pb.TagNumber(4)
  set aquecendo($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAquecendo() => $_has(3);
  @$pb.TagNumber(4)
  void clearAquecendo() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get corteCombustivelAtivo => $_getBF(4);
  @$pb.TagNumber(5)
  set corteCombustivelAtivo($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCorteCombustivelAtivo() => $_has(4);
  @$pb.TagNumber(5)
  void clearCorteCombustivelAtivo() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get injetandoCombustivel => $_getBF(5);
  @$pb.TagNumber(6)
  set injetandoCombustivel($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInjetandoCombustivel() => $_has(5);
  @$pb.TagNumber(6)
  void clearInjetandoCombustivel() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get ignicaoAtiva => $_getBF(6);
  @$pb.TagNumber(7)
  set ignicaoAtiva($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIgnicaoAtiva() => $_has(6);
  @$pb.TagNumber(7)
  void clearIgnicaoAtiva() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get erroDetectado => $_getBF(7);
  @$pb.TagNumber(8)
  set erroDetectado($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasErroDetectado() => $_has(7);
  @$pb.TagNumber(8)
  void clearErroDetectado() => clearField(8);
}

class StreamData extends $pb.GeneratedMessage {
  factory StreamData({
    EcuData? ecuData,
  }) {
    final $result = create();
    if (ecuData != null) {
      $result.ecuData = ecuData;
    }
    return $result;
  }
  StreamData._() : super();
  factory StreamData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamData', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOM<EcuData>(1, _omitFieldNames ? '' : 'ecuData', subBuilder: EcuData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamData clone() => StreamData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamData copyWith(void Function(StreamData) updates) => super.copyWith((message) => updates(message as StreamData)) as StreamData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamData create() => StreamData._();
  StreamData createEmptyInstance() => create();
  static $pb.PbList<StreamData> createRepeated() => $pb.PbList<StreamData>();
  @$core.pragma('dart2js:noInline')
  static StreamData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamData>(create);
  static StreamData? _defaultInstance;

  @$pb.TagNumber(1)
  EcuData get ecuData => $_getN(0);
  @$pb.TagNumber(1)
  set ecuData(EcuData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEcuData() => $_has(0);
  @$pb.TagNumber(1)
  void clearEcuData() => clearField(1);
  @$pb.TagNumber(1)
  EcuData ensureEcuData() => $_ensure(0);
}

class Device extends $pb.GeneratedMessage {
  factory Device({
    $core.String? name,
    $core.String? address,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  Device._() : super();
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Device', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class DeviceList extends $pb.GeneratedMessage {
  factory DeviceList({
    $core.Iterable<Device>? devices,
  }) {
    final $result = create();
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    return $result;
  }
  DeviceList._() : super();
  factory DeviceList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceList', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..pc<Device>(1, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceList clone() => DeviceList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceList copyWith(void Function(DeviceList) updates) => super.copyWith((message) => updates(message as DeviceList)) as DeviceList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceList create() => DeviceList._();
  DeviceList createEmptyInstance() => create();
  static $pb.PbList<DeviceList> createRepeated() => $pb.PbList<DeviceList>();
  @$core.pragma('dart2js:noInline')
  static DeviceList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceList>(create);
  static DeviceList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Device> get devices => $_getList(0);
}

class ActionResult extends $pb.GeneratedMessage {
  factory ActionResult({
    $core.bool? result,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    return $result;
  }
  ActionResult._() : super();
  factory ActionResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActionResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActionResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActionResult clone() => ActionResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActionResult copyWith(void Function(ActionResult) updates) => super.copyWith((message) => updates(message as ActionResult)) as ActionResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionResult create() => ActionResult._();
  ActionResult createEmptyInstance() => create();
  static $pb.PbList<ActionResult> createRepeated() => $pb.PbList<ActionResult>();
  @$core.pragma('dart2js:noInline')
  static ActionResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActionResult>(create);
  static ActionResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
