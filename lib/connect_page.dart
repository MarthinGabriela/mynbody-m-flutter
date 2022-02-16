// ignore_for_file: prefer_const_constructors, unused_import, dead_code, prefer_const_literals_to_create_immutables, void_checks, avoid_print, prefer_final_fields
import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mynbodym/home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mynbodym/theme.dart';
import 'package:mynbodym/pair_page.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ConnectPage extends StatefulWidget {
  var userName;
  var password;
  var device;

  ConnectPage(this.userName, this.password, this.device, {Key? key})
      : super(key: key);
  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  // Initializing the Bluetooth connection state to be unknown
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  bool _connected = false;

  // Get the instance of the Bluetooth
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // Track the Bluetooth connection with the remote device
  BluetoothConnection? connection;

  bool get isConnected => connection != null && connection!.isConnected;

  int? _deviceState;
  BluetoothDevice? _device;
  bool _isButtonUnavailable = false;

  @override
  void initState() {
    super.initState();

    // Get current State
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    _deviceState = 0; //neutral

    // If the Bluetooth of the device is not enabled,
    // then request permission to turn on Bluetooth
    // as the app starts up
    enableBluetooth();

    // Listen to state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // For retrieving the paired devices list
        getPairedDevices();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: redMyn,
        leading: BackButton(color: grayBg),
        title: Text(
          'MynBody App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: Text("Segarkan", style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await getPairedDevices();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              child: LinearProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Nyalakan Bluetooth",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Switch(
                      value: _bluetoothState.isEnabled,
                      onChanged: ((bool value) {
                        future() async {
                          if (value) {
                            await FlutterBluetoothSerial.instance
                                .requestEnable();
                          } else {
                            await FlutterBluetoothSerial.instance
                                .requestDisable();
                          }

                          await getPairedDevices();
                          _isButtonUnavailable = false;

                          if (_connected) {
                            _disconnect();
                          }
                        }

                        future().then((_) {
                          setState(() {});
                        });
                      }))
                ],
              ),
            ),
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Perangkat Terhubung",
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DropdownButton(
                      items: _getDeviceItems(),
                      onChanged: (value) =>
                          setState(() => _device = value as BluetoothDevice?),
                      value: _devicesList.isNotEmpty ? _device : null,
                    ),
                    ElevatedButton(
                      onPressed: _isButtonUnavailable
                          ? null
                          : _connected
                              ? _disconnect
                              : _connect,
                      child: Text(_connected ? "Putus" : "Hubungkan"),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 3,
                            color: _deviceState == 0
                                ? Colors.blue
                                : _deviceState == 1
                                    ? Colors.yellow
                                    : Colors.green),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: _deviceState == 0 ? 4 : 0,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Perangkat",
                            style: TextStyle(fontSize: 20),
                          )),
                          TextButton(
                              onPressed: _connected ? _checkInbodyReady : null,
                              child: Text("CHECK"))
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    // turn on the Bluetooth if it is off and return paired devices
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
    } else {
      await getPairedDevices();
    }
  }

  List<BluetoothDevice> _devicesList = [];

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
      print(devices);
    } on PlatformException {
      print("Terjadi masalah");
    }

    // It is an error to call setState unless mounted is true
    if (!mounted) {
      return;
    }

    // Store the devices list in the List for access
    setState(() {
      _devicesList = devices;
    });
  }

  // Define a member variable to track
  // when the disconnection is in progress
  bool isDisconnecting = false;

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
  }

  void _connect() async {
    if (_device == null) {
    } else {
      if (!isConnected) {
        await BluetoothConnection.toAddress(_device!.address)
            .then((_connection) {
          connection = _connection;

          setState(() {
            _connected = true;
          });

          connection!.input!.listen((Uint8List data) {
            // if(data.length == 5) {
            //   if(data[2] == 48) {

            //   }
            // }
          }).onDone(() {
            if (mounted) {
              setState(() {});
            }
          });
        }).catchError((error) {
          print(error);
        });
      }
    }
  }

  void _disconnect() async {
    await connection!.close();

    if (!connection!.isConnected) {
      setState(() {
        _connected = false;
      });
    }
  }

  void _checkInbodyReady() async {
    List<int> data = [2, 99, 3];
    Uint8List bytes = Uint8List.fromList(data);

    connection!.output.add(bytes);
    await connection!.output.allSent;
    print("Data sent");
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('TIDAK ADA'),
      ));
    } else {
      _devicesList.forEach((device) {
        String? deviceName = device.name;
        deviceName ??= "Kosong";
        items.add(DropdownMenuItem(
          child: Text(deviceName),
          value: device,
        ));
      });
    }
    return items;
  }

  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;
    print("Buffer" + bufferIndex.toString());

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    print(buffer);
  }
}
