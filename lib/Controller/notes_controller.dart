import 'package:get/get.dart';
import 'package:notes_application/Helper/firebase_helper.dart';
import 'package:uuid/uuid.dart';
import '../model/note_model.dart';

class NoteController extends GetxController {
  
  final notes = <NoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  void fetchNotes() async {
    notes.value = await FirebaseHelper.getNotes();
  }

  void addNote(String title, String content) async {
    final note = NoteModel(
      id: const Uuid().v4(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    await FirebaseHelper.addNote(note);
    fetchNotes();
  }

  void deleteNote(String id) async {
    await FirebaseHelper.deleteNote(id);
    fetchNotes();
  }

  void toggleFavorite(NoteModel note) async {
  final updatedNote = NoteModel(
    id: note.id,
    title: note.title,
    content: note.content,
    createdAt: note.createdAt,
    isFavorite: !note.isFavorite,
  );

  await FirebaseHelper.toggleFavorite(note.id, updatedNote.isFavorite);
  fetchNotes(); 
}

}
