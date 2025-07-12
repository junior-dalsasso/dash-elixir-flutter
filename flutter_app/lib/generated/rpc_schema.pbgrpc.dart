//
//  Generated code. Do not modify.
//  source: rpc_schema.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc_schema.pb.dart' as $0;

export 'rpc_schema.pb.dart';

@$pb.GrpcServiceName('DashElixirFlutter.RPC')
class RPCClient extends $grpc.Client {
  static final _$streamInfo = $grpc.ClientMethod<$0.Empty, $0.StreamData>(
      '/DashElixirFlutter.RPC/StreamInfo',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamData.fromBuffer(value));
  static final _$startCalibration = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/DashElixirFlutter.RPC/startCalibration',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$resetTrip = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/DashElixirFlutter.RPC/resetTrip',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$resetHodometer = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/DashElixirFlutter.RPC/resetHodometer',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$rebootSystem = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/DashElixirFlutter.RPC/RebootSystem',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listBluetoothDevices = $grpc.ClientMethod<$0.Empty, $0.DeviceList>(
      '/DashElixirFlutter.RPC/listBluetoothDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeviceList.fromBuffer(value));
  static final _$tryConnectDevice = $grpc.ClientMethod<$0.Device, $0.ActionResult>(
      '/DashElixirFlutter.RPC/tryConnectDevice',
      ($0.Device value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ActionResult.fromBuffer(value));

  RPCClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.StreamData> streamInfo($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamInfo, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Empty> startCalibration($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startCalibration, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> resetTrip($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetTrip, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> resetHodometer($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetHodometer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> rebootSystem($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rebootSystem, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeviceList> listBluetoothDevices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBluetoothDevices, request, options: options);
  }

  $grpc.ResponseFuture<$0.ActionResult> tryConnectDevice($0.Device request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tryConnectDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('DashElixirFlutter.RPC')
abstract class RPCServiceBase extends $grpc.Service {
  $core.String get $name => 'DashElixirFlutter.RPC';

  RPCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.StreamData>(
        'StreamInfo',
        streamInfo_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.StreamData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'startCalibration',
        startCalibration_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'resetTrip',
        resetTrip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'resetHodometer',
        resetHodometer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'RebootSystem',
        rebootSystem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.DeviceList>(
        'listBluetoothDevices',
        listBluetoothDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.DeviceList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Device, $0.ActionResult>(
        'tryConnectDevice',
        tryConnectDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Device.fromBuffer(value),
        ($0.ActionResult value) => value.writeToBuffer()));
  }

  $async.Stream<$0.StreamData> streamInfo_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* streamInfo(call, await request);
  }

  $async.Future<$0.Empty> startCalibration_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return startCalibration(call, await request);
  }

  $async.Future<$0.Empty> resetTrip_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return resetTrip(call, await request);
  }

  $async.Future<$0.Empty> resetHodometer_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return resetHodometer(call, await request);
  }

  $async.Future<$0.Empty> rebootSystem_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return rebootSystem(call, await request);
  }

  $async.Future<$0.DeviceList> listBluetoothDevices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listBluetoothDevices(call, await request);
  }

  $async.Future<$0.ActionResult> tryConnectDevice_Pre($grpc.ServiceCall call, $async.Future<$0.Device> request) async {
    return tryConnectDevice(call, await request);
  }

  $async.Stream<$0.StreamData> streamInfo($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> startCalibration($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> resetTrip($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> resetHodometer($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> rebootSystem($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.DeviceList> listBluetoothDevices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ActionResult> tryConnectDevice($grpc.ServiceCall call, $0.Device request);
}
