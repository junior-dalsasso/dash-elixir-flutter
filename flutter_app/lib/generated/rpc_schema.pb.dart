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

/// EcuData Info Structures
class EcuData extends $pb.GeneratedMessage {
  factory EcuData({
    $core.double? mapKpa,
    $core.double? mapBar,
    $core.double? mapPsi,
    $core.double? matCelsius,
    $core.double? batteryVoltage,
    $core.double? rpm,
    $core.double? coolant,
    $core.double? tps,
    $core.bool? connected,
  }) {
    final $result = create();
    if (mapKpa != null) {
      $result.mapKpa = mapKpa;
    }
    if (mapBar != null) {
      $result.mapBar = mapBar;
    }
    if (mapPsi != null) {
      $result.mapPsi = mapPsi;
    }
    if (matCelsius != null) {
      $result.matCelsius = matCelsius;
    }
    if (batteryVoltage != null) {
      $result.batteryVoltage = batteryVoltage;
    }
    if (rpm != null) {
      $result.rpm = rpm;
    }
    if (coolant != null) {
      $result.coolant = coolant;
    }
    if (tps != null) {
      $result.tps = tps;
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
    ..a<$core.double>(1, _omitFieldNames ? '' : 'mapKpa', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'mapBar', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'mapPsi', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'matCelsius', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'batteryVoltage', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'rpm', $pb.PbFieldType.OF)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'coolant', $pb.PbFieldType.OF)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'tps', $pb.PbFieldType.OF)
    ..aOB(9, _omitFieldNames ? '' : 'connected')
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
  $core.double get mapKpa => $_getN(0);
  @$pb.TagNumber(1)
  set mapKpa($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMapKpa() => $_has(0);
  @$pb.TagNumber(1)
  void clearMapKpa() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get mapBar => $_getN(1);
  @$pb.TagNumber(2)
  set mapBar($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMapBar() => $_has(1);
  @$pb.TagNumber(2)
  void clearMapBar() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get mapPsi => $_getN(2);
  @$pb.TagNumber(3)
  set mapPsi($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMapPsi() => $_has(2);
  @$pb.TagNumber(3)
  void clearMapPsi() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get matCelsius => $_getN(3);
  @$pb.TagNumber(4)
  set matCelsius($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMatCelsius() => $_has(3);
  @$pb.TagNumber(4)
  void clearMatCelsius() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get batteryVoltage => $_getN(4);
  @$pb.TagNumber(5)
  set batteryVoltage($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBatteryVoltage() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatteryVoltage() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get rpm => $_getN(5);
  @$pb.TagNumber(6)
  set rpm($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRpm() => $_has(5);
  @$pb.TagNumber(6)
  void clearRpm() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get coolant => $_getN(6);
  @$pb.TagNumber(7)
  set coolant($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCoolant() => $_has(6);
  @$pb.TagNumber(7)
  void clearCoolant() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get tps => $_getN(7);
  @$pb.TagNumber(8)
  set tps($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTps() => $_has(7);
  @$pb.TagNumber(8)
  void clearTps() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get connected => $_getBF(8);
  @$pb.TagNumber(9)
  set connected($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasConnected() => $_has(8);
  @$pb.TagNumber(9)
  void clearConnected() => clearField(9);
}

class RpiInfo extends $pb.GeneratedMessage {
  factory RpiInfo({
    $core.double? batteryPerc,
  }) {
    final $result = create();
    if (batteryPerc != null) {
      $result.batteryPerc = batteryPerc;
    }
    return $result;
  }
  RpiInfo._() : super();
  factory RpiInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RpiInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RpiInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'batteryPerc', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RpiInfo clone() => RpiInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RpiInfo copyWith(void Function(RpiInfo) updates) => super.copyWith((message) => updates(message as RpiInfo)) as RpiInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpiInfo create() => RpiInfo._();
  RpiInfo createEmptyInstance() => create();
  static $pb.PbList<RpiInfo> createRepeated() => $pb.PbList<RpiInfo>();
  @$core.pragma('dart2js:noInline')
  static RpiInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RpiInfo>(create);
  static RpiInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get batteryPerc => $_getN(0);
  @$pb.TagNumber(1)
  set batteryPerc($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBatteryPerc() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatteryPerc() => clearField(1);
}

class StreamData extends $pb.GeneratedMessage {
  factory StreamData({
    EcuData? ecuData,
    RpiInfo? rpiInfo,
  }) {
    final $result = create();
    if (ecuData != null) {
      $result.ecuData = ecuData;
    }
    if (rpiInfo != null) {
      $result.rpiInfo = rpiInfo;
    }
    return $result;
  }
  StreamData._() : super();
  factory StreamData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamData', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOM<EcuData>(1, _omitFieldNames ? '' : 'ecuData', subBuilder: EcuData.create)
    ..aOM<RpiInfo>(2, _omitFieldNames ? '' : 'rpiInfo', subBuilder: RpiInfo.create)
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

  @$pb.TagNumber(2)
  RpiInfo get rpiInfo => $_getN(1);
  @$pb.TagNumber(2)
  set rpiInfo(RpiInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRpiInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRpiInfo() => clearField(2);
  @$pb.TagNumber(2)
  RpiInfo ensureRpiInfo() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
