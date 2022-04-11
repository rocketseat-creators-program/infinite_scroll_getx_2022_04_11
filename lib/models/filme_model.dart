import 'dart:convert';

class FilmeModel {
  final String title;
  final String poster;

  FilmeModel({
    required this.title,
    required this.poster,
  });

  Map<String, dynamic> toMap() {
    return {
      'original_title': title,
      'poster_path': poster,
    };
  }

  factory FilmeModel.fromMap(Map<String, dynamic> map) {
    return FilmeModel(
      title: map['original_title'] ?? '',
      poster: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmeModel.fromJson(String source) =>
      FilmeModel.fromMap(json.decode(source));
}
