import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note/db/database_provider.dart';
import 'package:note/screen/add_note.dart';
import 'screen/add_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/AddNote": (context) => AddNote(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EOY Note App"),
      ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (context, noteData) {
          switch (noteData.connectionState) {
            case ConnectionState.waiting:
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                if (noteData.data == Null) {
                  return Center(
                    child: Text("You don't have any notes"),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: noteData.data?.length,
                      itemBuilder: (context, index) {
                        String title = noteData.data[index]['title'];
                        String body = noteData.data[index]['body'];
                        String creation_date =
                            noteData.data[index]['creation_date'];
                        int id = noteData.data[index]['id'];
                        return Card(
                          child: ListTile(
                            title: Text(title),
                            subtitle: Text(body),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/Addnote");
        },
        child: Icon(Icons.note_add),
      ),
    );
  }
}
