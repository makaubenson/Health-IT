import 'package:flutter/material.dart';
class Facility {
  final String code;
  final String name;
  final String registration_number;
  final String keph_level;

  Facility({
    required this.code,
    required this.name,
    required this.registration_number,
    required this.keph_level,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      code: json['Code'],
      name: json['Name'],
      registration_number: json['Registration_number'],
      keph_level: json['Keph level'],
    );
  }
}