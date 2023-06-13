import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Note Title",
            ),
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
