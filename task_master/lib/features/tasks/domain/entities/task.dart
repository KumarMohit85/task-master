// ignore_for_file: public_member_api_docs, sort_constructors_first
// Hints:
// - Use immutable class with final properties
// - Include: id, title, description, isCompleted, createdAt
// - Override toString(), hashCode, == for proper comparisons
// - Consider using Equatable package later

class Task {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  // factory constructor
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'],
        createdAt: DateTime.parse(json['createdAt']));
  }

  // convert task to JSOn
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt
    };
  }

  // override '==' and 'hashcode' for value comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.createdAt == createdAt;
  }

  @override
  // TODO: implement hashCode
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isCompleted.hashCode ^
        createdAt.hashCode;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Task(id: $id, title: $title, description: $description, isCompleted: $isCompleted, createdAt: $createdAt)";
  }
}
