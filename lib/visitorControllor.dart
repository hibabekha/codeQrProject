import 'dart:async';
import 'dart:convert';
import 'Model/visitor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisitorBloc {
  final List<Visitor> _visitorList = [];
   List<String> _visitorListString = [];
  List <Visitor> listVisitor = [];

  late final SharedPreferences sharedPreferences;
// *****************************  Step 1 : Stream Controller   *****************************
  final _visitorStreamController = StreamController<List<Visitor>>();
   final _visitorSaveInListController = StreamController<Visitor>();

// *****************************  Step 2 : Stream & Sink   *****************************

  Stream<List<Visitor>> get visitorListStream =>
      _visitorStreamController.stream;


  StreamSink<Visitor> get visitorSaveInList =>
      _visitorSaveInListController.sink;


// *****************************  Step 3 : Constructor & Listen To changes    *****************************
  VisitorBloc() {
 initSharedPreference();
    _visitorSaveInListController.stream.listen(_savevisitor);
  }
// *****************************  Step 3 : Core Function    *****************************
  void initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  _savevisitor(Visitor visitor) async{
  if(sharedPreferences.getStringList("visitorListData")?.toList() != null  ) {
      _visitorListString =
          sharedPreferences.getStringList("visitorListData")!.toList();
    }
    String ne
    
    String newVisitorToJson = jsonEncode(visitor);

    _visitorListString.add(newVisitorToJson);
    sharedPreferences.setStringList("visitorListData", _visitorListString);
    print(_visitorListString);
  }

// *****************************  Step 5 : Dispose     *****************************

  void dispose() {
    _visitorStreamController.close();
    _visitorSaveInListController.close();
  }
}
