import 'package:test_router/data/author.dart';

class Book {
  Book({
    required this.id,
    required this.title,
    required this.isPopular,
    required this.isNew,
    required this.author,
  });

  final int id;

  final String title;

  final Author author;

  final bool isPopular;

  final bool isNew;
}
