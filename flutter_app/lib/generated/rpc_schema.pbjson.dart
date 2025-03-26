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
    {'1': 'map_kpa', '3': 1, '4': 1, '5': 2, '10': 'mapKpa'},
    {'1': 'map_bar', '3': 2, '4': 1, '5': 2, '10': 'mapBar'},
    {'1': 'map_psi', '3': 3, '4': 1, '5': 2, '10': 'mapPsi'},
    {'1': 'mat_celsius', '3': 4, '4': 1, '5': 2, '10': 'matCelsius'},
    {'1': 'battery_voltage', '3': 5, '4': 1, '5': 2, '10': 'batteryVoltage'},
  ],
};

/// Descriptor for `EcuData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ecuDataDescriptor = $convert.base64Decode(
    'CgdFY3VEYXRhEhcKB21hcF9rcGEYASABKAJSBm1hcEtwYRIXCgdtYXBfYmFyGAIgASgCUgZtYX'
    'BCYXISFwoHbWFwX3BzaRgDIAEoAlIGbWFwUHNpEh8KC21hdF9jZWxzaXVzGAQgASgCUgptYXRD'
    'ZWxzaXVzEicKD2JhdHRlcnlfdm9sdGFnZRgFIAEoAlIOYmF0dGVyeVZvbHRhZ2U=');

