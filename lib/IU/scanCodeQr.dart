import 'package:code_qr_project/Model/visitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:code_qr_project/visitorControllor.dart';

class ScanCodeQr extends StatefulWidget {
  static const id = 'scanCodeQr';

  @override
  State<ScanCodeQr> createState() => _ScanCodeQrState();
}

class _ScanCodeQrState extends State<ScanCodeQr> {
  var qrstr = "let's Scan it";
  var time = DateTime.now();
  var height, width;
  final doorList = ["Door 1", "Door 2", "Door 3"];
  var selected_value = "Door 1";
  final VisitorBloc _visitorBloc = VisitorBloc();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: StreamBuilder<List<Visitor>>(
        stream: _visitorBloc.visitorListStream,
        builder: (BuildContext context, AsyncSnapshot<List<Visitor>> snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  alignment: Alignment.center,
                  child: Form(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: qrstr,
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        labelText: "Code Qr ID",
                        labelStyle: TextStyle(color: Colors.deepPurple[300]),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        prefixIcon: Icon(
                          Icons.qr_code_scanner,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  alignment: Alignment.center,
                  child: Form(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: ' ${time.hour}:${time.minute}:${time.second}',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        labelText: "Entry Time ",
                        labelStyle: TextStyle(color: Colors.deepPurple[300]),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        prefixIcon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  alignment: Alignment.center,
                  child: Form(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: ' ${time.day}/${time.month}/${time.year}',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        labelText: "Entry Date",
                        labelStyle: TextStyle(color: Colors.deepPurple[300]),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  alignment: Alignment.center,
                  child: DropdownButtonFormField(
                    value: selected_value,
                    items: doorList.map((e) {
                      return DropdownMenuItem(child: Text(e), value: e);
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selected_value = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_rounded,
                      color: Colors.deepPurple,
                    ),
                    decoration: InputDecoration(
                      labelText: "Entry Door",
                      labelStyle: TextStyle(color: Colors.deepPurple[300]),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      prefixIcon: Icon(
                        Icons.door_front_door,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    print(" Saved");

                    Visitor newVisitor = Visitor(
                        qrstr,
                        ' ${time.hour}:${time.minute}:${time.second}',
                        '${time.day}/${time.month}/${time.year}',
                        selected_value);
                    _visitorBloc.visitorSaveInList.add(newVisitor);
                  },
                  child: Container(
                      height: 60,
                      width: 390,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 15.0),
                              blurRadius: 30.0,
                              color: Colors.grey,
                            )
                          ],
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 310,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            child: Text("Save Visitor",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.apply(color: Colors.white)),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.purple.shade400,
                                    Colors.blueAccent.shade400
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22.0),
                                  topLeft: Radius.circular(22.0),
                                  bottomRight: Radius.circular(22.0)),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              child: Image.asset(
                                "assets/images/scanIcon.png",
                                height: 60,
                                width: 60,
                              )),
                        ],
                      )),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    scanQr();
                    print(" scan");
                  },
                  child: Container(
                      height: 60,
                      width: 390,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 15.0),
                              blurRadius: 30.0,
                              color: Colors.grey,
                            )
                          ],
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 310,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            child: Text("Scan Code Qr",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.apply(color: Colors.white)),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.purple.shade400,
                                    Colors.blueAccent.shade400
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22.0),
                                  topLeft: Radius.circular(22.0),
                                  bottomRight: Radius.circular(22.0)),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              child: Image.asset(
                                "assets/images/scanIcon.png",
                                height: 60,
                                width: 60,
                              )),
                        ],
                      )),
                ),
                SizedBox(height: 150)
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      print("i tried");
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrstr = value;
          time = DateTime.now();
        });
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to read this';
      });
    }
  }
}
