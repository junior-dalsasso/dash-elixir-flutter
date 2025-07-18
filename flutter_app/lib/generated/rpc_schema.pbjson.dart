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
    {'1': 'seconds', '3': 1, '4': 1, '5': 2, '10': 'seconds'},
    {'1': 'pulseWidth1', '3': 2, '4': 1, '5': 2, '10': 'pulseWidth1'},
    {'1': 'pulseWidth2', '3': 3, '4': 1, '5': 2, '10': 'pulseWidth2'},
    {'1': 'rpm', '3': 4, '4': 1, '5': 2, '10': 'rpm'},
    {'1': 'advance', '3': 5, '4': 1, '5': 2, '10': 'advance'},
    {'1': 'squirt', '3': 6, '4': 1, '5': 2, '10': 'squirt'},
    {'1': 'engine', '3': 7, '4': 1, '5': 11, '6': '.DashElixirFlutter.StatusMotor', '10': 'engine'},
    {'1': 'afrtgt1', '3': 8, '4': 1, '5': 2, '10': 'afrtgt1'},
    {'1': 'afrtgt2', '3': 9, '4': 1, '5': 2, '10': 'afrtgt2'},
    {'1': 'wbo2_en1', '3': 10, '4': 1, '5': 2, '10': 'wbo2En1'},
    {'1': 'wbo2_en2', '3': 11, '4': 1, '5': 2, '10': 'wbo2En2'},
    {'1': 'barometer', '3': 12, '4': 1, '5': 2, '10': 'barometer'},
    {'1': 'map', '3': 13, '4': 1, '5': 2, '10': 'map'},
    {'1': 'mat', '3': 14, '4': 1, '5': 2, '10': 'mat'},
    {'1': 'coolant', '3': 15, '4': 1, '5': 2, '10': 'coolant'},
    {'1': 'tps', '3': 16, '4': 1, '5': 2, '10': 'tps'},
    {'1': 'batteryVoltage', '3': 17, '4': 1, '5': 2, '10': 'batteryVoltage'},
    {'1': 'afr1', '3': 18, '4': 1, '5': 2, '10': 'afr1'},
    {'1': 'afr2', '3': 19, '4': 1, '5': 2, '10': 'afr2'},
    {'1': 'knock', '3': 20, '4': 1, '5': 2, '10': 'knock'},
    {'1': 'egoCorrection1', '3': 21, '4': 1, '5': 2, '10': 'egoCorrection1'},
    {'1': 'egoCorrection2', '3': 22, '4': 1, '5': 2, '10': 'egoCorrection2'},
    {'1': 'airCorrection', '3': 23, '4': 1, '5': 2, '10': 'airCorrection'},
    {'1': 'warmupEnrich', '3': 24, '4': 1, '5': 2, '10': 'warmupEnrich'},
    {'1': 'accelEnrich', '3': 25, '4': 1, '5': 2, '10': 'accelEnrich'},
    {'1': 'tpsfuelcut', '3': 26, '4': 1, '5': 2, '10': 'tpsfuelcut'},
    {'1': 'baroCorrection', '3': 27, '4': 1, '5': 2, '10': 'baroCorrection'},
    {'1': 'gammaEnrich', '3': 28, '4': 1, '5': 2, '10': 'gammaEnrich'},
    {'1': 'veCurr1', '3': 29, '4': 1, '5': 2, '10': 'veCurr1'},
    {'1': 'veCurr2', '3': 30, '4': 1, '5': 2, '10': 'veCurr2'},
    {'1': 'iacstep', '3': 31, '4': 1, '5': 2, '10': 'iacstep'},
    {'1': 'coldAdvDeg', '3': 32, '4': 1, '5': 2, '10': 'coldAdvDeg'},
    {'1': 'tpsDot', '3': 33, '4': 1, '5': 2, '10': 'tpsDot'},
    {'1': 'mapDot', '3': 34, '4': 1, '5': 2, '10': 'mapDot'},
    {'1': 'dwell', '3': 35, '4': 1, '5': 2, '10': 'dwell'},
    {'1': 'mafload', '3': 36, '4': 1, '5': 2, '10': 'mafload'},
    {'1': 'fuelload', '3': 37, '4': 1, '5': 2, '10': 'fuelload'},
    {'1': 'fuelCorrection', '3': 38, '4': 1, '5': 2, '10': 'fuelCorrection'},
    {'1': 'portStatus', '3': 39, '4': 1, '5': 2, '10': 'portStatus'},
    {'1': 'knockRetard', '3': 40, '4': 1, '5': 2, '10': 'knockRetard'},
    {'1': 'eaeFuelCorr1', '3': 41, '4': 1, '5': 2, '10': 'eaeFuelCorr1'},
    {'1': 'egoV', '3': 42, '4': 1, '5': 2, '10': 'egoV'},
    {'1': 'egoV2', '3': 43, '4': 1, '5': 2, '10': 'egoV2'},
    {'1': 'status1', '3': 44, '4': 1, '5': 2, '10': 'status1'},
    {'1': 'status2', '3': 45, '4': 1, '5': 2, '10': 'status2'},
    {'1': 'status3', '3': 46, '4': 1, '5': 2, '10': 'status3'},
    {'1': 'status4', '3': 47, '4': 1, '5': 2, '10': 'status4'},
    {'1': 'looptime', '3': 48, '4': 1, '5': 2, '10': 'looptime'},
    {'1': 'status5', '3': 49, '4': 1, '5': 2, '10': 'status5'},
    {'1': 'tpsADC', '3': 50, '4': 1, '5': 2, '10': 'tpsADC'},
    {'1': 'fuelload2', '3': 51, '4': 1, '5': 2, '10': 'fuelload2'},
    {'1': 'ignload', '3': 52, '4': 1, '5': 2, '10': 'ignload'},
    {'1': 'ignload2', '3': 53, '4': 1, '5': 2, '10': 'ignload2'},
    {'1': 'synccnt', '3': 54, '4': 1, '5': 2, '10': 'synccnt'},
    {'1': 'timing_err', '3': 55, '4': 1, '5': 2, '10': 'timingErr'},
    {'1': 'deltaT', '3': 56, '4': 1, '5': 2, '10': 'deltaT'},
    {'1': 'wallfuel1', '3': 57, '4': 1, '5': 2, '10': 'wallfuel1'},
    {'1': 'wallfuel2', '3': 58, '4': 1, '5': 2, '10': 'wallfuel2'},
    {'1': 'eaeFuelCorr2', '3': 59, '4': 1, '5': 2, '10': 'eaeFuelCorr2'},
    {'1': 'boostduty', '3': 60, '4': 1, '5': 2, '10': 'boostduty'},
    {'1': 'syncreason', '3': 61, '4': 1, '5': 2, '10': 'syncreason'},
    {'1': 'user0', '3': 62, '4': 1, '5': 2, '10': 'user0'},
    {'1': 'inj_adv1', '3': 63, '4': 1, '5': 2, '10': 'injAdv1'},
    {'1': 'inj_adv2', '3': 64, '4': 1, '5': 2, '10': 'injAdv2'},
    {'1': 'pulseWidth3', '3': 65, '4': 1, '5': 2, '10': 'pulseWidth3'},
    {'1': 'pulseWidth4', '3': 66, '4': 1, '5': 2, '10': 'pulseWidth4'},
    {'1': 'vetrim1curr', '3': 67, '4': 1, '5': 2, '10': 'vetrim1curr'},
    {'1': 'vetrim2curr', '3': 68, '4': 1, '5': 2, '10': 'vetrim2curr'},
    {'1': 'vetrim3curr', '3': 69, '4': 1, '5': 2, '10': 'vetrim3curr'},
    {'1': 'vetrim4curr', '3': 70, '4': 1, '5': 2, '10': 'vetrim4curr'},
    {'1': 'maf', '3': 71, '4': 1, '5': 2, '10': 'maf'},
    {'1': 'eaeload1', '3': 72, '4': 1, '5': 2, '10': 'eaeload1'},
    {'1': 'afrload1', '3': 73, '4': 1, '5': 2, '10': 'afrload1'},
    {'1': 'rpmDot', '3': 74, '4': 1, '5': 2, '10': 'rpmDot'},
    {'1': 'gpioport0', '3': 75, '4': 1, '5': 2, '10': 'gpioport0'},
    {'1': 'gpioport1', '3': 76, '4': 1, '5': 2, '10': 'gpioport1'},
    {'1': 'gpioport2', '3': 77, '4': 1, '5': 2, '10': 'gpioport2'},
    {'1': 'cl_idle_targ_rpm', '3': 78, '4': 1, '5': 2, '10': 'clIdleTargRpm'},
    {'1': 'maf_volts', '3': 79, '4': 1, '5': 2, '10': 'mafVolts'},
    {'1': 'airtemp', '3': 80, '4': 1, '5': 2, '10': 'airtemp'},
    {'1': 'dwell_trl', '3': 81, '4': 1, '5': 2, '10': 'dwellTrl'},
    {'1': 'fuel_pct', '3': 82, '4': 1, '5': 2, '10': 'fuelPct'},
    {'1': 'boost_targ', '3': 83, '4': 1, '5': 2, '10': 'boostTarg'},
    {'1': 'ext_advance', '3': 84, '4': 1, '5': 2, '10': 'extAdvance'},
    {'1': 'base_advance', '3': 85, '4': 1, '5': 2, '10': 'baseAdvance'},
    {'1': 'idle_cor_advance', '3': 86, '4': 1, '5': 2, '10': 'idleCorAdvance'},
    {'1': 'mat_retard', '3': 87, '4': 1, '5': 2, '10': 'matRetard'},
    {'1': 'flex_advance', '3': 88, '4': 1, '5': 2, '10': 'flexAdvance'},
    {'1': 'adv1', '3': 89, '4': 1, '5': 2, '10': 'adv1'},
    {'1': 'adv2', '3': 90, '4': 1, '5': 2, '10': 'adv2'},
    {'1': 'adv3', '3': 91, '4': 1, '5': 2, '10': 'adv3'},
    {'1': 'revlim_retard', '3': 92, '4': 1, '5': 2, '10': 'revlimRetard'},
    {'1': 'nitrous_retard', '3': 93, '4': 1, '5': 2, '10': 'nitrousRetard'},
    {'1': 'deadtime1', '3': 94, '4': 1, '5': 2, '10': 'deadtime1'},
    {'1': 'n2o_addfuel', '3': 95, '4': 1, '5': 2, '10': 'n2oAddfuel'},
    {'1': 'portbde', '3': 96, '4': 1, '5': 2, '10': 'portbde'},
    {'1': 'portam', '3': 97, '4': 1, '5': 2, '10': 'portam'},
    {'1': 'portt', '3': 98, '4': 1, '5': 2, '10': 'portt'},
    {'1': 'can_error_cnt', '3': 99, '4': 1, '5': 2, '10': 'canErrorCnt'},
    {'1': 'can_error', '3': 100, '4': 1, '5': 2, '10': 'canError'},
    {'1': 'oil', '3': 101, '4': 1, '5': 2, '10': 'oil'},
    {'1': 'fuel', '3': 102, '4': 1, '5': 2, '10': 'fuel'},
    {'1': 'runsecs', '3': 103, '4': 1, '5': 2, '10': 'runsecs'},
    {'1': 'start_retard', '3': 104, '4': 1, '5': 2, '10': 'startRetard'},
    {'1': 'connected', '3': 105, '4': 1, '5': 8, '10': 'connected'},
  ],
};

