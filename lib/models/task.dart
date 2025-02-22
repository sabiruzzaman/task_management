import 'dart:convert';

class Task {
  final int? id;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final String category;
  final int isDone;

  Task(
      {this.id,
      required this.title,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.description,
      required this.category,
      required this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'category': category,
      'isDone': isDone
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        id: map['id']?.toInt() ?? 0,
        title: map['title'] ?? '',
        date: map['date'] ?? '',
        startTime: map['startTime'] ?? '',
        endTime: map['endTime'] ?? '',
        description: map['description'] ?? '',
        category: map['category'] ?? '',
        isDone: map['isDone']?.toInt() ?? 0);
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task{id: $id, title: $title, date: $date, startTime: $startTime, endTime: $endTime, description: $description, category: $category, isDone: $isDone}';
  }
}
