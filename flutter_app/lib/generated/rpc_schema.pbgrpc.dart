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
  static final _$streamEcuData = $grpc.ClientMethod<$0.Empty, $0.EcuData>(
      '/DashElixirFlutter.RPC/StreamEcuData',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.EcuData.fromBuffer(value));
  static final _$rebootSystem = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/DashElixirFlutter.RPC/RebootSystem',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  RPCClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.EcuData> streamEcuData($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamEcuData, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Empty> rebootSystem($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rebootSystem, request, options: options);
  }
}

@$pb.GrpcServiceName('DashElixirFlutter.RPC')
abstract class RPCServiceBase extends $grpc.Service {
  $core.String get $name => 'DashElixirFlutter.RPC';

  RPCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.EcuData>(
        'StreamEcuData',
        streamEcuData_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.EcuData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'RebootSystem',
        rebootSystem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Stream<$0.EcuData> streamEcuData_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* streamEcuData(call, await request);
  }

  $async.Future<$0.Empty> rebootSystem_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return rebootSystem(call, await request);
  }

  $async.Stream<$0.EcuData> streamEcuData($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> rebootSystem($grpc.ServiceCall call, $0.Empty request);
}