/// Descriptor for `EcuData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ecuDataDescriptor = $convert.base64Decode(
    'CgdFY3VEYXRhEhgKB3NlY29uZHMYASABKAJSB3NlY29uZHMSIAoLcHVsc2VXaWR0aDEYAiABKA'
    'JSC3B1bHNlV2lkdGgxEiAKC3B1bHNlV2lkdGgyGAMgASgCUgtwdWxzZVdpZHRoMhIQCgNycG0Y'
    'BCABKAJSA3JwbRIYCgdhZHZhbmNlGAUgASgCUgdhZHZhbmNlEhYKBnNxdWlydBgGIAEoAlIGc3'
    'F1aXJ0EjYKBmVuZ2luZRgHIAEoCzIeLkRhc2hFbGl4aXJGbHV0dGVyLlN0YXR1c01vdG9yUgZl'
    'bmdpbmUSGAoHYWZydGd0MRgIIAEoAlIHYWZydGd0MRIYCgdhZnJ0Z3QyGAkgASgCUgdhZnJ0Z3'
    'QyEhkKCHdibzJfZW4xGAogASgCUgd3Ym8yRW4xEhkKCHdibzJfZW4yGAsgASgCUgd3Ym8yRW4y'
    'EhwKCWJhcm9tZXRlchgMIAEoAlIJYmFyb21ldGVyEhAKA21hcBgNIAEoAlIDbWFwEhAKA21hdB'
    'gOIAEoAlIDbWF0EhgKB2Nvb2xhbnQYDyABKAJSB2Nvb2xhbnQSEAoDdHBzGBAgASgCUgN0cHMS'
    'JgoOYmF0dGVyeVZvbHRhZ2UYESABKAJSDmJhdHRlcnlWb2x0YWdlEhIKBGFmcjEYEiABKAJSBG'
    'FmcjESEgoEYWZyMhgTIAEoAlIEYWZyMhIUCgVrbm9jaxgUIAEoAlIFa25vY2sSJgoOZWdvQ29y'
    'cmVjdGlvbjEYFSABKAJSDmVnb0NvcnJlY3Rpb24xEiYKDmVnb0NvcnJlY3Rpb24yGBYgASgCUg'
    '5lZ29Db3JyZWN0aW9uMhIkCg1haXJDb3JyZWN0aW9uGBcgASgCUg1haXJDb3JyZWN0aW9uEiIK'
    'DHdhcm11cEVucmljaBgYIAEoAlIMd2FybXVwRW5yaWNoEiAKC2FjY2VsRW5yaWNoGBkgASgCUg'
    'thY2NlbEVucmljaBIeCgp0cHNmdWVsY3V0GBogASgCUgp0cHNmdWVsY3V0EiYKDmJhcm9Db3Jy'
    'ZWN0aW9uGBsgASgCUg5iYXJvQ29ycmVjdGlvbhIgCgtnYW1tYUVucmljaBgcIAEoAlILZ2FtbW'
    'FFbnJpY2gSGAoHdmVDdXJyMRgdIAEoAlIHdmVDdXJyMRIYCgd2ZUN1cnIyGB4gASgCUgd2ZUN1'
    'cnIyEhgKB2lhY3N0ZXAYHyABKAJSB2lhY3N0ZXASHgoKY29sZEFkdkRlZxggIAEoAlIKY29sZE'
    'FkdkRlZxIWCgZ0cHNEb3QYISABKAJSBnRwc0RvdBIWCgZtYXBEb3QYIiABKAJSBm1hcERvdBIU'
    'CgVkd2VsbBgjIAEoAlIFZHdlbGwSGAoHbWFmbG9hZBgkIAEoAlIHbWFmbG9hZBIaCghmdWVsbG'
    '9hZBglIAEoAlIIZnVlbGxvYWQSJgoOZnVlbENvcnJlY3Rpb24YJiABKAJSDmZ1ZWxDb3JyZWN0'
    'aW9uEh4KCnBvcnRTdGF0dXMYJyABKAJSCnBvcnRTdGF0dXMSIAoLa25vY2tSZXRhcmQYKCABKA'
    'JSC2tub2NrUmV0YXJkEiIKDGVhZUZ1ZWxDb3JyMRgpIAEoAlIMZWFlRnVlbENvcnIxEhIKBGVn'
    'b1YYKiABKAJSBGVnb1YSFAoFZWdvVjIYKyABKAJSBWVnb1YyEhgKB3N0YXR1czEYLCABKAJSB3'
    'N0YXR1czESGAoHc3RhdHVzMhgtIAEoAlIHc3RhdHVzMhIYCgdzdGF0dXMzGC4gASgCUgdzdGF0'
    'dXMzEhgKB3N0YXR1czQYLyABKAJSB3N0YXR1czQSGgoIbG9vcHRpbWUYMCABKAJSCGxvb3B0aW'
    '1lEhgKB3N0YXR1czUYMSABKAJSB3N0YXR1czUSFgoGdHBzQURDGDIgASgCUgZ0cHNBREMSHAoJ'
    'ZnVlbGxvYWQyGDMgASgCUglmdWVsbG9hZDISGAoHaWdubG9hZBg0IAEoAlIHaWdubG9hZBIaCg'
    'hpZ25sb2FkMhg1IAEoAlIIaWdubG9hZDISGAoHc3luY2NudBg2IAEoAlIHc3luY2NudBIdCgp0'
    'aW1pbmdfZXJyGDcgASgCUgl0aW1pbmdFcnISFgoGZGVsdGFUGDggASgCUgZkZWx0YVQSHAoJd2'
    'FsbGZ1ZWwxGDkgASgCUgl3YWxsZnVlbDESHAoJd2FsbGZ1ZWwyGDogASgCUgl3YWxsZnVlbDIS'
    'IgoMZWFlRnVlbENvcnIyGDsgASgCUgxlYWVGdWVsQ29ycjISHAoJYm9vc3RkdXR5GDwgASgCUg'
    'lib29zdGR1dHkSHgoKc3luY3JlYXNvbhg9IAEoAlIKc3luY3JlYXNvbhIUCgV1c2VyMBg+IAEo'
    'AlIFdXNlcjASGQoIaW5qX2FkdjEYPyABKAJSB2luakFkdjESGQoIaW5qX2FkdjIYQCABKAJSB2'
    'luakFkdjISIAoLcHVsc2VXaWR0aDMYQSABKAJSC3B1bHNlV2lkdGgzEiAKC3B1bHNlV2lkdGg0'
    'GEIgASgCUgtwdWxzZVdpZHRoNBIgCgt2ZXRyaW0xY3VychhDIAEoAlILdmV0cmltMWN1cnISIA'
    'oLdmV0cmltMmN1cnIYRCABKAJSC3ZldHJpbTJjdXJyEiAKC3ZldHJpbTNjdXJyGEUgASgCUgt2'
    'ZXRyaW0zY3VychIgCgt2ZXRyaW00Y3VychhGIAEoAlILdmV0cmltNGN1cnISEAoDbWFmGEcgAS'
    'gCUgNtYWYSGgoIZWFlbG9hZDEYSCABKAJSCGVhZWxvYWQxEhoKCGFmcmxvYWQxGEkgASgCUghh'
    'ZnJsb2FkMRIWCgZycG1Eb3QYSiABKAJSBnJwbURvdBIcCglncGlvcG9ydDAYSyABKAJSCWdwaW'
    '9wb3J0MBIcCglncGlvcG9ydDEYTCABKAJSCWdwaW9wb3J0MRIcCglncGlvcG9ydDIYTSABKAJS'
    'CWdwaW9wb3J0MhInChBjbF9pZGxlX3RhcmdfcnBtGE4gASgCUg1jbElkbGVUYXJnUnBtEhsKCW'
    '1hZl92b2x0cxhPIAEoAlIIbWFmVm9sdHMSGAoHYWlydGVtcBhQIAEoAlIHYWlydGVtcBIbCglk'
    'd2VsbF90cmwYUSABKAJSCGR3ZWxsVHJsEhkKCGZ1ZWxfcGN0GFIgASgCUgdmdWVsUGN0Eh0KCm'
    'Jvb3N0X3RhcmcYUyABKAJSCWJvb3N0VGFyZxIfCgtleHRfYWR2YW5jZRhUIAEoAlIKZXh0QWR2'
    'YW5jZRIhCgxiYXNlX2FkdmFuY2UYVSABKAJSC2Jhc2VBZHZhbmNlEigKEGlkbGVfY29yX2Fkdm'
    'FuY2UYViABKAJSDmlkbGVDb3JBZHZhbmNlEh0KCm1hdF9yZXRhcmQYVyABKAJSCW1hdFJldGFy'
    'ZBIhCgxmbGV4X2FkdmFuY2UYWCABKAJSC2ZsZXhBZHZhbmNlEhIKBGFkdjEYWSABKAJSBGFkdj'
    'ESEgoEYWR2MhhaIAEoAlIEYWR2MhISCgRhZHYzGFsgASgCUgRhZHYzEiMKDXJldmxpbV9yZXRh'
    'cmQYXCABKAJSDHJldmxpbVJldGFyZBIlCg5uaXRyb3VzX3JldGFyZBhdIAEoAlINbml0cm91c1'
    'JldGFyZBIcCglkZWFkdGltZTEYXiABKAJSCWRlYWR0aW1lMRIfCgtuMm9fYWRkZnVlbBhfIAEo'
    'AlIKbjJvQWRkZnVlbBIYCgdwb3J0YmRlGGAgASgCUgdwb3J0YmRlEhYKBnBvcnRhbRhhIAEoAl'
    'IGcG9ydGFtEhQKBXBvcnR0GGIgASgCUgVwb3J0dBIiCg1jYW5fZXJyb3JfY250GGMgASgCUgtj'
    'YW5FcnJvckNudBIbCgljYW5fZXJyb3IYZCABKAJSCGNhbkVycm9yEhAKA29pbBhlIAEoAlIDb2'
    'lsEhIKBGZ1ZWwYZiABKAJSBGZ1ZWwSGAoHcnVuc2VjcxhnIAEoAlIHcnVuc2VjcxIhCgxzdGFy'
    'dF9yZXRhcmQYaCABKAJSC3N0YXJ0UmV0YXJkEhwKCWNvbm5lY3RlZBhpIAEoCFIJY29ubmVjdG'
    'Vk');

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

