import 'dart:convert';

class Note {
  final String title;
  final String description;

  Note({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description};
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(title: map['title'], description: map['description']);
  }
}
