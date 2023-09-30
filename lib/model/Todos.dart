import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Todos{
  final int id;
  final String title;
  final String exDate;
  final String discription;
  final String startTime;
  final String endTime;
  final String notificationTime;
  final String notificationNote;
  final int color;
  Todos(
      {
        required this.id,
        required this.title,
        required this.exDate,
        required this.discription,
        required this.startTime,
        required this.endTime,
        required this.notificationTime,
        required this.notificationNote,
        required this.color,

      }
      );

  // factory Todos.fromJson(Map<String,dynamic>json)=>Todos(
  //     id: 0,
  //     title: json['title'],
  //     exDate:json['exDate'],
  //     discription: json['discription'],
  //     startTime: json['startTime'],
  //     endTime: json['endTime'],
  //     notificationTime: json['notificationTime'],
  //     notificationNote: json['notificationNote'],
  //     color: json['color']
  // );

  Map<String,dynamic>toJson()=>{
    //'id':id,
    'title':title,
    'exDate':exDate,
    'discription':discription,
    'startTime':startTime,
    'endTime':endTime,
    'notificationTime':notificationTime,
    'notificationNote':notificationNote,
    'color':color

  };


}