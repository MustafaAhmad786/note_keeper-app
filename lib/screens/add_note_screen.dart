import 'package:flutter/material.dart';
import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/providers/note_provider.dart';

import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  final titleController = TextEditingController();
  final discriptionController = TextEditingController();

  void submitNotes() {
    titleController.text;
    discriptionController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)),
            child: AppBar(
              elevation: 30,
              centerTitle: true,
              title: Text("Notes Keeper"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue.withOpacity(0.1),
            height: MediaQuery.of(context).size.height / 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.2),
                      border: Border.all(width: 1.0, color: Colors.teal),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Title",
                        labelText: "Title",
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.2),
                      border: Border.all(width: 1.0, color: Colors.teal),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(5, 10),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: discriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Discription",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Discription",
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Title require")),
                        );
                      } else {
                        final newNotes = Note(
                          title: titleController.text,
                          description: discriptionController.text,
                        );
                        Provider.of<NoteProvider>(
                          context,
                          listen: false,
                        ).AddNote(newNotes);
                        Navigator.pop(context);
                      }
                    },
                    child: Text("save", style: TextStyle(fontSize: 20)),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 62, 88),
                      elevation: 3,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
