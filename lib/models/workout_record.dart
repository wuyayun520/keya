import 'package:flutter/material.dart';

class WorkoutRecord {
  final String id;
  final String name;
  final String icon; // emoji or icon identifier
  final DateTime date;
  final double hours;
  final int days;
  final Color accentColor;

  WorkoutRecord({
    required this.id,
    required this.name,
    required this.icon,
    required this.date,
    required this.hours,
    required this.days,
    required this.accentColor,
  });
}

