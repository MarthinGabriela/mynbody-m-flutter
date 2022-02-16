// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynbodym/theme.dart';

class ResultPage extends StatefulWidget {
  final List tempList;

  ResultPage(this.tempList, {Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List resultList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    resultList.add("");
    int counter = 0;
    for (int i = 2; i < widget.tempList.length; i++) {
      if (widget.tempList[i] == 3) {
        break;
      } else if (widget.tempList[i] == 27) {
        counter++;
        resultList.add("");
      } else {
        resultList[counter] =
            resultList[counter] + String.fromCharCode(widget.tempList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
        body: InteractiveViewer(
          panEnabled: false, // Set it to false to prevent panning.
          minScale: 0.5,
          maxScale: 4,
          child: Stack(children: [
            TextButton(
                onPressed: () {
                  print(resultList.toString());
                },
                child: Text("GOOO")),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/results/270.png"),
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 68, left: 19),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 63,
                              child: Text(
                                resultList[1],
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                            SizedBox(
                              width: 37,
                              child: Text(
                                resultList[3],
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[4],
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[2],
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                resultList[6] + " : " + resultList[7],
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        // BODY COMPOSITION ANALYSIS
                        SizedBox(
                          height: 28,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                resultList[18] +
                                    " (" +
                                    resultList[174] +
                                    " - " +
                                    resultList[173] +
                                    ")",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                resultList[15] +
                                    " (" +
                                    resultList[148] +
                                    " - " +
                                    resultList[147] +
                                    ")",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                resultList[16] +
                                    " (" +
                                    resultList[150] +
                                    " - " +
                                    resultList[149] +
                                    ")",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                resultList[17] +
                                    " (" +
                                    resultList[169] +
                                    " - " +
                                    resultList[170] +
                                    ")",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                resultList[5] +
                                    " (" +
                                    resultList[154] +
                                    " - " +
                                    resultList[153] +
                                    ")",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        // Muscle Fat Analysis
                        SizedBox(
                          height: 37,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Visibility(
                              visible: double.parse(resultList[5]) <=
                                  double.parse(resultList[154]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: SizedBox(
                                  height: 3,
                                  width: 30,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: double.parse(resultList[5]) >
                                  double.parse(resultList[153]),
                              child: SizedBox(
                                height: 3,
                                width: 30,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[5],
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Visibility(
                              visible: double.parse(resultList[20]) <=
                                  double.parse(resultList[155]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: SizedBox(
                                  height: 3,
                                  width: 30,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: double.parse(resultList[20]) >
                                  double.parse(resultList[156]),
                              child: SizedBox(
                                height: 3,
                                width: 30,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                              width: 30,
                              child: Text(
                                resultList[20],
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Visibility(
                              visible: double.parse(resultList[17]) <=
                                  double.parse(resultList[169]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: SizedBox(
                                  height: 3,
                                  width: 30,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: double.parse(resultList[17]) >
                                  double.parse(resultList[170]),
                              child: SizedBox(
                                height: 3,
                                width: 30,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                              width: 30,
                              child: Text(
                                resultList[17],
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        // Obesity Analysis
                        SizedBox(height: 37),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Visibility(
                              visible: double.parse(resultList[22]) <=
                                  double.parse(resultList[158]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: SizedBox(
                                  height: 5,
                                  width: 30,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: double.parse(resultList[22]) >
                                  double.parse(resultList[157]),
                              child: SizedBox(
                                height: 3,
                                width: 30,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[22],
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Visibility(
                              visible: double.parse(resultList[23]) <=
                                  double.parse(resultList[160]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: SizedBox(
                                  height: 3,
                                  width: 30,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: double.parse(resultList[23]) >
                                  double.parse(resultList[159]),
                              child: SizedBox(
                                height: 3,
                                width: 30,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[23],
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        // Segmental Analysis
                        SizedBox(height: 45),
                        Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[104] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[103] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[109] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[108] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ]),
                        Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[73] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[72] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[131] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[130] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                resultList[105] + " kg",
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                resultList[110] + " kg",
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 42,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[74] + " %",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                            SizedBox(
                              width: 82,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[132] + " %",
                                style: TextStyle(fontSize: 6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[107] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[106] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[112] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              resultList[111] + " kg",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ]),
                        Row(children: [
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 25,
                            child: Text(
                              resultList[76] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 25,
                            child: Text(
                              resultList[75] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 25,
                            child: Text(
                              resultList[134] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 25,
                            child: Text(
                              resultList[133] + " %",
                              style: TextStyle(fontSize: 6),
                            ),
                          ),
                        ]),

                        //Body Composition History
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[5],
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[5],
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            SizedBox(
                              width: 25,
                              child: Text(
                                resultList[5],
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              child: Text(
                                "InBody Score",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(resultList[207] + "/ 100 Poin",
                                style: TextStyle(
                                  fontSize: 10,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Weight Control",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Target Weight",
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                                Text(resultList[203],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Weight Control",
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                                Text(resultList[204],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Fat Control",
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                                Text(resultList[205],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Muscle Control",
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                                Text(resultList[206],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Obesity Evaluation",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("BMI",
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                                Text(resultList[22],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PBF",
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                                Text(resultList[23],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Waist Hip Ratio",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text(resultList[24],
                                style: TextStyle(
                                  fontSize: 10,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Visceral Fat Level",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text(resultList[36],
                                style: TextStyle(
                                  fontSize: 10,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Research Parameters",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Fat Free Mass",
                                    style: TextStyle(
                                      fontSize: 6,
                                    )),
                                Text(resultList[19],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Basal Metabolic Rate",
                                    style: TextStyle(
                                      fontSize: 6,
                                    )),
                                Text(resultList[27],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Obesity Degree",
                                    style: TextStyle(
                                      fontSize: 6,
                                    )),
                                Text(resultList[308],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("SMI",
                                    style: TextStyle(
                                      fontSize: 6,
                                    )),
                                Text(resultList[211],
                                    style: TextStyle(
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
