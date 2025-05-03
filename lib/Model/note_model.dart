class NoteModel {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'createdAt': createdAt.toIso8601String(),
      };

  factory NoteModel.fromMap(Map<String, dynamic> map) => NoteModel(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        createdAt: DateTime.parse(map['createdAt']),
      );
}
