import 'package:flutter/material.dart';
import 'package:marfah_tech/models/note.dart';
import 'package:marfah_tech/providers/note_provider.dart';
import 'package:provider/provider.dart';

class EditNoteScreenState extends StatefulWidget {
  final Note note;
  final int index;
  EditNoteScreenState({super.key, required this.note, required this.index});

  @override
  State<EditNoteScreenState> createState() => __EditNOteScreenStateState();
}

class __EditNOteScreenStateState extends State<EditNoteScreenState> {
  late TextEditingController titleController;

  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    descriptionController = TextEditingController(
      text: widget.note.description,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
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
                      hintText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(5, 10),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: 5,

                    decoration: InputDecoration(
                      hintText: "Discription",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final updateNote = Note(
                      title: titleController.text,
                      description: descriptionController.text,
                    );
                    Provider.of<NoteProvider>(
                      context,
                      listen: false,
                    ).EditNotes(widget.index, updateNote);
                    Navigator.pop(context);
                  },
                  child: Text("Update Save", style: TextStyle(fontSize: 17)),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF5F5F5),
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
    );
  }
}