@$core.Deprecated('Use consumptionDataDescriptor instead')
const ConsumptionData$json = {
  '1': 'ConsumptionData',
  '2': [
    {'1': 'hodometer', '3': 1, '4': 1, '5': 2, '10': 'hodometer'},
    {'1': 'trip', '3': 2, '4': 1, '5': 2, '10': 'trip'},
    {'1': 'hodometer_consumed', '3': 3, '4': 1, '5': 2, '10': 'hodometerConsumed'},
    {'1': 'trip_consumed', '3': 4, '4': 1, '5': 2, '10': 'tripConsumed'},
    {'1': 'hodometer_fuel_by_distance', '3': 5, '4': 1, '5': 2, '10': 'hodometerFuelByDistance'},
    {'1': 'trip_fuel_by_distance', '3': 6, '4': 1, '5': 2, '10': 'tripFuelByDistance'},
    {'1': 'current_speed', '3': 7, '4': 1, '5': 2, '10': 'currentSpeed'},
  ],
};

/// Descriptor for `ConsumptionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consumptionDataDescriptor = $convert.base64Decode(
    'Cg9Db25zdW1wdGlvbkRhdGESHAoJaG9kb21ldGVyGAEgASgCUglob2RvbWV0ZXISEgoEdHJpcB'
    'gCIAEoAlIEdHJpcBItChJob2RvbWV0ZXJfY29uc3VtZWQYAyABKAJSEWhvZG9tZXRlckNvbnN1'
    'bWVkEiMKDXRyaXBfY29uc3VtZWQYBCABKAJSDHRyaXBDb25zdW1lZBI7Chpob2RvbWV0ZXJfZn'
    'VlbF9ieV9kaXN0YW5jZRgFIAEoAlIXaG9kb21ldGVyRnVlbEJ5RGlzdGFuY2USMQoVdHJpcF9m'
    'dWVsX2J5X2Rpc3RhbmNlGAYgASgCUhJ0cmlwRnVlbEJ5RGlzdGFuY2USIwoNY3VycmVudF9zcG'
    'VlZBgHIAEoAlIMY3VycmVudFNwZWVk');

@$core.Deprecated('Use streamDataDescriptor instead')
const StreamData$json = {
  '1': 'StreamData',
  '2': [
    {'1': 'ecu_data', '3': 1, '4': 1, '5': 11, '6': '.DashElixirFlutter.EcuData', '10': 'ecuData'},
    {'1': 'consumption_data', '3': 2, '4': 1, '5': 11, '6': '.DashElixirFlutter.ConsumptionData', '10': 'consumptionData'},
  ],
};

/// Descriptor for `StreamData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDataDescriptor = $convert.base64Decode(
    'CgpTdHJlYW1EYXRhEjUKCGVjdV9kYXRhGAEgASgLMhouRGFzaEVsaXhpckZsdXR0ZXIuRWN1RG'
    'F0YVIHZWN1RGF0YRJNChBjb25zdW1wdGlvbl9kYXRhGAIgASgLMiIuRGFzaEVsaXhpckZsdXR0'
    'ZXIuQ29uc3VtcHRpb25EYXRhUg9jb25zdW1wdGlvbkRhdGE=');

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

