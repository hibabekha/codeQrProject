import 'package:flutter/material.dart';

class Visitor
{
  String _id;
  String _time;
  String _date;
  String _doorNumber;

  Visitor(this._id, this._time, this._date, this._doorNumber);
  Visitor.fromJson(Map<String, dynamic> json) : _id = json['id'],  _time = json['time'],_date = json['date'],_doorNumber = json['door'];
  Map<String, dynamic> toJson() => {
    'id': _id,
    'time':_time,
    'date':_date,
    'door': _doorNumber,
  };



  // *****************************  Setter  *****************************
  set id(String id) {
    _id = id;
  }

  set time(String time) {
    _time = time;
  }

  set score(String date) {
    _date = date;
  }

  set photo(String doorNumber) {
    _doorNumber = doorNumber;
  }

// *****************************  Getter  *****************************

  String get id => _id;
  String get time => _time;
  String  get date => _date;
  String get doorNumber => _doorNumber;
}


