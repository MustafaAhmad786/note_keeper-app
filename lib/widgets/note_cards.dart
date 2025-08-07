import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marfah_tech/models/note.dart';
import 'package:marfah_tech/providers/note_provider.dart';
import 'package:marfah_tech/screens/edit_note_screen.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  final VoidCallback? onTap;

  NoteCard({required this.note, this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.5,
            color: const Color.fromARGB(255, 67, 29, 136),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    note.title,

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Icon(Icons.more_vert),
                        items: [
                          DropdownMenuItem(child: Text('Edit'), value: 'edit'),
                          DropdownMenuItem(
                            child: Text('Delete'),
                            value: 'delete',
                          ),
                        ],
                        onChanged: (String? newvalue) {
                          if (newvalue == "edit") {
                            print("Note: ${note.title} Index: $index");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => EditNoteScreenState(
                                      note: note,
                                      index: index,
                                    ),
                              ),
                            );
                            // edit action
                          } else if (newvalue == "delete") {
                            Provider.of<NoteProvider>(
                              context,
                              listen: false,
                            ).deleteNotes(index);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                note.description.length > 100
                    ? note.description.substring(0, 100) + '...'
                    : note.description,
                style: TextStyle(color: Colors.grey[800]),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
