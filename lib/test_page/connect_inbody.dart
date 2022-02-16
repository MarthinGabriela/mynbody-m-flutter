// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynbodym/converter/converter.dart';
import 'package:mynbodym/misc/loading.dart';
import 'package:mynbodym/test_page/result_page.dart';
import 'package:mynbodym/theme.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:page_transition/page_transition.dart';

class ConnectInBody extends StatefulWidget {
  final String name;
  final String gender;
  final String age;
  final String height;

  const ConnectInBody(
      accountName, this.name, this.gender, this.age, this.height,
      {Key? key})
      : super(key: key);

  @override
  _ConnectInBodyState createState() => _ConnectInBodyState();
}

class _ConnectInBodyState extends State<ConnectInBody> {
  // int _currentIndex = 0;

  // final List<Widget> _widgetList = [
  //   Loading(),
  // ];

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  bool _connected = false;
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection? connection;

  bool get isConnected => connection != null && connection!.isConnected;
  int? _deviceState;
  BluetoothDevice? _device;
  bool _isButtonUnavailable = false;
  int _processState = 0;
  List _result = [];
  bool _loading = false;

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
    _processState = 0; //beginning

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
        try {
          await BluetoothConnection.toAddress(_device!.address)
              .then((_connection) async {
            connection = _connection;

            setState(() {
              _connected = true;
            });

            var subscription =
                connection!.input!.listen((Uint8List list) async {
              List data = Converter.convert(list);
              if (list[2] == 48) {
                print("Perangkat siap digunakan");
                if (_processState == 0) {
                  setState(() {
                    _processState = 1;
                  });
                }
              }
              if (list[2] == 49) {
                print("Perangkat selesai menimbang, menunggu informasi");
                _sendPersonalInput(
                    widget.name, widget.gender, widget.age, widget.height);
                if (_processState <= 1) {
                  setState(() {
                    _processState = 2;
                  });
                }
              }
              if (list[1] == 117) {
                print("Data Personal telah diterima");
                if (_processState <= 2) {
                  setState(() {
                    _processState = 3;
                  });
                }
              }

              if (list[2] == 50) {
                print("Perangkat masih mengukur pasien");
              } else if (list[2] == 51) {
                _receiveTestInfo();
                if (_processState <= 3) {
                  setState(() {
                    _loading = true;
                    _processState = 4;
                  });
                }
              }

              if (list[1] == 100) {
                _result = data;
                if (_processState <= 4) {
                  setState(() {
                    _loading = false;
                    _processState = 5;
                  });
                }
              }
              if (list[0] != 2 && _processState <= 5) {
                _result.addAll(data);
              }
            });
            await subscription.asFuture<void>();
          }).catchError((error) {
            print(error);
          });
        } on Exception catch (_) {
          print("Perangkat tidak terdeteksi");
        }
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

////////////////////////////////////////////////////////////////////////////////
  void _checkInbodyReady() async {
    print("Function Passed");
    _loading = false;
    List<int> data = [2, 99, 3];
    Uint8List bytes = Uint8List.fromList(data);

    connection!.output.add(bytes);
    await connection!.output.allSent;
    print("Data sent");
  }

  void _sendPersonalInput(name, gender, age, height) async {
    List<int> convertedName = Converter.convertString(name);
    List<int> convertedAge = Converter.convertString(age);
    List<int> convertedGender = Converter.convertString(gender);
    List<int> convertedHeight = Converter.convertString(height);

    List<int> data = [2, 117];
    data.addAll(convertedName);
    data.add(27);
    data.addAll(convertedGender);
    data.add(27);
    data.addAll(convertedHeight);
    data.add(27);
    data.addAll(convertedAge);
    data.add(27);
    data.add(3);

    Uint8List bytes = Uint8List.fromList(data);

    connection!.output.add(bytes);
    await connection!.output.allSent;
    print("Personal data sent");
  }

  void _receiveTestInfo() async {
    List<int> data = [2, 100, 3];
    Uint8List bytes = Uint8List.fromList(data);

    connection!.output.add(bytes);
    await connection!.output.allSent;
    print("Request Data sent");
  }

////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayBg,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: redMyn),
              child: Image.asset(
                "assets/images/LogoLandscape.png",
              ),
            ),
            ListTile(
              title: const Text("Test InBody"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Lihat Hasil Test"),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: redMyn,
        title: Text(
          'Hubungkan Perangkat',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: grayBg,
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(200.0)),
              color: const Color.fromRGBO(255, 255, 255, 0.4),
              child: SizedBox(
                width: 400,
                height: 400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hubungkan InBody Anda",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: redMyn,
                            fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Anda bisa melihat ID Bluetooth perangkat InBody Anda pada menu Administrator InBody",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _getDeviceItems(),
                          onChanged: (value) => setState(
                              () => _device = value as BluetoothDevice?),
                          value: _devicesList.isNotEmpty ? _device : null,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: redMyn),
                            onPressed: _isButtonUnavailable
                                ? null
                                : _connected
                                    ? _disconnect
                                    : _connect,
                            child: Text(_connected ? "Putus" : "Hubungkan"),
                          ),
                          Visibility(
                            visible: _connected && (_processState < 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: lightRed),
                                    onPressed:
                                        _connected ? _checkInbodyReady : null,
                                    child: Text("Lakukan Test")),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: _connected && (_processState == 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: lightRed),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: ResultPage(
                                                _result,
                                                key: Key("Login Key"),
                                              ),
                                              type: PageTransitionType
                                                  .rightToLeft));
                                    },
                                    child: Text("Lihat Hasil Tes")),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Visibility(
                      //     visible: _loading,
                      //     child: Expanded(
                      //         child: Column(
                      //       children: [
                      //         SizedBox(
                      //           height: 20,
                      //         ),
                      //         Loading(),
                      //       ],
                      //     ))),
                      Visibility(
                        visible: _connected,
                        child: TextButton(
                            onPressed: () {
                              _result = [];
                              setState(() {
                                _processState = 0;
                              });
                            },
                            child: Text("Clear Result")),
                      ),
                    ],
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Card(
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //             width: 3,
                  //             color: _deviceState == 0
                  //                 ? Colors.blue
                  //                 : _deviceState == 1
                  //                     ? Colors.yellow
                  //                     : Colors.green),
                  //         borderRadius: BorderRadius.circular(4.0),
                  //       ),
                  //       elevation: _deviceState == 0 ? 4 : 0,
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //               child: Text(
                  //             "Perangkat",
                  //             style: TextStyle(fontSize: 20),
                  //           )),
                  //         ],
                  //       ),
                  //     )),
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
