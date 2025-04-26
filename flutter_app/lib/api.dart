import 'dart:io';

import 'package:flutter_app/generated/rpc_schema.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class API {
  static String _baseHostname = "127.0.0.1";
  static ClientChannel? _channel;
  static RPCClient? _client;

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
  }

  static Stream<StreamData> streamData() {
    final request = Empty();
    return _client!.streamInfo(request);
  }

  static Future<Empty> rebootSystem() async {
    return await _client!.rebootSystem(Empty.create());
  }
}
