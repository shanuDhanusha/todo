import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Todos{
  final String title;
  final DateTime exDate;
  final String discription;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String notificationTime;
  final String notificationNote;
  final Color color;
  Todos(
      {
        required this.title,
        required this.exDate,
        required this.discription,
        required this.startTime,
        required this.endTime,
        required this.notificationTime,
        required this.notificationNote,
        required this.color
      }
      );
}