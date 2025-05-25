import 'dart:io';

import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class API {
  static String _baseHostname = "127.0.0.1";
  static ClientChannel? _channel;
  static RPCClient? _client;
  static late final Stream<StreamData> _broadcastStream;

  static updateBaseURI() {
    final env = Platform.environment;
    if (env.keys.contains("BASE_RPC_HOSTNAME")) {
      _baseHostname = env["BASE_RPC_HOSTNAME"]!;
    }

    // Create the gRPC channel and stub
    _channel = ClientChannel(_baseHostname,
        port: 50051,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure(), idleTimeout: Duration(minutes: 1)));

    _client = RPCClient(_channel!, options: CallOptions());
    _broadcastStream = _client!.streamInfo(Empty()).asBroadcastStream();
  }

  static Stream<StreamData> streamData() {
    return _broadcastStream;
  }

  static Future<Empty> rebootSystem() async {
    return await _client!.rebootSystem(Empty.create());
  }

  static Future<DeviceList> listBluetoothDevices() async {
    return await _client!.listBluetoothDevices(Empty.create());
  }

  static Future<ActionResult> connectDevice(Device device) async {
    return await _client!.tryConnectDevice(device);
  }
}
