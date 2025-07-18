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
    $core.double? seconds,
    $core.double? pulseWidth1,
    $core.double? pulseWidth2,
    $core.double? rpm,
    $core.double? advance,
    $core.double? squirt,
    StatusMotor? engine,
    $core.double? afrtgt1,
    $core.double? afrtgt2,
    $core.double? wbo2En1,
    $core.double? wbo2En2,
    $core.double? barometer,
    $core.double? map,
    $core.double? mat,
    $core.double? coolant,
    $core.double? tps,
    $core.double? batteryVoltage,
    $core.double? afr1,
    $core.double? afr2,
    $core.double? knock,
    $core.double? egoCorrection1,
    $core.double? egoCorrection2,
    $core.double? airCorrection,
    $core.double? warmupEnrich,
    $core.double? accelEnrich,
    $core.double? tpsfuelcut,
    $core.double? baroCorrection,
    $core.double? gammaEnrich,
    $core.double? veCurr1,
    $core.double? veCurr2,
    $core.double? iacstep,
    $core.double? coldAdvDeg,
    $core.double? tpsDot,
    $core.double? mapDot,
    $core.double? dwell,
    $core.double? mafload,
    $core.double? fuelload,
    $core.double? fuelCorrection,
    $core.double? portStatus,
    $core.double? knockRetard,
    $core.double? eaeFuelCorr1,
    $core.double? egoV,
    $core.double? egoV2,
    $core.double? status1,
    $core.double? status2,
    $core.double? status3,
    $core.double? status4,
    $core.double? looptime,
    $core.double? status5,
    $core.double? tpsADC,
    $core.double? fuelload2,
    $core.double? ignload,
    $core.double? ignload2,
    $core.double? synccnt,
    $core.double? timingErr,
    $core.double? deltaT,
    $core.double? wallfuel1,
    $core.double? wallfuel2,
    $core.double? eaeFuelCorr2,
    $core.double? boostduty,
    $core.double? syncreason,
    $core.double? user0,
    $core.double? injAdv1,
    $core.double? injAdv2,
    $core.double? pulseWidth3,
    $core.double? pulseWidth4,
    $core.double? vetrim1curr,
    $core.double? vetrim2curr,
    $core.double? vetrim3curr,
    $core.double? vetrim4curr,
    $core.double? maf,
    $core.double? eaeload1,
    $core.double? afrload1,
    $core.double? rpmDot,
    $core.double? gpioport0,
    $core.double? gpioport1,
    $core.double? gpioport2,
    $core.double? clIdleTargRpm,
    $core.double? mafVolts,
    $core.double? airtemp,
    $core.double? dwellTrl,
    $core.double? fuelPct,
    $core.double? boostTarg,
    $core.double? extAdvance,
    $core.double? baseAdvance,
    $core.double? idleCorAdvance,
    $core.double? matRetard,
    $core.double? flexAdvance,
    $core.double? adv1,
    $core.double? adv2,
    $core.double? adv3,
    $core.double? revlimRetard,
    $core.double? nitrousRetard,
    $core.double? deadtime1,
    $core.double? n2oAddfuel,
    $core.double? portbde,
    $core.double? portam,
    $core.double? portt,
    $core.double? canErrorCnt,
    $core.double? canError,
    $core.double? oil,
    $core.double? fuel,
    $core.double? runsecs,
    $core.double? startRetard,
    $core.bool? connected,
  }) {
    final $result = create();
    if (seconds != null) {
      $result.seconds = seconds;
    }
    if (pulseWidth1 != null) {
      $result.pulseWidth1 = pulseWidth1;
    }
    if (pulseWidth2 != null) {
      $result.pulseWidth2 = pulseWidth2;
    }
    if (rpm != null) {
      $result.rpm = rpm;
    }
    if (advance != null) {
      $result.advance = advance;
    }
    if (squirt != null) {
      $result.squirt = squirt;
    }
    if (engine != null) {
      $result.engine = engine;
    }
    if (afrtgt1 != null) {
      $result.afrtgt1 = afrtgt1;
    }
    if (afrtgt2 != null) {
      $result.afrtgt2 = afrtgt2;
    }
    if (wbo2En1 != null) {
      $result.wbo2En1 = wbo2En1;
    }
    if (wbo2En2 != null) {
      $result.wbo2En2 = wbo2En2;
    }
    if (barometer != null) {
      $result.barometer = barometer;
    }
    if (map != null) {
      $result.map = map;
    }
    if (mat != null) {
      $result.mat = mat;
    }
    if (coolant != null) {
      $result.coolant = coolant;
    }
    if (tps != null) {
      $result.tps = tps;
    }
    if (batteryVoltage != null) {
      $result.batteryVoltage = batteryVoltage;
    }
    if (afr1 != null) {
      $result.afr1 = afr1;
    }
    if (afr2 != null) {
      $result.afr2 = afr2;
    }
    if (knock != null) {
      $result.knock = knock;
    }
    if (egoCorrection1 != null) {
      $result.egoCorrection1 = egoCorrection1;
    }
    if (egoCorrection2 != null) {
      $result.egoCorrection2 = egoCorrection2;
    }
    if (airCorrection != null) {
      $result.airCorrection = airCorrection;
    }
    if (warmupEnrich != null) {
      $result.warmupEnrich = warmupEnrich;
    }
    if (accelEnrich != null) {
      $result.accelEnrich = accelEnrich;
    }
    if (tpsfuelcut != null) {
      $result.tpsfuelcut = tpsfuelcut;
    }
    if (baroCorrection != null) {
      $result.baroCorrection = baroCorrection;
    }
    if (gammaEnrich != null) {
      $result.gammaEnrich = gammaEnrich;
    }
    if (veCurr1 != null) {
      $result.veCurr1 = veCurr1;
    }
    if (veCurr2 != null) {
      $result.veCurr2 = veCurr2;
    }
    if (iacstep != null) {
      $result.iacstep = iacstep;
    }
    if (coldAdvDeg != null) {
      $result.coldAdvDeg = coldAdvDeg;
    }
    if (tpsDot != null) {
      $result.tpsDot = tpsDot;
    }
    if (mapDot != null) {
      $result.mapDot = mapDot;
    }
    if (dwell != null) {
      $result.dwell = dwell;
    }
    if (mafload != null) {
      $result.mafload = mafload;
    }
    if (fuelload != null) {
      $result.fuelload = fuelload;
    }
    if (fuelCorrection != null) {
      $result.fuelCorrection = fuelCorrection;
    }
    if (portStatus != null) {
      $result.portStatus = portStatus;
    }
    if (knockRetard != null) {
      $result.knockRetard = knockRetard;
    }
    if (eaeFuelCorr1 != null) {
      $result.eaeFuelCorr1 = eaeFuelCorr1;
    }
    if (egoV != null) {
      $result.egoV = egoV;
    }
    if (egoV2 != null) {
      $result.egoV2 = egoV2;
    }
    if (status1 != null) {
      $result.status1 = status1;
    }
    if (status2 != null) {
      $result.status2 = status2;
    }
    if (status3 != null) {
      $result.status3 = status3;
    }
    if (status4 != null) {
      $result.status4 = status4;
    }
    if (looptime != null) {
      $result.looptime = looptime;
    }
    if (status5 != null) {
      $result.status5 = status5;
    }
    if (tpsADC != null) {
      $result.tpsADC = tpsADC;
    }
    if (fuelload2 != null) {
      $result.fuelload2 = fuelload2;
    }
    if (ignload != null) {
      $result.ignload = ignload;
    }
    if (ignload2 != null) {
      $result.ignload2 = ignload2;
    }
    if (synccnt != null) {
      $result.synccnt = synccnt;
    }
    if (timingErr != null) {
      $result.timingErr = timingErr;
    }
    if (deltaT != null) {
      $result.deltaT = deltaT;
    }
    if (wallfuel1 != null) {
      $result.wallfuel1 = wallfuel1;
    }
    if (wallfuel2 != null) {
      $result.wallfuel2 = wallfuel2;
    }
    if (eaeFuelCorr2 != null) {
      $result.eaeFuelCorr2 = eaeFuelCorr2;
    }
    if (boostduty != null) {
      $result.boostduty = boostduty;
    }
    if (syncreason != null) {
      $result.syncreason = syncreason;
    }
    if (user0 != null) {
      $result.user0 = user0;
    }
    if (injAdv1 != null) {
      $result.injAdv1 = injAdv1;
    }
    if (injAdv2 != null) {
      $result.injAdv2 = injAdv2;
    }
    if (pulseWidth3 != null) {
      $result.pulseWidth3 = pulseWidth3;
    }
    if (pulseWidth4 != null) {
      $result.pulseWidth4 = pulseWidth4;
    }
    if (vetrim1curr != null) {
      $result.vetrim1curr = vetrim1curr;
    }
    if (vetrim2curr != null) {
      $result.vetrim2curr = vetrim2curr;
    }
    if (vetrim3curr != null) {
      $result.vetrim3curr = vetrim3curr;
    }
    if (vetrim4curr != null) {
      $result.vetrim4curr = vetrim4curr;
    }
    if (maf != null) {
      $result.maf = maf;
    }
    if (eaeload1 != null) {
      $result.eaeload1 = eaeload1;
    }
    if (afrload1 != null) {
      $result.afrload1 = afrload1;
    }
    if (rpmDot != null) {
      $result.rpmDot = rpmDot;
    }
    if (gpioport0 != null) {
      $result.gpioport0 = gpioport0;
    }
    if (gpioport1 != null) {
      $result.gpioport1 = gpioport1;
    }
    if (gpioport2 != null) {
      $result.gpioport2 = gpioport2;
    }
    if (clIdleTargRpm != null) {
      $result.clIdleTargRpm = clIdleTargRpm;
    }
    if (mafVolts != null) {
      $result.mafVolts = mafVolts;
    }
    if (airtemp != null) {
      $result.airtemp = airtemp;
    }
    if (dwellTrl != null) {
      $result.dwellTrl = dwellTrl;
    }
    if (fuelPct != null) {
      $result.fuelPct = fuelPct;
    }
    if (boostTarg != null) {
      $result.boostTarg = boostTarg;
    }
    if (extAdvance != null) {
      $result.extAdvance = extAdvance;
    }
    if (baseAdvance != null) {
      $result.baseAdvance = baseAdvance;
    }
    if (idleCorAdvance != null) {
      $result.idleCorAdvance = idleCorAdvance;
    }
    if (matRetard != null) {
      $result.matRetard = matRetard;
    }
    if (flexAdvance != null) {
      $result.flexAdvance = flexAdvance;
    }
    if (adv1 != null) {
      $result.adv1 = adv1;
    }
    if (adv2 != null) {
      $result.adv2 = adv2;
    }
    if (adv3 != null) {
      $result.adv3 = adv3;
    }
    if (revlimRetard != null) {
      $result.revlimRetard = revlimRetard;
    }
    if (nitrousRetard != null) {
      $result.nitrousRetard = nitrousRetard;
    }
    if (deadtime1 != null) {
      $result.deadtime1 = deadtime1;
    }
    if (n2oAddfuel != null) {
      $result.n2oAddfuel = n2oAddfuel;
    }
    if (portbde != null) {
      $result.portbde = portbde;
    }
    if (portam != null) {
      $result.portam = portam;
    }
    if (portt != null) {
      $result.portt = portt;
    }
    if (canErrorCnt != null) {
      $result.canErrorCnt = canErrorCnt;
    }
    if (canError != null) {
      $result.canError = canError;
    }
    if (oil != null) {
      $result.oil = oil;
    }
    if (fuel != null) {
      $result.fuel = fuel;
    }
    if (runsecs != null) {
      $result.runsecs = runsecs;
    }
    if (startRetard != null) {
      $result.startRetard = startRetard;
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
    ..a<$core.double>(1, _omitFieldNames ? '' : 'seconds', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'pulseWidth1', $pb.PbFieldType.OF, protoName: 'pulseWidth1')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'pulseWidth2', $pb.PbFieldType.OF, protoName: 'pulseWidth2')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'rpm', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'advance', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'squirt', $pb.PbFieldType.OF)
    ..aOM<StatusMotor>(7, _omitFieldNames ? '' : 'engine', subBuilder: StatusMotor.create)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'afrtgt1', $pb.PbFieldType.OF)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'afrtgt2', $pb.PbFieldType.OF)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'wbo2En1', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'wbo2En2', $pb.PbFieldType.OF)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'barometer', $pb.PbFieldType.OF)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'map', $pb.PbFieldType.OF)
    ..a<$core.double>(14, _omitFieldNames ? '' : 'mat', $pb.PbFieldType.OF)
    ..a<$core.double>(15, _omitFieldNames ? '' : 'coolant', $pb.PbFieldType.OF)
    ..a<$core.double>(16, _omitFieldNames ? '' : 'tps', $pb.PbFieldType.OF)
    ..a<$core.double>(17, _omitFieldNames ? '' : 'batteryVoltage', $pb.PbFieldType.OF, protoName: 'batteryVoltage')
    ..a<$core.double>(18, _omitFieldNames ? '' : 'afr1', $pb.PbFieldType.OF)
    ..a<$core.double>(19, _omitFieldNames ? '' : 'afr2', $pb.PbFieldType.OF)
    ..a<$core.double>(20, _omitFieldNames ? '' : 'knock', $pb.PbFieldType.OF)
    ..a<$core.double>(21, _omitFieldNames ? '' : 'egoCorrection1', $pb.PbFieldType.OF, protoName: 'egoCorrection1')
    ..a<$core.double>(22, _omitFieldNames ? '' : 'egoCorrection2', $pb.PbFieldType.OF, protoName: 'egoCorrection2')
    ..a<$core.double>(23, _omitFieldNames ? '' : 'airCorrection', $pb.PbFieldType.OF, protoName: 'airCorrection')
    ..a<$core.double>(24, _omitFieldNames ? '' : 'warmupEnrich', $pb.PbFieldType.OF, protoName: 'warmupEnrich')
    ..a<$core.double>(25, _omitFieldNames ? '' : 'accelEnrich', $pb.PbFieldType.OF, protoName: 'accelEnrich')
    ..a<$core.double>(26, _omitFieldNames ? '' : 'tpsfuelcut', $pb.PbFieldType.OF)
    ..a<$core.double>(27, _omitFieldNames ? '' : 'baroCorrection', $pb.PbFieldType.OF, protoName: 'baroCorrection')
    ..a<$core.double>(28, _omitFieldNames ? '' : 'gammaEnrich', $pb.PbFieldType.OF, protoName: 'gammaEnrich')
    ..a<$core.double>(29, _omitFieldNames ? '' : 'veCurr1', $pb.PbFieldType.OF, protoName: 'veCurr1')
    ..a<$core.double>(30, _omitFieldNames ? '' : 'veCurr2', $pb.PbFieldType.OF, protoName: 'veCurr2')
    ..a<$core.double>(31, _omitFieldNames ? '' : 'iacstep', $pb.PbFieldType.OF)
    ..a<$core.double>(32, _omitFieldNames ? '' : 'coldAdvDeg', $pb.PbFieldType.OF, protoName: 'coldAdvDeg')
    ..a<$core.double>(33, _omitFieldNames ? '' : 'tpsDot', $pb.PbFieldType.OF, protoName: 'tpsDot')
    ..a<$core.double>(34, _omitFieldNames ? '' : 'mapDot', $pb.PbFieldType.OF, protoName: 'mapDot')
    ..a<$core.double>(35, _omitFieldNames ? '' : 'dwell', $pb.PbFieldType.OF)
    ..a<$core.double>(36, _omitFieldNames ? '' : 'mafload', $pb.PbFieldType.OF)
    ..a<$core.double>(37, _omitFieldNames ? '' : 'fuelload', $pb.PbFieldType.OF)
    ..a<$core.double>(38, _omitFieldNames ? '' : 'fuelCorrection', $pb.PbFieldType.OF, protoName: 'fuelCorrection')
    ..a<$core.double>(39, _omitFieldNames ? '' : 'portStatus', $pb.PbFieldType.OF, protoName: 'portStatus')
    ..a<$core.double>(40, _omitFieldNames ? '' : 'knockRetard', $pb.PbFieldType.OF, protoName: 'knockRetard')
    ..a<$core.double>(41, _omitFieldNames ? '' : 'eaeFuelCorr1', $pb.PbFieldType.OF, protoName: 'eaeFuelCorr1')
    ..a<$core.double>(42, _omitFieldNames ? '' : 'egoV', $pb.PbFieldType.OF, protoName: 'egoV')
    ..a<$core.double>(43, _omitFieldNames ? '' : 'egoV2', $pb.PbFieldType.OF, protoName: 'egoV2')
    ..a<$core.double>(44, _omitFieldNames ? '' : 'status1', $pb.PbFieldType.OF)
    ..a<$core.double>(45, _omitFieldNames ? '' : 'status2', $pb.PbFieldType.OF)
    ..a<$core.double>(46, _omitFieldNames ? '' : 'status3', $pb.PbFieldType.OF)
    ..a<$core.double>(47, _omitFieldNames ? '' : 'status4', $pb.PbFieldType.OF)
    ..a<$core.double>(48, _omitFieldNames ? '' : 'looptime', $pb.PbFieldType.OF)
    ..a<$core.double>(49, _omitFieldNames ? '' : 'status5', $pb.PbFieldType.OF)
    ..a<$core.double>(50, _omitFieldNames ? '' : 'tpsADC', $pb.PbFieldType.OF, protoName: 'tpsADC')
    ..a<$core.double>(51, _omitFieldNames ? '' : 'fuelload2', $pb.PbFieldType.OF)
    ..a<$core.double>(52, _omitFieldNames ? '' : 'ignload', $pb.PbFieldType.OF)
    ..a<$core.double>(53, _omitFieldNames ? '' : 'ignload2', $pb.PbFieldType.OF)
    ..a<$core.double>(54, _omitFieldNames ? '' : 'synccnt', $pb.PbFieldType.OF)
    ..a<$core.double>(55, _omitFieldNames ? '' : 'timingErr', $pb.PbFieldType.OF)
    ..a<$core.double>(56, _omitFieldNames ? '' : 'deltaT', $pb.PbFieldType.OF, protoName: 'deltaT')
    ..a<$core.double>(57, _omitFieldNames ? '' : 'wallfuel1', $pb.PbFieldType.OF)
    ..a<$core.double>(58, _omitFieldNames ? '' : 'wallfuel2', $pb.PbFieldType.OF)
    ..a<$core.double>(59, _omitFieldNames ? '' : 'eaeFuelCorr2', $pb.PbFieldType.OF, protoName: 'eaeFuelCorr2')
    ..a<$core.double>(60, _omitFieldNames ? '' : 'boostduty', $pb.PbFieldType.OF)
    ..a<$core.double>(61, _omitFieldNames ? '' : 'syncreason', $pb.PbFieldType.OF)
    ..a<$core.double>(62, _omitFieldNames ? '' : 'user0', $pb.PbFieldType.OF)
    ..a<$core.double>(63, _omitFieldNames ? '' : 'injAdv1', $pb.PbFieldType.OF)
    ..a<$core.double>(64, _omitFieldNames ? '' : 'injAdv2', $pb.PbFieldType.OF)
    ..a<$core.double>(65, _omitFieldNames ? '' : 'pulseWidth3', $pb.PbFieldType.OF, protoName: 'pulseWidth3')
    ..a<$core.double>(66, _omitFieldNames ? '' : 'pulseWidth4', $pb.PbFieldType.OF, protoName: 'pulseWidth4')
    ..a<$core.double>(67, _omitFieldNames ? '' : 'vetrim1curr', $pb.PbFieldType.OF)
    ..a<$core.double>(68, _omitFieldNames ? '' : 'vetrim2curr', $pb.PbFieldType.OF)
    ..a<$core.double>(69, _omitFieldNames ? '' : 'vetrim3curr', $pb.PbFieldType.OF)
    ..a<$core.double>(70, _omitFieldNames ? '' : 'vetrim4curr', $pb.PbFieldType.OF)
    ..a<$core.double>(71, _omitFieldNames ? '' : 'maf', $pb.PbFieldType.OF)
    ..a<$core.double>(72, _omitFieldNames ? '' : 'eaeload1', $pb.PbFieldType.OF)
    ..a<$core.double>(73, _omitFieldNames ? '' : 'afrload1', $pb.PbFieldType.OF)
    ..a<$core.double>(74, _omitFieldNames ? '' : 'rpmDot', $pb.PbFieldType.OF, protoName: 'rpmDot')
    ..a<$core.double>(75, _omitFieldNames ? '' : 'gpioport0', $pb.PbFieldType.OF)
    ..a<$core.double>(76, _omitFieldNames ? '' : 'gpioport1', $pb.PbFieldType.OF)
    ..a<$core.double>(77, _omitFieldNames ? '' : 'gpioport2', $pb.PbFieldType.OF)
    ..a<$core.double>(78, _omitFieldNames ? '' : 'clIdleTargRpm', $pb.PbFieldType.OF)
    ..a<$core.double>(79, _omitFieldNames ? '' : 'mafVolts', $pb.PbFieldType.OF)
    ..a<$core.double>(80, _omitFieldNames ? '' : 'airtemp', $pb.PbFieldType.OF)
    ..a<$core.double>(81, _omitFieldNames ? '' : 'dwellTrl', $pb.PbFieldType.OF)
    ..a<$core.double>(82, _omitFieldNames ? '' : 'fuelPct', $pb.PbFieldType.OF)
    ..a<$core.double>(83, _omitFieldNames ? '' : 'boostTarg', $pb.PbFieldType.OF)
    ..a<$core.double>(84, _omitFieldNames ? '' : 'extAdvance', $pb.PbFieldType.OF)
    ..a<$core.double>(85, _omitFieldNames ? '' : 'baseAdvance', $pb.PbFieldType.OF)
    ..a<$core.double>(86, _omitFieldNames ? '' : 'idleCorAdvance', $pb.PbFieldType.OF)
    ..a<$core.double>(87, _omitFieldNames ? '' : 'matRetard', $pb.PbFieldType.OF)
    ..a<$core.double>(88, _omitFieldNames ? '' : 'flexAdvance', $pb.PbFieldType.OF)
    ..a<$core.double>(89, _omitFieldNames ? '' : 'adv1', $pb.PbFieldType.OF)
    ..a<$core.double>(90, _omitFieldNames ? '' : 'adv2', $pb.PbFieldType.OF)
    ..a<$core.double>(91, _omitFieldNames ? '' : 'adv3', $pb.PbFieldType.OF)
    ..a<$core.double>(92, _omitFieldNames ? '' : 'revlimRetard', $pb.PbFieldType.OF)
    ..a<$core.double>(93, _omitFieldNames ? '' : 'nitrousRetard', $pb.PbFieldType.OF)
    ..a<$core.double>(94, _omitFieldNames ? '' : 'deadtime1', $pb.PbFieldType.OF)
    ..a<$core.double>(95, _omitFieldNames ? '' : 'n2oAddfuel', $pb.PbFieldType.OF)
    ..a<$core.double>(96, _omitFieldNames ? '' : 'portbde', $pb.PbFieldType.OF)
    ..a<$core.double>(97, _omitFieldNames ? '' : 'portam', $pb.PbFieldType.OF)
    ..a<$core.double>(98, _omitFieldNames ? '' : 'portt', $pb.PbFieldType.OF)
    ..a<$core.double>(99, _omitFieldNames ? '' : 'canErrorCnt', $pb.PbFieldType.OF)
    ..a<$core.double>(100, _omitFieldNames ? '' : 'canError', $pb.PbFieldType.OF)
    ..a<$core.double>(101, _omitFieldNames ? '' : 'oil', $pb.PbFieldType.OF)
    ..a<$core.double>(102, _omitFieldNames ? '' : 'fuel', $pb.PbFieldType.OF)
    ..a<$core.double>(103, _omitFieldNames ? '' : 'runsecs', $pb.PbFieldType.OF)
    ..a<$core.double>(104, _omitFieldNames ? '' : 'startRetard', $pb.PbFieldType.OF)
    ..aOB(105, _omitFieldNames ? '' : 'connected')
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
  $core.double get seconds => $_getN(0);
  @$pb.TagNumber(1)
  set seconds($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeconds() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get pulseWidth1 => $_getN(1);
  @$pb.TagNumber(2)
  set pulseWidth1($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPulseWidth1() => $_has(1);
  @$pb.TagNumber(2)
  void clearPulseWidth1() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get pulseWidth2 => $_getN(2);
  @$pb.TagNumber(3)
  set pulseWidth2($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPulseWidth2() => $_has(2);
  @$pb.TagNumber(3)
  void clearPulseWidth2() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get rpm => $_getN(3);
  @$pb.TagNumber(4)
  set rpm($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRpm() => $_has(3);
  @$pb.TagNumber(4)
  void clearRpm() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get advance => $_getN(4);
  @$pb.TagNumber(5)
  set advance($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAdvance() => $_has(4);
  @$pb.TagNumber(5)
  void clearAdvance() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get squirt => $_getN(5);
  @$pb.TagNumber(6)
  set squirt($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSquirt() => $_has(5);
  @$pb.TagNumber(6)
  void clearSquirt() => clearField(6);

  @$pb.TagNumber(7)
  StatusMotor get engine => $_getN(6);
  @$pb.TagNumber(7)
  set engine(StatusMotor v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEngine() => $_has(6);
  @$pb.TagNumber(7)
  void clearEngine() => clearField(7);
  @$pb.TagNumber(7)
  StatusMotor ensureEngine() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.double get afrtgt1 => $_getN(7);
  @$pb.TagNumber(8)
  set afrtgt1($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAfrtgt1() => $_has(7);
  @$pb.TagNumber(8)
  void clearAfrtgt1() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get afrtgt2 => $_getN(8);
  @$pb.TagNumber(9)
  set afrtgt2($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAfrtgt2() => $_has(8);
  @$pb.TagNumber(9)
  void clearAfrtgt2() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get wbo2En1 => $_getN(9);
  @$pb.TagNumber(10)
  set wbo2En1($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasWbo2En1() => $_has(9);
  @$pb.TagNumber(10)
  void clearWbo2En1() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get wbo2En2 => $_getN(10);
  @$pb.TagNumber(11)
  set wbo2En2($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasWbo2En2() => $_has(10);
  @$pb.TagNumber(11)
  void clearWbo2En2() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get barometer => $_getN(11);
  @$pb.TagNumber(12)
  set barometer($core.double v) { $_setFloat(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasBarometer() => $_has(11);
  @$pb.TagNumber(12)
  void clearBarometer() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get map => $_getN(12);
  @$pb.TagNumber(13)
  set map($core.double v) { $_setFloat(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasMap() => $_has(12);
  @$pb.TagNumber(13)
  void clearMap() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get mat => $_getN(13);
  @$pb.TagNumber(14)
  set mat($core.double v) { $_setFloat(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMat() => $_has(13);
  @$pb.TagNumber(14)
  void clearMat() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get coolant => $_getN(14);
  @$pb.TagNumber(15)
  set coolant($core.double v) { $_setFloat(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasCoolant() => $_has(14);
  @$pb.TagNumber(15)
  void clearCoolant() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get tps => $_getN(15);
  @$pb.TagNumber(16)
  set tps($core.double v) { $_setFloat(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasTps() => $_has(15);
  @$pb.TagNumber(16)
  void clearTps() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get batteryVoltage => $_getN(16);
  @$pb.TagNumber(17)
  set batteryVoltage($core.double v) { $_setFloat(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasBatteryVoltage() => $_has(16);
  @$pb.TagNumber(17)
  void clearBatteryVoltage() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get afr1 => $_getN(17);
  @$pb.TagNumber(18)
  set afr1($core.double v) { $_setFloat(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasAfr1() => $_has(17);
  @$pb.TagNumber(18)
  void clearAfr1() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get afr2 => $_getN(18);
  @$pb.TagNumber(19)
  set afr2($core.double v) { $_setFloat(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAfr2() => $_has(18);
  @$pb.TagNumber(19)
  void clearAfr2() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get knock => $_getN(19);
  @$pb.TagNumber(20)
  set knock($core.double v) { $_setFloat(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasKnock() => $_has(19);
  @$pb.TagNumber(20)
  void clearKnock() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get egoCorrection1 => $_getN(20);
  @$pb.TagNumber(21)
  set egoCorrection1($core.double v) { $_setFloat(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasEgoCorrection1() => $_has(20);
  @$pb.TagNumber(21)
  void clearEgoCorrection1() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get egoCorrection2 => $_getN(21);
  @$pb.TagNumber(22)
  set egoCorrection2($core.double v) { $_setFloat(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasEgoCorrection2() => $_has(21);
  @$pb.TagNumber(22)
  void clearEgoCorrection2() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get airCorrection => $_getN(22);
  @$pb.TagNumber(23)
  set airCorrection($core.double v) { $_setFloat(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasAirCorrection() => $_has(22);
  @$pb.TagNumber(23)
  void clearAirCorrection() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get warmupEnrich => $_getN(23);
  @$pb.TagNumber(24)
  set warmupEnrich($core.double v) { $_setFloat(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasWarmupEnrich() => $_has(23);
  @$pb.TagNumber(24)
  void clearWarmupEnrich() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get accelEnrich => $_getN(24);
  @$pb.TagNumber(25)
  set accelEnrich($core.double v) { $_setFloat(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasAccelEnrich() => $_has(24);
  @$pb.TagNumber(25)
  void clearAccelEnrich() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get tpsfuelcut => $_getN(25);
  @$pb.TagNumber(26)
  set tpsfuelcut($core.double v) { $_setFloat(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasTpsfuelcut() => $_has(25);
  @$pb.TagNumber(26)
  void clearTpsfuelcut() => clearField(26);

  @$pb.TagNumber(27)
  $core.double get baroCorrection => $_getN(26);
  @$pb.TagNumber(27)
  set baroCorrection($core.double v) { $_setFloat(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasBaroCorrection() => $_has(26);
  @$pb.TagNumber(27)
  void clearBaroCorrection() => clearField(27);

  @$pb.TagNumber(28)
  $core.double get gammaEnrich => $_getN(27);
  @$pb.TagNumber(28)
  set gammaEnrich($core.double v) { $_setFloat(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasGammaEnrich() => $_has(27);
  @$pb.TagNumber(28)
  void clearGammaEnrich() => clearField(28);

  @$pb.TagNumber(29)
  $core.double get veCurr1 => $_getN(28);
  @$pb.TagNumber(29)
  set veCurr1($core.double v) { $_setFloat(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasVeCurr1() => $_has(28);
  @$pb.TagNumber(29)
  void clearVeCurr1() => clearField(29);

  @$pb.TagNumber(30)
  $core.double get veCurr2 => $_getN(29);
  @$pb.TagNumber(30)
  set veCurr2($core.double v) { $_setFloat(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasVeCurr2() => $_has(29);
  @$pb.TagNumber(30)
  void clearVeCurr2() => clearField(30);

  @$pb.TagNumber(31)
  $core.double get iacstep => $_getN(30);
  @$pb.TagNumber(31)
  set iacstep($core.double v) { $_setFloat(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasIacstep() => $_has(30);
  @$pb.TagNumber(31)
  void clearIacstep() => clearField(31);

  @$pb.TagNumber(32)
  $core.double get coldAdvDeg => $_getN(31);
  @$pb.TagNumber(32)
  set coldAdvDeg($core.double v) { $_setFloat(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasColdAdvDeg() => $_has(31);
  @$pb.TagNumber(32)
  void clearColdAdvDeg() => clearField(32);

  @$pb.TagNumber(33)
  $core.double get tpsDot => $_getN(32);
  @$pb.TagNumber(33)
  set tpsDot($core.double v) { $_setFloat(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasTpsDot() => $_has(32);
  @$pb.TagNumber(33)
  void clearTpsDot() => clearField(33);

  @$pb.TagNumber(34)
  $core.double get mapDot => $_getN(33);
  @$pb.TagNumber(34)
  set mapDot($core.double v) { $_setFloat(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasMapDot() => $_has(33);
  @$pb.TagNumber(34)
  void clearMapDot() => clearField(34);

  @$pb.TagNumber(35)
  $core.double get dwell => $_getN(34);
  @$pb.TagNumber(35)
  set dwell($core.double v) { $_setFloat(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasDwell() => $_has(34);
  @$pb.TagNumber(35)
  void clearDwell() => clearField(35);

  @$pb.TagNumber(36)
  $core.double get mafload => $_getN(35);
  @$pb.TagNumber(36)
  set mafload($core.double v) { $_setFloat(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasMafload() => $_has(35);
  @$pb.TagNumber(36)
  void clearMafload() => clearField(36);

  @$pb.TagNumber(37)
  $core.double get fuelload => $_getN(36);
  @$pb.TagNumber(37)
  set fuelload($core.double v) { $_setFloat(36, v); }
  @$pb.TagNumber(37)
  $core.bool hasFuelload() => $_has(36);
  @$pb.TagNumber(37)
  void clearFuelload() => clearField(37);

  @$pb.TagNumber(38)
  $core.double get fuelCorrection => $_getN(37);
  @$pb.TagNumber(38)
  set fuelCorrection($core.double v) { $_setFloat(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasFuelCorrection() => $_has(37);
  @$pb.TagNumber(38)
  void clearFuelCorrection() => clearField(38);

  @$pb.TagNumber(39)
  $core.double get portStatus => $_getN(38);
  @$pb.TagNumber(39)
  set portStatus($core.double v) { $_setFloat(38, v); }
  @$pb.TagNumber(39)
  $core.bool hasPortStatus() => $_has(38);
  @$pb.TagNumber(39)
  void clearPortStatus() => clearField(39);

  @$pb.TagNumber(40)
  $core.double get knockRetard => $_getN(39);
  @$pb.TagNumber(40)
  set knockRetard($core.double v) { $_setFloat(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasKnockRetard() => $_has(39);
  @$pb.TagNumber(40)
  void clearKnockRetard() => clearField(40);

  @$pb.TagNumber(41)
  $core.double get eaeFuelCorr1 => $_getN(40);
  @$pb.TagNumber(41)
  set eaeFuelCorr1($core.double v) { $_setFloat(40, v); }
  @$pb.TagNumber(41)
  $core.bool hasEaeFuelCorr1() => $_has(40);
  @$pb.TagNumber(41)
  void clearEaeFuelCorr1() => clearField(41);

  @$pb.TagNumber(42)
  $core.double get egoV => $_getN(41);
  @$pb.TagNumber(42)
  set egoV($core.double v) { $_setFloat(41, v); }
  @$pb.TagNumber(42)
  $core.bool hasEgoV() => $_has(41);
  @$pb.TagNumber(42)
  void clearEgoV() => clearField(42);

  @$pb.TagNumber(43)
  $core.double get egoV2 => $_getN(42);
  @$pb.TagNumber(43)
  set egoV2($core.double v) { $_setFloat(42, v); }
  @$pb.TagNumber(43)
  $core.bool hasEgoV2() => $_has(42);
  @$pb.TagNumber(43)
  void clearEgoV2() => clearField(43);

  @$pb.TagNumber(44)
  $core.double get status1 => $_getN(43);
  @$pb.TagNumber(44)
  set status1($core.double v) { $_setFloat(43, v); }
  @$pb.TagNumber(44)
  $core.bool hasStatus1() => $_has(43);
  @$pb.TagNumber(44)
  void clearStatus1() => clearField(44);

  @$pb.TagNumber(45)
  $core.double get status2 => $_getN(44);
  @$pb.TagNumber(45)
  set status2($core.double v) { $_setFloat(44, v); }
  @$pb.TagNumber(45)
  $core.bool hasStatus2() => $_has(44);
  @$pb.TagNumber(45)
  void clearStatus2() => clearField(45);

  @$pb.TagNumber(46)
  $core.double get status3 => $_getN(45);
  @$pb.TagNumber(46)
  set status3($core.double v) { $_setFloat(45, v); }
  @$pb.TagNumber(46)
  $core.bool hasStatus3() => $_has(45);
  @$pb.TagNumber(46)
  void clearStatus3() => clearField(46);

  @$pb.TagNumber(47)
  $core.double get status4 => $_getN(46);
  @$pb.TagNumber(47)
  set status4($core.double v) { $_setFloat(46, v); }
  @$pb.TagNumber(47)
  $core.bool hasStatus4() => $_has(46);
  @$pb.TagNumber(47)
  void clearStatus4() => clearField(47);

  @$pb.TagNumber(48)
  $core.double get looptime => $_getN(47);
  @$pb.TagNumber(48)
  set looptime($core.double v) { $_setFloat(47, v); }
  @$pb.TagNumber(48)
  $core.bool hasLooptime() => $_has(47);
  @$pb.TagNumber(48)
  void clearLooptime() => clearField(48);

  @$pb.TagNumber(49)
  $core.double get status5 => $_getN(48);
  @$pb.TagNumber(49)
  set status5($core.double v) { $_setFloat(48, v); }
  @$pb.TagNumber(49)
  $core.bool hasStatus5() => $_has(48);
  @$pb.TagNumber(49)
  void clearStatus5() => clearField(49);

  @$pb.TagNumber(50)
  $core.double get tpsADC => $_getN(49);
  @$pb.TagNumber(50)
  set tpsADC($core.double v) { $_setFloat(49, v); }
  @$pb.TagNumber(50)
  $core.bool hasTpsADC() => $_has(49);
  @$pb.TagNumber(50)
  void clearTpsADC() => clearField(50);

  @$pb.TagNumber(51)
  $core.double get fuelload2 => $_getN(50);
  @$pb.TagNumber(51)
  set fuelload2($core.double v) { $_setFloat(50, v); }
  @$pb.TagNumber(51)
  $core.bool hasFuelload2() => $_has(50);
  @$pb.TagNumber(51)
  void clearFuelload2() => clearField(51);

  @$pb.TagNumber(52)
  $core.double get ignload => $_getN(51);
  @$pb.TagNumber(52)
  set ignload($core.double v) { $_setFloat(51, v); }
  @$pb.TagNumber(52)
  $core.bool hasIgnload() => $_has(51);
  @$pb.TagNumber(52)
  void clearIgnload() => clearField(52);

  @$pb.TagNumber(53)
  $core.double get ignload2 => $_getN(52);
  @$pb.TagNumber(53)
  set ignload2($core.double v) { $_setFloat(52, v); }
  @$pb.TagNumber(53)
  $core.bool hasIgnload2() => $_has(52);
  @$pb.TagNumber(53)
  void clearIgnload2() => clearField(53);

  @$pb.TagNumber(54)
  $core.double get synccnt => $_getN(53);
  @$pb.TagNumber(54)
  set synccnt($core.double v) { $_setFloat(53, v); }
  @$pb.TagNumber(54)
  $core.bool hasSynccnt() => $_has(53);
  @$pb.TagNumber(54)
  void clearSynccnt() => clearField(54);

  @$pb.TagNumber(55)
  $core.double get timingErr => $_getN(54);
  @$pb.TagNumber(55)
  set timingErr($core.double v) { $_setFloat(54, v); }
  @$pb.TagNumber(55)
  $core.bool hasTimingErr() => $_has(54);
  @$pb.TagNumber(55)
  void clearTimingErr() => clearField(55);

  @$pb.TagNumber(56)
  $core.double get deltaT => $_getN(55);
  @$pb.TagNumber(56)
  set deltaT($core.double v) { $_setFloat(55, v); }
  @$pb.TagNumber(56)
  $core.bool hasDeltaT() => $_has(55);
  @$pb.TagNumber(56)
  void clearDeltaT() => clearField(56);

  @$pb.TagNumber(57)
  $core.double get wallfuel1 => $_getN(56);
  @$pb.TagNumber(57)
  set wallfuel1($core.double v) { $_setFloat(56, v); }
  @$pb.TagNumber(57)
  $core.bool hasWallfuel1() => $_has(56);
  @$pb.TagNumber(57)
  void clearWallfuel1() => clearField(57);

  @$pb.TagNumber(58)
  $core.double get wallfuel2 => $_getN(57);
  @$pb.TagNumber(58)
  set wallfuel2($core.double v) { $_setFloat(57, v); }
  @$pb.TagNumber(58)
  $core.bool hasWallfuel2() => $_has(57);
  @$pb.TagNumber(58)
  void clearWallfuel2() => clearField(58);

  @$pb.TagNumber(59)
  $core.double get eaeFuelCorr2 => $_getN(58);
  @$pb.TagNumber(59)
  set eaeFuelCorr2($core.double v) { $_setFloat(58, v); }
  @$pb.TagNumber(59)
  $core.bool hasEaeFuelCorr2() => $_has(58);
  @$pb.TagNumber(59)
  void clearEaeFuelCorr2() => clearField(59);

  @$pb.TagNumber(60)
  $core.double get boostduty => $_getN(59);
  @$pb.TagNumber(60)
  set boostduty($core.double v) { $_setFloat(59, v); }
  @$pb.TagNumber(60)
  $core.bool hasBoostduty() => $_has(59);
  @$pb.TagNumber(60)
  void clearBoostduty() => clearField(60);

  @$pb.TagNumber(61)
  $core.double get syncreason => $_getN(60);
  @$pb.TagNumber(61)
  set syncreason($core.double v) { $_setFloat(60, v); }
  @$pb.TagNumber(61)
  $core.bool hasSyncreason() => $_has(60);
  @$pb.TagNumber(61)
  void clearSyncreason() => clearField(61);

  @$pb.TagNumber(62)
  $core.double get user0 => $_getN(61);
  @$pb.TagNumber(62)
  set user0($core.double v) { $_setFloat(61, v); }
  @$pb.TagNumber(62)
  $core.bool hasUser0() => $_has(61);
  @$pb.TagNumber(62)
  void clearUser0() => clearField(62);

  @$pb.TagNumber(63)
  $core.double get injAdv1 => $_getN(62);
  @$pb.TagNumber(63)
  set injAdv1($core.double v) { $_setFloat(62, v); }
  @$pb.TagNumber(63)
  $core.bool hasInjAdv1() => $_has(62);
  @$pb.TagNumber(63)
  void clearInjAdv1() => clearField(63);

  @$pb.TagNumber(64)
  $core.double get injAdv2 => $_getN(63);
  @$pb.TagNumber(64)
  set injAdv2($core.double v) { $_setFloat(63, v); }
  @$pb.TagNumber(64)
  $core.bool hasInjAdv2() => $_has(63);
  @$pb.TagNumber(64)
  void clearInjAdv2() => clearField(64);

  @$pb.TagNumber(65)
  $core.double get pulseWidth3 => $_getN(64);
  @$pb.TagNumber(65)
  set pulseWidth3($core.double v) { $_setFloat(64, v); }
  @$pb.TagNumber(65)
  $core.bool hasPulseWidth3() => $_has(64);
  @$pb.TagNumber(65)
  void clearPulseWidth3() => clearField(65);

  @$pb.TagNumber(66)
  $core.double get pulseWidth4 => $_getN(65);
  @$pb.TagNumber(66)
  set pulseWidth4($core.double v) { $_setFloat(65, v); }
  @$pb.TagNumber(66)
  $core.bool hasPulseWidth4() => $_has(65);
  @$pb.TagNumber(66)
  void clearPulseWidth4() => clearField(66);

  @$pb.TagNumber(67)
  $core.double get vetrim1curr => $_getN(66);
  @$pb.TagNumber(67)
  set vetrim1curr($core.double v) { $_setFloat(66, v); }
  @$pb.TagNumber(67)
  $core.bool hasVetrim1curr() => $_has(66);
  @$pb.TagNumber(67)
  void clearVetrim1curr() => clearField(67);

  @$pb.TagNumber(68)
  $core.double get vetrim2curr => $_getN(67);
  @$pb.TagNumber(68)
  set vetrim2curr($core.double v) { $_setFloat(67, v); }
  @$pb.TagNumber(68)
  $core.bool hasVetrim2curr() => $_has(67);
  @$pb.TagNumber(68)
  void clearVetrim2curr() => clearField(68);

  @$pb.TagNumber(69)
  $core.double get vetrim3curr => $_getN(68);
  @$pb.TagNumber(69)
  set vetrim3curr($core.double v) { $_setFloat(68, v); }
  @$pb.TagNumber(69)
  $core.bool hasVetrim3curr() => $_has(68);
  @$pb.TagNumber(69)
  void clearVetrim3curr() => clearField(69);

  @$pb.TagNumber(70)
  $core.double get vetrim4curr => $_getN(69);
  @$pb.TagNumber(70)
  set vetrim4curr($core.double v) { $_setFloat(69, v); }
  @$pb.TagNumber(70)
  $core.bool hasVetrim4curr() => $_has(69);
  @$pb.TagNumber(70)
  void clearVetrim4curr() => clearField(70);

  @$pb.TagNumber(71)
  $core.double get maf => $_getN(70);
  @$pb.TagNumber(71)
  set maf($core.double v) { $_setFloat(70, v); }
  @$pb.TagNumber(71)
  $core.bool hasMaf() => $_has(70);
  @$pb.TagNumber(71)
  void clearMaf() => clearField(71);

  @$pb.TagNumber(72)
  $core.double get eaeload1 => $_getN(71);
  @$pb.TagNumber(72)
  set eaeload1($core.double v) { $_setFloat(71, v); }
  @$pb.TagNumber(72)
  $core.bool hasEaeload1() => $_has(71);
  @$pb.TagNumber(72)
  void clearEaeload1() => clearField(72);

  @$pb.TagNumber(73)
  $core.double get afrload1 => $_getN(72);
  @$pb.TagNumber(73)
  set afrload1($core.double v) { $_setFloat(72, v); }
  @$pb.TagNumber(73)
  $core.bool hasAfrload1() => $_has(72);
  @$pb.TagNumber(73)
  void clearAfrload1() => clearField(73);

  @$pb.TagNumber(74)
  $core.double get rpmDot => $_getN(73);
  @$pb.TagNumber(74)
  set rpmDot($core.double v) { $_setFloat(73, v); }
  @$pb.TagNumber(74)
  $core.bool hasRpmDot() => $_has(73);
  @$pb.TagNumber(74)
  void clearRpmDot() => clearField(74);

  @$pb.TagNumber(75)
  $core.double get gpioport0 => $_getN(74);
  @$pb.TagNumber(75)
  set gpioport0($core.double v) { $_setFloat(74, v); }
  @$pb.TagNumber(75)
  $core.bool hasGpioport0() => $_has(74);
  @$pb.TagNumber(75)
  void clearGpioport0() => clearField(75);

  @$pb.TagNumber(76)
  $core.double get gpioport1 => $_getN(75);
  @$pb.TagNumber(76)
  set gpioport1($core.double v) { $_setFloat(75, v); }
  @$pb.TagNumber(76)
  $core.bool hasGpioport1() => $_has(75);
  @$pb.TagNumber(76)
  void clearGpioport1() => clearField(76);

  @$pb.TagNumber(77)
  $core.double get gpioport2 => $_getN(76);
  @$pb.TagNumber(77)
  set gpioport2($core.double v) { $_setFloat(76, v); }
  @$pb.TagNumber(77)
  $core.bool hasGpioport2() => $_has(76);
  @$pb.TagNumber(77)
  void clearGpioport2() => clearField(77);

  @$pb.TagNumber(78)
  $core.double get clIdleTargRpm => $_getN(77);
  @$pb.TagNumber(78)
  set clIdleTargRpm($core.double v) { $_setFloat(77, v); }
  @$pb.TagNumber(78)
  $core.bool hasClIdleTargRpm() => $_has(77);
  @$pb.TagNumber(78)
  void clearClIdleTargRpm() => clearField(78);

  @$pb.TagNumber(79)
  $core.double get mafVolts => $_getN(78);
  @$pb.TagNumber(79)
  set mafVolts($core.double v) { $_setFloat(78, v); }
  @$pb.TagNumber(79)
  $core.bool hasMafVolts() => $_has(78);
  @$pb.TagNumber(79)
  void clearMafVolts() => clearField(79);

  @$pb.TagNumber(80)
  $core.double get airtemp => $_getN(79);
  @$pb.TagNumber(80)
  set airtemp($core.double v) { $_setFloat(79, v); }
  @$pb.TagNumber(80)
  $core.bool hasAirtemp() => $_has(79);
  @$pb.TagNumber(80)
  void clearAirtemp() => clearField(80);

  @$pb.TagNumber(81)
  $core.double get dwellTrl => $_getN(80);
  @$pb.TagNumber(81)
  set dwellTrl($core.double v) { $_setFloat(80, v); }
  @$pb.TagNumber(81)
  $core.bool hasDwellTrl() => $_has(80);
  @$pb.TagNumber(81)
  void clearDwellTrl() => clearField(81);

  @$pb.TagNumber(82)
  $core.double get fuelPct => $_getN(81);
  @$pb.TagNumber(82)
  set fuelPct($core.double v) { $_setFloat(81, v); }
  @$pb.TagNumber(82)
  $core.bool hasFuelPct() => $_has(81);
  @$pb.TagNumber(82)
  void clearFuelPct() => clearField(82);

  @$pb.TagNumber(83)
  $core.double get boostTarg => $_getN(82);
  @$pb.TagNumber(83)
  set boostTarg($core.double v) { $_setFloat(82, v); }
  @$pb.TagNumber(83)
  $core.bool hasBoostTarg() => $_has(82);
  @$pb.TagNumber(83)
  void clearBoostTarg() => clearField(83);

  @$pb.TagNumber(84)
  $core.double get extAdvance => $_getN(83);
  @$pb.TagNumber(84)
  set extAdvance($core.double v) { $_setFloat(83, v); }
  @$pb.TagNumber(84)
  $core.bool hasExtAdvance() => $_has(83);
  @$pb.TagNumber(84)
  void clearExtAdvance() => clearField(84);

  @$pb.TagNumber(85)
  $core.double get baseAdvance => $_getN(84);
  @$pb.TagNumber(85)
  set baseAdvance($core.double v) { $_setFloat(84, v); }
  @$pb.TagNumber(85)
  $core.bool hasBaseAdvance() => $_has(84);
  @$pb.TagNumber(85)
  void clearBaseAdvance() => clearField(85);

  @$pb.TagNumber(86)
  $core.double get idleCorAdvance => $_getN(85);
  @$pb.TagNumber(86)
  set idleCorAdvance($core.double v) { $_setFloat(85, v); }
  @$pb.TagNumber(86)
  $core.bool hasIdleCorAdvance() => $_has(85);
  @$pb.TagNumber(86)
  void clearIdleCorAdvance() => clearField(86);

  @$pb.TagNumber(87)
  $core.double get matRetard => $_getN(86);
  @$pb.TagNumber(87)
  set matRetard($core.double v) { $_setFloat(86, v); }
  @$pb.TagNumber(87)
  $core.bool hasMatRetard() => $_has(86);
  @$pb.TagNumber(87)
  void clearMatRetard() => clearField(87);

  @$pb.TagNumber(88)
  $core.double get flexAdvance => $_getN(87);
  @$pb.TagNumber(88)
  set flexAdvance($core.double v) { $_setFloat(87, v); }
  @$pb.TagNumber(88)
  $core.bool hasFlexAdvance() => $_has(87);
  @$pb.TagNumber(88)
  void clearFlexAdvance() => clearField(88);

  @$pb.TagNumber(89)
  $core.double get adv1 => $_getN(88);
  @$pb.TagNumber(89)
  set adv1($core.double v) { $_setFloat(88, v); }
  @$pb.TagNumber(89)
  $core.bool hasAdv1() => $_has(88);
  @$pb.TagNumber(89)
  void clearAdv1() => clearField(89);

  @$pb.TagNumber(90)
  $core.double get adv2 => $_getN(89);
  @$pb.TagNumber(90)
  set adv2($core.double v) { $_setFloat(89, v); }
  @$pb.TagNumber(90)
  $core.bool hasAdv2() => $_has(89);
  @$pb.TagNumber(90)
  void clearAdv2() => clearField(90);

  @$pb.TagNumber(91)
  $core.double get adv3 => $_getN(90);
  @$pb.TagNumber(91)
  set adv3($core.double v) { $_setFloat(90, v); }
  @$pb.TagNumber(91)
  $core.bool hasAdv3() => $_has(90);
  @$pb.TagNumber(91)
  void clearAdv3() => clearField(91);

  @$pb.TagNumber(92)
  $core.double get revlimRetard => $_getN(91);
  @$pb.TagNumber(92)
  set revlimRetard($core.double v) { $_setFloat(91, v); }
  @$pb.TagNumber(92)
  $core.bool hasRevlimRetard() => $_has(91);
  @$pb.TagNumber(92)
  void clearRevlimRetard() => clearField(92);

  @$pb.TagNumber(93)
  $core.double get nitrousRetard => $_getN(92);
  @$pb.TagNumber(93)
  set nitrousRetard($core.double v) { $_setFloat(92, v); }
  @$pb.TagNumber(93)
  $core.bool hasNitrousRetard() => $_has(92);
  @$pb.TagNumber(93)
  void clearNitrousRetard() => clearField(93);

  @$pb.TagNumber(94)
  $core.double get deadtime1 => $_getN(93);
  @$pb.TagNumber(94)
  set deadtime1($core.double v) { $_setFloat(93, v); }
  @$pb.TagNumber(94)
  $core.bool hasDeadtime1() => $_has(93);
  @$pb.TagNumber(94)
  void clearDeadtime1() => clearField(94);

  @$pb.TagNumber(95)
  $core.double get n2oAddfuel => $_getN(94);
  @$pb.TagNumber(95)
  set n2oAddfuel($core.double v) { $_setFloat(94, v); }
  @$pb.TagNumber(95)
  $core.bool hasN2oAddfuel() => $_has(94);
  @$pb.TagNumber(95)
  void clearN2oAddfuel() => clearField(95);

  @$pb.TagNumber(96)
  $core.double get portbde => $_getN(95);
  @$pb.TagNumber(96)
  set portbde($core.double v) { $_setFloat(95, v); }
  @$pb.TagNumber(96)
  $core.bool hasPortbde() => $_has(95);
  @$pb.TagNumber(96)
  void clearPortbde() => clearField(96);

  @$pb.TagNumber(97)
  $core.double get portam => $_getN(96);
  @$pb.TagNumber(97)
  set portam($core.double v) { $_setFloat(96, v); }
  @$pb.TagNumber(97)
  $core.bool hasPortam() => $_has(96);
  @$pb.TagNumber(97)
  void clearPortam() => clearField(97);

  @$pb.TagNumber(98)
  $core.double get portt => $_getN(97);
  @$pb.TagNumber(98)
  set portt($core.double v) { $_setFloat(97, v); }
  @$pb.TagNumber(98)
  $core.bool hasPortt() => $_has(97);
  @$pb.TagNumber(98)
  void clearPortt() => clearField(98);

  @$pb.TagNumber(99)
  $core.double get canErrorCnt => $_getN(98);
  @$pb.TagNumber(99)
  set canErrorCnt($core.double v) { $_setFloat(98, v); }
  @$pb.TagNumber(99)
  $core.bool hasCanErrorCnt() => $_has(98);
  @$pb.TagNumber(99)
  void clearCanErrorCnt() => clearField(99);

  @$pb.TagNumber(100)
  $core.double get canError => $_getN(99);
  @$pb.TagNumber(100)
  set canError($core.double v) { $_setFloat(99, v); }
  @$pb.TagNumber(100)
  $core.bool hasCanError() => $_has(99);
  @$pb.TagNumber(100)
  void clearCanError() => clearField(100);

  @$pb.TagNumber(101)
  $core.double get oil => $_getN(100);
  @$pb.TagNumber(101)
  set oil($core.double v) { $_setFloat(100, v); }
  @$pb.TagNumber(101)
  $core.bool hasOil() => $_has(100);
  @$pb.TagNumber(101)
  void clearOil() => clearField(101);

  @$pb.TagNumber(102)
  $core.double get fuel => $_getN(101);
  @$pb.TagNumber(102)
  set fuel($core.double v) { $_setFloat(101, v); }
  @$pb.TagNumber(102)
  $core.bool hasFuel() => $_has(101);
  @$pb.TagNumber(102)
  void clearFuel() => clearField(102);

  @$pb.TagNumber(103)
  $core.double get runsecs => $_getN(102);
  @$pb.TagNumber(103)
  set runsecs($core.double v) { $_setFloat(102, v); }
  @$pb.TagNumber(103)
  $core.bool hasRunsecs() => $_has(102);
  @$pb.TagNumber(103)
  void clearRunsecs() => clearField(103);

  @$pb.TagNumber(104)
  $core.double get startRetard => $_getN(103);
  @$pb.TagNumber(104)
  set startRetard($core.double v) { $_setFloat(103, v); }
  @$pb.TagNumber(104)
  $core.bool hasStartRetard() => $_has(103);
  @$pb.TagNumber(104)
  void clearStartRetard() => clearField(104);

  @$pb.TagNumber(105)
  $core.bool get connected => $_getBF(104);
  @$pb.TagNumber(105)
  set connected($core.bool v) { $_setBool(104, v); }
  @$pb.TagNumber(105)
  $core.bool hasConnected() => $_has(104);
  @$pb.TagNumber(105)
  void clearConnected() => clearField(105);
}

class StatusMotor extends $pb.GeneratedMessage {
  factory StatusMotor({
    $core.bool? motorPronto,
    $core.bool? motorEmPartida,
    $core.bool? enriquecimentoPartida,
    $core.bool? cicloAquecimento,
  }) {
    final $result = create();
    if (motorPronto != null) {
      $result.motorPronto = motorPronto;
    }
    if (motorEmPartida != null) {
      $result.motorEmPartida = motorEmPartida;
    }
    if (enriquecimentoPartida != null) {
      $result.enriquecimentoPartida = enriquecimentoPartida;
    }
    if (cicloAquecimento != null) {
      $result.cicloAquecimento = cicloAquecimento;
    }
    return $result;
  }
  StatusMotor._() : super();
  factory StatusMotor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatusMotor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StatusMotor', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'motorPronto')
    ..aOB(2, _omitFieldNames ? '' : 'motorEmPartida')
    ..aOB(3, _omitFieldNames ? '' : 'enriquecimentoPartida')
    ..aOB(4, _omitFieldNames ? '' : 'cicloAquecimento')
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
  $core.bool get motorPronto => $_getBF(0);
  @$pb.TagNumber(1)
  set motorPronto($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMotorPronto() => $_has(0);
  @$pb.TagNumber(1)
  void clearMotorPronto() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get motorEmPartida => $_getBF(1);
  @$pb.TagNumber(2)
  set motorEmPartida($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotorEmPartida() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotorEmPartida() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get enriquecimentoPartida => $_getBF(2);
  @$pb.TagNumber(3)
  set enriquecimentoPartida($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnriquecimentoPartida() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnriquecimentoPartida() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get cicloAquecimento => $_getBF(3);
  @$pb.TagNumber(4)
  set cicloAquecimento($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCicloAquecimento() => $_has(3);
  @$pb.TagNumber(4)
  void clearCicloAquecimento() => clearField(4);
}

class ConsumptionData extends $pb.GeneratedMessage {
  factory ConsumptionData({
    $core.double? hodometer,
    $core.double? trip,
    $core.double? hodometerConsumed,
    $core.double? tripConsumed,
    $core.double? hodometerFuelByDistance,
    $core.double? tripFuelByDistance,
    $core.double? currentSpeed,
  }) {
    final $result = create();
    if (hodometer != null) {
      $result.hodometer = hodometer;
    }
    if (trip != null) {
      $result.trip = trip;
    }
    if (hodometerConsumed != null) {
      $result.hodometerConsumed = hodometerConsumed;
    }
    if (tripConsumed != null) {
      $result.tripConsumed = tripConsumed;
    }
    if (hodometerFuelByDistance != null) {
      $result.hodometerFuelByDistance = hodometerFuelByDistance;
    }
    if (tripFuelByDistance != null) {
      $result.tripFuelByDistance = tripFuelByDistance;
    }
    if (currentSpeed != null) {
      $result.currentSpeed = currentSpeed;
    }
    return $result;
  }
  ConsumptionData._() : super();
  factory ConsumptionData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConsumptionData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConsumptionData', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'hodometer', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'trip', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'hodometerConsumed', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'tripConsumed', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'hodometerFuelByDistance', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'tripFuelByDistance', $pb.PbFieldType.OF)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'currentSpeed', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConsumptionData clone() => ConsumptionData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConsumptionData copyWith(void Function(ConsumptionData) updates) => super.copyWith((message) => updates(message as ConsumptionData)) as ConsumptionData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConsumptionData create() => ConsumptionData._();
  ConsumptionData createEmptyInstance() => create();
  static $pb.PbList<ConsumptionData> createRepeated() => $pb.PbList<ConsumptionData>();
  @$core.pragma('dart2js:noInline')
  static ConsumptionData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConsumptionData>(create);
  static ConsumptionData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get hodometer => $_getN(0);
  @$pb.TagNumber(1)
  set hodometer($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHodometer() => $_has(0);
  @$pb.TagNumber(1)
  void clearHodometer() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get trip => $_getN(1);
  @$pb.TagNumber(2)
  set trip($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTrip() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrip() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get hodometerConsumed => $_getN(2);
  @$pb.TagNumber(3)
  set hodometerConsumed($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHodometerConsumed() => $_has(2);
  @$pb.TagNumber(3)
  void clearHodometerConsumed() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get tripConsumed => $_getN(3);
  @$pb.TagNumber(4)
  set tripConsumed($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTripConsumed() => $_has(3);
  @$pb.TagNumber(4)
  void clearTripConsumed() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get hodometerFuelByDistance => $_getN(4);
  @$pb.TagNumber(5)
  set hodometerFuelByDistance($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHodometerFuelByDistance() => $_has(4);
  @$pb.TagNumber(5)
  void clearHodometerFuelByDistance() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get tripFuelByDistance => $_getN(5);
  @$pb.TagNumber(6)
  set tripFuelByDistance($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTripFuelByDistance() => $_has(5);
  @$pb.TagNumber(6)
  void clearTripFuelByDistance() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get currentSpeed => $_getN(6);
  @$pb.TagNumber(7)
  set currentSpeed($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrentSpeed() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentSpeed() => clearField(7);
}

class StreamData extends $pb.GeneratedMessage {
  factory StreamData({
    EcuData? ecuData,
    ConsumptionData? consumptionData,
  }) {
    final $result = create();
    if (ecuData != null) {
      $result.ecuData = ecuData;
    }
    if (consumptionData != null) {
      $result.consumptionData = consumptionData;
    }
    return $result;
  }
  StreamData._() : super();
  factory StreamData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamData', package: const $pb.PackageName(_omitMessageNames ? '' : 'DashElixirFlutter'), createEmptyInstance: create)
    ..aOM<EcuData>(1, _omitFieldNames ? '' : 'ecuData', subBuilder: EcuData.create)
    ..aOM<ConsumptionData>(2, _omitFieldNames ? '' : 'consumptionData', subBuilder: ConsumptionData.create)
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
  ConsumptionData get consumptionData => $_getN(1);
  @$pb.TagNumber(2)
  set consumptionData(ConsumptionData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConsumptionData() => $_has(1);
  @$pb.TagNumber(2)
  void clearConsumptionData() => clearField(2);
  @$pb.TagNumber(2)
  ConsumptionData ensureConsumptionData() => $_ensure(1);
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
