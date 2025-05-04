import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_application/Controller/notes_controller.dart';
import 'package:notes_application/Routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    final NoteController note = Get.put(
      NoteController(),
    );
    return GetBuilder(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'Welcome to Scribly',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(Routes.liked);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: note.notes.length,
                      itemBuilder: (context, index) {
                        final currentNote = note.notes[index];
                        return Card(
                          color: Colors.deepPurple.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              currentNote.title,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              currentNote.content,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                currentNote.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: currentNote.isFavorite
                                    ? Colors.redAccent
                                    : Colors.white,
                              ),
                              onPressed: () {
                                note.toggleFavorite(currentNote);
                              },
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Get.dialog(
              Dialog(
                backgroundColor: Colors.deepPurple.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'New Note',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purpleAccent,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: titleController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.purpleAccent,
                        decoration: InputDecoration(
                          hintText: 'Enter title',
                          hintStyle: const TextStyle(
                            color: Colors.white54,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Content input
                      TextField(
                        controller: contentController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 4,
                        cursorColor: Colors.purpleAccent,
                        decoration: InputDecoration(
                          hintText: 'Write something...',
                          hintStyle: const TextStyle(
                            color: Colors.white54,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              if (titleController.text.isNotEmpty &&
                                  contentController.text.isNotEmpty) {
                                note.addNote(titleController.text,
                                    contentController.text);
                                titleController.clear();
                                contentController.clear();
                                Get.back();
                                Get.snackbar(
                                  'Saved',
                                  'Your note has been added.',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.deepPurple,
                                  colorText: Colors.white,
                                );
                              } else {
                                Get.snackbar(
                                  'Error',
                                  'Please fill in all fields.',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
