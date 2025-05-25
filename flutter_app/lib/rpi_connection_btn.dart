import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/generated/rpc_schema.pb.dart';

class RpiConnectionBtn extends StatefulWidget {
  final bool isConnected;
  final BuildContext context;

  const RpiConnectionBtn({super.key, required this.isConnected, required this.context});

  @override
  State<RpiConnectionBtn> createState() => _RpiConnectionBtnState();
}

class _RpiConnectionBtnState extends State<RpiConnectionBtn> {
  bool isRequesting = false;

  @override
  Widget build(BuildContext context) {
    Color iconColor = widget.isConnected ? Colors.green : Colors.red;

    void openConnectionModal(List<Device> devices) {
      showModalBottomSheet<void>(
        context: widget.context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9,
            builder: (context, scrollController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Dispositivos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: devices
                            .map((d) => TextButton(
                                  onPressed: () => {
                                    API.connectDevice(d),
                                    Navigator.pop(context),
                                  },
                                  child: Text(d.name),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    void listDevices() async {
      setState(() => isRequesting = true);
      DeviceList newList = await API.listBluetoothDevices();
      setState(() => isRequesting = false);
      if (newList.devices.isEmpty) return;
      openConnectionModal(newList.devices);
    }

    return isRequesting
        ? const SizedBox(height: 32, width: 32, child: Center(child: CircularProgressIndicator()))
        : IconButton(icon: Icon(Icons.bluetooth_connected, color: iconColor, size: 32), onPressed: () => listDevices());
  }
}
