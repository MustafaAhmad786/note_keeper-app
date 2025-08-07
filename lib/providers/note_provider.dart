import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:marfah_tech/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void AddNote(Note note) {
    _notes.add(note);
    saveNotes();
    notifyListeners();
  }

  void EditNotes(int index, Note updateNotes) {
    _notes[index] = updateNotes;
    saveNotes();
    notifyListeners();
  }

  void deleteNotes(int index) {
    _notes.removeAt(index);
    saveNotes();
    notifyListeners();
  }

  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesDate = _notes.map((note) => note.toMap()).toList();
    final jsonString = jsonEncode(notesDate);
    await prefs.setString('notes', jsonString);
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('notes');
    if (jsonString != null) {
      final decoded = jsonDecode(jsonString) as List;
      _notes = decoded.map((item) => Note.fromMap(item)).toList();
      notifyListeners();
    }
  }
}
