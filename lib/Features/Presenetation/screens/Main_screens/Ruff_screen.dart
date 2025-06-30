
import 'package:flutter/material.dart';

enum Severity { low, medium, high }

class BugModel {
  final String id;
  final String title;
  final String description;
  final String developer;
  final DateTime date;
  final Severity severity;
  final bool isFixed;

  BugModel({
    required this.id,
    required this.title,
    required this.description,
    required this.developer,
    required this.date,
    required this.severity,
    required this.isFixed,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'developer': developer,
      'date': date.toIso8601String(),
      'severity': severity.index, // store as int
      'isFixed': isFixed,
    };
  }

  factory BugModel.fromMap(Map<String, dynamic> map) {
    return BugModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      developer: map['developer'],
      date: DateTime.parse(map['date']),
      severity: Severity.values[map['severity']],
      isFixed: map['isFixed'],
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
