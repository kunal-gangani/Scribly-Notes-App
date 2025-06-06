class NoteModel {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final bool isFavorite;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'isFavorite': isFavorite,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}
