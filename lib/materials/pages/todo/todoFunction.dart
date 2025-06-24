import 'dart:convert';

import 'package:calculator/materials/pages/todo/priorityLevel.dart';

class Todofunction {
  int id;
  String title;
  String description;
  bool isCompleted;
  DateTime created_at;
  DateTime? dueDate;
  Prioritylevel priority;

  Todofunction({
    required this.id,
    required this.title,
    this.description = '',
    required this.created_at,
    this.isCompleted = false,
    this.dueDate,
    this.priority = Prioritylevel.medium,
  });

  String toJson() {
    return jsonEncode({
      'id': id,
      'title': title,
      'description': description,
      'created_at': created_at,
      'isCompleted': isCompleted,
      'dueDate': dueDate,
      'priority': priority.name,
    });
  }

  factory Todofunction.fromJson(String source) {
    final Map<String, dynamic> data = jsonDecode(source);
    return Todofunction(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      created_at: data['created_at'],
      isCompleted: data['isCompleted'],
      dueDate: data['dueDate'],
      priority: Prioritylevel.values.byName(data['priority'] ?? 'medium'),
    );
  }
}
