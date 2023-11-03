import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeStyle extends Equatable {
  final String name;
  final Color primary;
  final Color primaryContainer;
  final Color secondary;
  final Color scaffoldColor1;
  final Color scaffoldColor2;
  final Color backgroundColor;

  const ThemeStyle(
      {required this.name,
      required this.primary,
      required this.primaryContainer,
      required this.secondary,
      required this.scaffoldColor1,
      required this.scaffoldColor2,
      required this.backgroundColor});

  factory ThemeStyle.fromJson(Map<String, dynamic> parsedJson) {
    return ThemeStyle(
      name: parsedJson['name'] as String,
      primary: Color(int.parse(parsedJson['primary'], radix: 16)),
      primaryContainer:
          Color(int.parse(parsedJson['primaryContainer'], radix: 16)),
      secondary: Color(int.parse(parsedJson['secondary'], radix: 16)),
      scaffoldColor1: Color(int.parse(parsedJson['scaffoldColor1'], radix: 16)),
      scaffoldColor2: Color(int.parse(parsedJson['scaffoldColor2'], radix: 16)),
      backgroundColor:
          Color(int.parse(parsedJson['backgroundColor'], radix: 16)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'primary': primary.value.toRadixString(16),
      'primaryContainer': primaryContainer.value.toRadixString(16),
      'secondary': secondary.value.toRadixString(16),
      'scaffoldColor1': scaffoldColor1.value.toRadixString(16),
      'scaffoldColor2': scaffoldColor2.value.toRadixString(16),
      'backgroundColor': backgroundColor.value.toRadixString(16),
    };
  }

  @override
  List<Object?> get props => [name];
}

final List<ThemeStyle> themeData = [
  ThemeStyle(
    name: "藍色",
    primary: const Color(0xFF1E88E5),
    primaryContainer: const Color(0xFF90CAF9),
    secondary: const Color(0xFF90CAF9),
    scaffoldColor1: const Color(0xFF006064),
    scaffoldColor2: const Color(0xFF0D47A1),
    backgroundColor: const Color(0xFFF5F5FF),
  ),
  ThemeStyle(
    name: "紅色",
    primary: const Color(0xFFE53935),
    primaryContainer: const Color(0xFF90CAF9),
    secondary: const Color(0xFFef9a9a),
    scaffoldColor1: const Color(0xFFC2185B),
    scaffoldColor2: const Color(0xFFD32F2F),
    backgroundColor: const Color(0xFFFFF5F5),
  ),
  ThemeStyle(
    name: "綠色",
    primary: const Color(0xFF00897B),
    primaryContainer: const Color(0xFF90CAF9),
    secondary: const Color(0xFF80cbc4),
    scaffoldColor1: const Color(0xFF33691E),
    scaffoldColor2: const Color(0xFF014E40),
    backgroundColor: const Color(0xFFF5FFF5),
  ),
  ThemeStyle(
    name: "紫色",
    primary: const Color(0xFF8e24aa),
    primaryContainer: const Color(0xFF90CAF9),
    secondary: const Color(0xFFce93d8),
    scaffoldColor1: const Color(0xFFA5668B),
    scaffoldColor2: const Color(0xFF69306D),
    backgroundColor: const Color(0xFFFFF3FF),
  ),
];
