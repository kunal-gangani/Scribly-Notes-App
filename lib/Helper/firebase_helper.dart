import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/note_model.dart';

class FirebaseHelper {
  static final _firestore = FirebaseFirestore.instance;
  static final _notesRef = _firestore.collection('notes');

  static Future<void> addNote(NoteModel note) async {
    try {
      await _notesRef.doc(note.id).set(note.toMap());
      log("Note added successfully");
    } catch (e) {
      log("Error adding note: $e");
      rethrow;
    }
  }

  static Future<List<NoteModel>> getNotes() async {
    try {
      final snapshot =
          await _notesRef.orderBy('createdAt', descending: true).get();
      return snapshot.docs
          .map((doc) => NoteModel.fromMap(
                doc.data(),
              ))
          .toList();
    } catch (e) {
      log("Error fetching notes: $e");
      return [];
    }
  }

  static Future<void> deleteNote(String id) async {
    try {
      await _notesRef.doc(id).delete();
      log("Note deleted successfully");
    } catch (e) {
      log("Error deleting note: $e");
      rethrow;
    }
  }

  static Future<void> toggleFavorite(String id, bool isFav) async {
    try {
      await _notesRef.doc(id).update({'isFavorite': isFav});
      log("Note favorite status updated");
    } catch (e) {
      log("Error updating favorite status: $e");
      rethrow;
    }
  }
}
